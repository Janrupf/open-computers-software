import DrawingContext from "../DrawingContext";

export default abstract class GuiComponent {
    private _x: number;
    private _y: number;
    private _width: number;
    private _height: number;

    private dirty: boolean;

    protected constructor(x: number, y: number, width: number, height: number) {
        this._x = x;
        this._y = y;
        this._width = width;
        this._height = height;

        this.dirty = true;
    }

    public set x(value: number) {
        if(value !== this._x) {
            this._x = value;
            this.markDirty();
        }
    }

    public get x(): number {
        return this._x;
    }

    public set y(value: number) {
        if(value !== this._y) {
            this._y = value;
            this.markDirty();
        }
    }

    public get y(): number {
        return this._y;
    }

    public get width(): number {
        return this._width;
    }

    public set width(value: number) {
        if(value !== this._width) {
            this._width = value;
            this.markDirty();
        }
    }

    public get height(): number {
        return this._height;
    }

    public set height(value: number) {
        if(value !== this._height) {
            this._height = value;
            this.markDirty();
        }
    }

    public markDirty() {
        this.dirty = true;
    }

    public draw(context: DrawingContext) {
        this.doDraw(context);
        context.setColors(0xFFFFFF, 0x000000);
    }

    public isDirty(): boolean {
        return this.dirty;
    }

    public clearDirty() {
        this.dirty = false;
    }

    public onTouched(x: number, y: number, player: string) {}

    protected abstract doDraw(context: DrawingContext): void;
}