package models {
import items.IItem;

public interface IReel {
    function get items():Vector.<IItem>;

    function getDisplaySize():int;

    function getItemAt(value:int):IItem;
}
}
