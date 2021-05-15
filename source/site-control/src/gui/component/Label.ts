import GuiComponent from "./GuiComponent";
import DrawingContext from "../DrawingContext";

export default class Label extends GuiComponent {
    private text: string;

    public constructor(x: number, y: number, text: string) {
        super(x, y, text.length, 1);

        this.text = text;
    }

    public setText(text: string) {
        this.text = text;
        this.markDirty();
    }

    protected doDraw(context: DrawingContext): void {
        context.write(this.x, this.y, this.text);
    }
}