import * as FS from "filesystem";
import * as Shell from "shell";

function getProxy(...all: any[]) {
    return all[0];
}

const proxy = getProxy(...$vararg);
FS.mount(proxy, "/home");

Shell.setWorkingDirectory("//home");
Shell.execute("site-control.bin");
