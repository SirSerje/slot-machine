package views {
import flash.display.Sprite;
import flash.events.Event;

import models.IModel;

public class ComponentView extends Sprite {
    protected var _model:IModel;
    protected var _controller:Object;

    public function ComponentView(aModel:IModel, aController:Object = null) {
        _model = aModel;
        _controller = aController;
    }

    public function add(c:ComponentView):void {
        trace("Method is abstract, override is needed");
    }

    public function update(event:Event = null):void {
        trace("Method is abstract, override is needed");
    }

    public function getView():String {
        trace("Method is abstract, override is needed");
        return "";
    }
}
}
