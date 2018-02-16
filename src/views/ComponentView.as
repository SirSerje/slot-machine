package views {
import flash.display.Sprite;
import flash.errors.IllegalOperationError;
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
        throw new IllegalOperationError("[ABSTRACT] : add");
    }

    public function remove(c:ComponentView):void {
        throw new IllegalOperationError("[ABSTRACT] : remove");
    }

    public function getChild(n:int):ComponentView {
        throw new IllegalOperationError("[ABSTRACT] : getChild");
        return null;
    }

    //ABSTRACT
    public function update(event:Event = null):void {
        throw new IllegalOperationError("[ABSTRACT] : update");
    }


    public function getView():String {
        throw new Error("NEED TO OVERRIDE at getView");
        return "X";
    }
}
}
