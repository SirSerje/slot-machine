package view {
import flash.events.Event;

public class CompositeView extends ComponentView {
    private var aChildren:Array;

    public function CompositeView(aModel:Object, aController:Object = null) {
        super(aModel, aController);
        this.aChildren = new Array(); //TODO think about [] instead
    }

    override public function add(c:ComponentView):void {
        aChildren.push(c);
    }

    override public function update(event:Event = null):void {
        for each(var c:ComponentView in aChildren) {
            c.update(event);
        }
    }


}
}
