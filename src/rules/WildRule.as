package rules {
import items.IItem;

import models.ILine;

public class WildRule extends AbstractRule implements IRule {
    public function WildRule(usingItems:Vector.<IItem>, anyItems:Vector.<IItem>, exceptItems:Vector.<IItem>, itemNeedToWin:int=0) {
        super(usingItems, anyItems, exceptItems, itemNeedToWin);
    }

    public function checkWinOnLine(value:ILine):Boolean {
        return false;
    }

    public function countPay(i:int):int {
        return 0;
    }

    public function get name():String {
        return "WILD RULE";
    }


}
}
