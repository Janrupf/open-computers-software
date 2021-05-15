import * as Component from "component";
import * as Event from "event";

import GuiController from "./gui/GuiController";

print("SiteControl version 1.0.0 starting up!");
if (!Component.gpu) {
    throw new Error("SiteControl requires a GPU!");
}

const controller = new GuiController(Component.gpu);

function tickTimer() {
    Event.push("tickProgram");
}

const timerId = Event.timer(0.2, tickTimer, Infinity);

while (true) {
    const [event, ...data] = Event.pullMultiple("touch", "interrupted", "tickProgram");

    const terminateLoop = (() => {
        switch (event) {
            case "tickProgram": {
                controller.draw();
                break;
            }

            case "touch": {
                controller.handleTouch(data[0], data[1], data[2]);
                controller.draw();
                break;
            }

            case "interrupted": {
                return true;
            }
        }

        return false;
    })();

    if(terminateLoop) {
        break;
    }
}

Event.cancel(timerId);
