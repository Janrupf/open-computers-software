import GuiComponent from "./component/GuiComponent";
import DrawingContext from "./DrawingContext";

export default class Page {
    private readonly name: string;
    private readonly components: GuiComponent[];

    private dirty: boolean;

    public constructor(name: string) {
        this.name = name;
        this.components = [];
        this.dirty = false;
    }

    public add(component: GuiComponent) {
        this.components.push(component);
    }

    public findComponentAt(x: number, y: number): GuiComponent | null {
        for (let i = this.components.length - 1; i >= 0; i--) {
            const checkingComponent = this.components[i];

            if (Page.isPointInRect(
                checkingComponent.x,
                checkingComponent.y,
                checkingComponent.width,
                checkingComponent.height,
                x,
                y
            )) {
                return checkingComponent;
            }
        }

        return null
    }

    public getName(): string {
        return this.name;
    }

    public draw(context: DrawingContext) {
        for (const component of this.components) {
            if(this.dirty || component.isDirty()) {
                component.draw(context);
                component.clearDirty();
            }
        }

        this.dirty = false;
    }

    public isDirty(): boolean {
        return this.dirty || this.components.some(c => c.isDirty());
    }

    public markDirty() {
        this.dirty = true;
    }

    private static isPointInRect(rectX: number, rectY: number, rectWidth: number, rectHeight: number, pointX: number, pointY: number) {
        return pointX >= rectY && pointX <= (rectX + rectWidth) && pointY >= rectY && pointY <= (rectY + rectHeight);
    }
}