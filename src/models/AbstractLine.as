package models {
import flash.errors.IllegalOperationError;

public class AbstractLine implements ILine{
    protected var _items:Array = [];
    public function AbstractLine(items:Array) {
        _items = items;
    }

    public function get length():int {
        return _items.length;
    }

    public function get items():Array {
        return _items;
    }

    public function get type():String {
        return "";
    }
}
}
