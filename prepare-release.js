#!/usr/bin/env node
const path = require("path");
const fs = require("fs");
const childProcess = require("child_process");

function copyFolderRecursiveSync(source, targetFolder) {
    let files = [];

    // Check if folder needs to be created or integrated
    if (!fs.existsSync(targetFolder)) {
        fs.mkdirSync(targetFolder);
    }

    // Copy
    if (fs.lstatSync(source).isDirectory()) {
        files = fs.readdirSync(source);
        files.forEach((file) => {
            const curSource = path.join(source, file);
            if (fs.lstatSync(curSource).isDirectory()) {
                copyFolderRecursiveSync(curSource, path.resolve(targetFolder, file));
            } else {
                fs.copyFileSync(curSource, path.resolve(targetFolder, file));
            }
        });
    }
}

const sourceDir = path.resolve(__dirname, "source");
const npx = path.resolve(path.dirname(path.resolve(process.argv[0])), "npx");
console.log(`Using npx at ${npx}`);

const packageInfos = new Map();

for (const dirName of fs.readdirSync(sourceDir)) {
    const dir = path.resolve(sourceDir, dirName);
    const packageName = path.basename(dir);
    const distDir = path.resolve(dir, "dist");
    fs.rmdirSync(distDir, {
        recursive: true
    });

    console.log(`Processing package ${packageName} in ${dir}...`);


    console.log("Running yarn install...");
    const installProc = childProcess.spawnSync(npx, ["yarn", "install"], {
        cwd: dir,
        stdio: "pipe",
        shell: true
    });

    if (installProc.error) {
        throw installProc.error;
    }

    console.log("Building package...");
    const buildProc = childProcess.spawnSync(npx, ["yarn", "build"], {
        cwd: dir,
        stdio: "inherit",
        shell: true
    });

    if (buildProc.error) {
        throw buildProc.error;
    }

    const outputDir = path.resolve(__dirname, "built", packageName);
    if (fs.existsSync(outputDir)) {
        fs.rmdirSync(outputDir, {
            recursive: true
        });
    }

    console.log(`Done with building, creating output in ${outputDir}`);
    copyFolderRecursiveSync(distDir, outputDir);

    const packageJson = JSON.parse(fs.readFileSync(path.join(dir, "package.json")).toString("utf-8"));

    const binFiles = [];
    const libFiles = [];

    for (const fileName of fs.readdirSync(outputDir)) {
        const file = path.resolve(outputDir, fileName);
        const relativeFile = path.relative(__dirname, file);
        const stat = fs.statSync(file);

        if (stat.isDirectory()) {
            libFiles.push(`:master/${relativeFile}`);
        } else if (stat.isFile()) {
            if(path.basename(file) === "autorun.lua") {
                continue;
            }

            if (file.endsWith(".bin.lua")) {
                const newFile = file.replace(".bin.lua", ".lua")
                fs.renameSync(file, newFile);
                binFiles.push(`master/${path.relative(__dirname, newFile)}`);
            } else {
                libFiles.push(`master/${relativeFile}`);
            }
        } else {
            throw new Error(`Unsupported file type for ${file}`);
        }
    }

    const packageMeta = {
        name: packageJson.name,
        description: packageJson.description,
        authors: packageJson.author,
        note: "Auto generated package from typescript",
        repo: `tree/master/source/${packageName}`,
        files: (() => {
            const files = new Map();

            for (const file of binFiles) {
                files.set(file, "/bin");
            }

            for (const file of libFiles) {
                if(file.startsWith(":")) {
                    files.set(file, `/lib/${path.basename(file)}`);
                } else {
                    files.set(file, "/lib");
                }
            }

            return files;
        })()
    };

    packageInfos.set(packageName, packageMeta);
    console.log(`Done generating package meta for ${packageName}:`);
    console.dir(packageMeta);
}

console.info("Collected package metadata for all packages, generating programs.cfg...");

function serializeToLua(obj, indentationLevel) {
    if (typeof (indentationLevel) === "undefined") {
        indentationLevel = 0;
    }

    switch (typeof (obj)) {
        case "function":
            throw new Error("Can't serialize functions to lua");

        case "number":
        case "bigint":
        case "symbol":
            return obj.toString();

        case "boolean":
            return obj ? "true" : "false";

        case "undefined":
            return "nil";

        case "string":
            return `"${obj}"`;

        case "object":
            let str = "{\n";

        function indent(str, noOverIndent) {
            return `${" ".repeat(indentationLevel + (noOverIndent ? 0 : 2))}${str}`;
        }

        function writeKeyValue(value, key) {
            str += indent(`[${serializeToLua(key, indentationLevel + 2)}] = ${serializeToLua(value, indentationLevel + 2)},\n`)
        }

            if (obj instanceof Map) {
                obj.forEach(writeKeyValue);
            } else {
                for (const k in obj) {
                    if (obj.hasOwnProperty(k)) {
                        writeKeyValue(obj[k], k);
                    }
                }
            }

            str = str.substr(0, str.length - 2);
            str += "\n";
            str += indent("}", true);

            return str;
    }
}

fs.writeFileSync(path.resolve(__dirname, "programs.cfg"), serializeToLua(packageInfos));

