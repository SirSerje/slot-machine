package {
import flash.events.Event;
import flash.events.EventDispatcher;

public class Model extends EventDispatcher implements IModel {
    public function Model() {
    }

    private var lastKeyPressed:uint = 0;

    public function setKey(key:uint):void {
        this.lastKeyPressed = key;
        fireChange();
    }

    public function getKey():uint {
        return lastKeyPressed;
    }

    //TODO rename
    private function fireChange():void {
        dispatchEvent(new Event(Event.CHANGE));
    }

}
}
