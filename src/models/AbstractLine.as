package models {
import flash.errors.IllegalOperationError;

import items.IItem;

public class AbstractLine implements ILine{
    protected var _items:Vector.<IItem> = new Vector.<IItem>();
    public function AbstractLine(items:Vector.<IItem>) {
        _items = items;
    }

    public function get length():int {
        return _items.length;
    }

    public function get items():Vector.<IItem> {
        return _items;
    }

    public function get lineType():String {
        return "ABSTRACT TYPE";
    }
}
}
