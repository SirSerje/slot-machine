package views {
import flash.display.Sprite;
import flash.errors.IllegalOperationError;
import flash.events.Event;

import folder_models.IModel;

public class ComponentView extends Sprite {
    public function ComponentView(aModel:IModel, aController:Object = null) {
        this.model = aModel;
        this.controller = aController;
    }
    protected var model:IModel;
    protected var controller:Object;

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
