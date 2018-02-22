package rules {
import items.IItem;

import models.ILine;

public interface IRule {
    function checkWinOnLine(value:ILine):Boolean
    function countPay(i:int):int;
    function setItems(usingItems:Vector.<IItem>, anyItems:Vector.<IItem>, exceptItems:Vector.<IItem>):void
    function get name():String;
}
}
