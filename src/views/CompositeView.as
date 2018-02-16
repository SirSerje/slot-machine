package views {
import flash.events.Event;

import models.IModel;

public class CompositeView extends ComponentView {
    private var _children:Array;

    public function CompositeView(aModel:IModel, aController:Object = null) {
        super(aModel, aController);
        _children = [];
    }

    override public function add(c:ComponentView):void {
        _children.push(c);
    }

    override public function update(event:Event = null):void {
        for each(var c:ComponentView in _children) {
            c.update(event);
        }
    }


    override public function getView():String {
        var allDataToShow:String = "";
        for each(var c:ComponentView in _children) {
            allDataToShow+=(c.getView())+"\n";
        }
        return allDataToShow;
    }
}
}
