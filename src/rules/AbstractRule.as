package rules {
import flash.utils.getDefinitionByName;
import flash.utils.getQualifiedClassName;

import items.IItem;

public class AbstractRule {
    protected var _exceptItem:String = "BLANK";
    protected var _scatterItem:String = "CHERRY";
    protected var _wildItem:String = "WILD";
    protected var _bonusItem:String = "BONUS";

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
}
}
