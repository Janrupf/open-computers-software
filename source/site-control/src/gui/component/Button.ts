import DrawingContext from "../DrawingContext";
import GuiComponent from "./GuiComponent";

export type ButtonCallback = (clicked: Button, player: string) => void;

export default class Button extends GuiComponent {
    private text: string;
    private readonly callback: ButtonCallback;

    private active: boolean;

    public constructor(x: number, y: number, width: number, text: string, callback: ButtonCallback) {
        super(x, y, width, 3);
        this.text = text;
        this.callback = callback;

        this.active = false;
    }

    protected doDraw(context: DrawingContext): void {
        if(this.active) {
            context.setColors(0xFFFFFF, 0xDD0000);
        } else {
            context.setColors(0xFFFFFF, 0x00FF00);
        }

        context.rect(this.x, this.y, this.width, this.height);

        const startX = (this.width / 2) - (this.text.length / 2) + this.x;
        context.write(startX, this.y + 1, this.text);
    }

    public setText(text: string) {
        this.text = text;
        this.markDirty();
    }

    onTouched(x: number, y: number, player: string) {
        this.active = true;
        this.callback(this, player);
        this.markDirty();
    }
}