package models {
import items.IItem;

public class AbstractLine implements ILine {
    public function AbstractLine(items:Vector.<IItem>) {
        _items = items;
    }

    protected var _items:Vector.<IItem> = new Vector.<IItem>();

    public function get items():Vector.<IItem> {
        return _items;
    }

    public function get length():int {
        return _items.length;
    }

    public function get lineType():String {
        return "ABSTRACT TYPE";
    }
}
}
