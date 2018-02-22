package rules {
import flash.utils.getDefinitionByName;
import flash.utils.getQualifiedClassName;
import flash.utils.getQualifiedSuperclassName;

import items.IItem;

public class AbstractRule {
    protected var _winPay:int = 0;
    protected var _exceptItems:Vector.<IItem>;
    protected var _anyItems:Vector.<IItem>;
    protected var _usingItems:Vector.<IItem>;


    protected var _itemsNeedToWin:int;

    public function AbstractRule(itemNeedToWin:int) {
        _itemsNeedToWin = itemNeedToWin;
    }

    protected function compare(a:IItem, b:IItem):Boolean {
        return a is getClass(b);
    }

    protected function getClass(obj:Object):Class {
        return getDefinitionByName(getQualifiedClassName(obj)) as Class;
    }

    protected function superCompare(a:IItem, b:IItem):Boolean {
        trace(getSuperClass(a) , getClass(b));
        return getSuperClass(a) == getClass(b);
    }

    protected function getSuperClass(obj:Object):Class {
        return getDefinitionByName(getQualifiedSuperclassName(obj)) as Class;
    }

    public function setItems(usingItems:Vector.<IItem>, anyItems:Vector.<IItem>, exceptItems:Vector.<IItem>):void {
        _usingItems = usingItems;
        _anyItems = anyItems;
        _exceptItems = exceptItems;
    }

    //In case of real slot payments of any line should be initialized by configs
    protected function countTotal():int {
        var temp:int = _winPay;
        _winPay = 0;
        return temp;
    }


}
}
