import Page from "./Page";
import DrawingContext from "./DrawingContext";

export default class GuiController {
    private readonly pages: Map<string, Page>;
    private readonly context: DrawingContext;

    private activePage?: Page;

    public constructor(gpu: OpenOS.GPU) {
        this.pages = new Map();
        this.context = new DrawingContext(gpu);
    }

    public registerPage(page: Page) {
        this.pages.set(page.getName(), page);
    }

    public handleTouch(x: number, y: number, player: string) {
        if(this.activePage !== undefined) {
            const component = this.activePage.findComponentAt(x, y);
            if(component !== undefined) {
                component!.onTouched(x - component!.x, y - component!.y, player);
            }
        }
    }

    public draw() {
        if(this.activePage !== undefined) {
            this.activePage.draw(this.context);
        }
    }
}
