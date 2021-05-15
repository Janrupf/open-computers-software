import DrawingContext from "../DrawingContext";
import GuiComponent from "./GuiComponent";

export type ButtonCallback = (clicked: Button, player: string) => void;

export default class Button extends GuiComponent {
    private text: string;
    private readonly callback: ButtonCallback;

    public constructor(x: number, y: number, text: string, callback: ButtonCallback) {
        super(x, y, text.length + 2, 3);
        this.text = text;
        this.callback = callback;
    }

    protected doDraw(context: DrawingContext): void {
        context.setColors(0x000000, 0x00FF00);
        context.rect(this.x, this.y, this.width, this.height);

        context.setColors(0xFFFFFF, 0x00FF00);
        context.write(this.x + 1, this.y + 1, this.text);
    }

    public setText(text: string) {
        this.text = text;
        this.width = text.length + 2;

        this.markDirty();
    }

    onTouched(x: number, y: number, player: string) {
        this.callback(this, player);
    }
}