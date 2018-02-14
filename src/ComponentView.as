package {
import flash.display.Sprite;
import flash.errors.IllegalOperationError;
import flash.events.Event;

public class ComponentView extends Sprite {
    public function ComponentView(aModel:Object, aController:Object = null) {
        this.model = aModel;
        this.controller = aController;
    }
    protected var model:Object;
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

    }


}
}
