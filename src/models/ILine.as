package models {
import items.IItem;

public interface ILine {
    function get length():int;

    function get items():Vector.<IItem>;
}
}
