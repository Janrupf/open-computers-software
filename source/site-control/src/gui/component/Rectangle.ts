import GuiComponent from "./GuiComponent";
import DrawingContext from "../DrawingContext";

export default class Rectangle extends GuiComponent {
    private background: number;

    public constructor(x: number, y: number, width: number, height: number) {
        super(x, y, width, height);

        this.background = 0x0000BB;
    }

    public setBackground(value: number) {
        this.background = value;
    }

    protected doDraw(context: DrawingContext) {
        context.setColors(0xFFFFFF, this.background);
        context.rect(this.x, this.y, this.width, this.height);
    }
}