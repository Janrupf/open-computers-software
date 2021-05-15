import * as FS from "filesystem";
import * as Process from "process";

function getProxy(...all: any[]) {
    return all[0];
}

const proxy = getProxy(...$vararg);
FS.mount(proxy, "/home");
