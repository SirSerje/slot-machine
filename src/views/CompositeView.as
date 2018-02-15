package views {
import flash.events.Event;

public class CompositeView extends ComponentView {
    private var aChildren:Array;

    public function CompositeView(aModel:Object, aController:Object = null) {
        super(aModel, aController);
        this.aChildren = [];
    }

    override public function add(c:ComponentView):void {
        aChildren.push(c);
    }

    override public function update(event:Event = null):void {
        for each(var c:ComponentView in aChildren) {
            c.update(event);
        }
    }


    override public function getView():String {
        var all:String = "";
        for each(var c:ComponentView in aChildren) {
            all+=(c.getView())+"\n";//TODO поменять += на феншуйное решение
        }

        return all;
    }
}
}
