package rules {

import items.IItem;

import models.BonusLine;
import models.ILine;

public class BonusRule extends AbstractRule implements IRule {
    public function BonusRule(usingItems:Vector.<IItem>, anyItems:Vector.<IItem>, exceptItems:Vector.<IItem>, itemNeedToWin:int = 0) {
        super(usingItems, anyItems, exceptItems, itemNeedToWin);
    }
    private var _winItem:IItem;

    public function get name():String {
        return "BONUS";
    }

    public function checkWinOnLine(value:ILine):Boolean {
        if (!(value is BonusLine)) {
            return false;
        }
        var currentItem:IItem;


        var anyItem:IItem;
        var firstItem:IItem;
        var total:int = 0;

        var flag:Boolean = false;
        var currentPay:int = 0;
        for (var i:int = 0; i < value.items.length; i++) {
            currentItem = value.items[i];
            //check exception
            for (var j:int = 0; j < _usingItems.length; j++) {
                if (flag) break;
                anyItem = _usingItems[j];
                if (compare(currentItem, anyItem)) {
                    firstItem = currentItem;
                    total++;
                    if (total == _itemsNeedToWin) {
                        flag = true;
                    }
                }
            }
            //end of check exception
        }
        if (total == _itemsNeedToWin) {
            if (firstItem.getPay()["cost"]) {
                currentPay = firstItem.getPay()["cost"];
                _winItem = firstItem;
                _winPay += currentPay;
            }
        }
        return (total == _itemsNeedToWin)
    }

    public function countPay(i:int):int {
        if (i == 0) {
            return countTotal();
        }
        return i * _winItem.getPay()["costBonus"];
    }

}
}
