export default class DrawingContext {
    private readonly gpu: OpenOS.GPU;

    public constructor(gpu: OpenOS.GPU) {
        this.gpu = gpu;
    }

    public setColors(foreground: number, background: number) {
        this.gpu.setForeground(foreground, false);
        this.gpu.setBackground(background, false);
    }

    public write(x: number, y: number, text: string) {
        this.gpu.set(x, y, text);
    }

    public rect(x: number, y: number, width: number, height: number, fill?: string) {
        if(fill === undefined) {
            fill = " ";
        }

        this.gpu.fill(x, y, width, height, fill);
    }
}