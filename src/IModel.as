package {
import flash.events.IEventDispatcher;

public interface IModel extends IEventDispatcher {
    function setKey(key:uint):void
    function getKey():uint

}
}
