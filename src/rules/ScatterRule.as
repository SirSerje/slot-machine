package rules {
import items.IItem;

import models.ILine;
import models.ScatterLine;

public class ScatterRule extends AbstractRule implements IRule{
    private var _winCount:int = 0;
    private var _expectLine:Class = ScatterLine;

    public function ScatterRule(value:int) {
        super(value);
    }

    public function get name():String {
        return "SCATTER";
    }

    public function checkWinOnLine(value:ILine):Boolean {
        if(!(value is ScatterLine)) {return false;}
        var currentItem:IItem;
        var validItem:IItem;
        var exceptItem:IItem;
        var anyItem:IItem;
        var firstItem:IItem;
        var total:int = 0;
        var any:int = 0;
        var flag:Boolean = false;
        var currentPay:int = 0;
        for (var i:int = 0; i < value.items.length; i++) {
            currentItem = value.items[i];

            //check exception
            for (var j:int = 0; j < _usingItems.length; j++) {
                if(flag) break;
                anyItem = _usingItems[j];
                if (compare(currentItem, anyItem)) {
                    firstItem = currentItem;//TODO was currentItem
                    total++;
                    if(total == _itemsNeedToWin) {
                        flag = true;
                    }
                }
            }
            //end of check exception
        }
        if(total >= 1) {
            var a = firstItem.getPay();
            trace(a);
            if (firstItem.getPay()["cost"+total]) {
                currentPay = firstItem.getPay()["cost"+total];
                _winPay += currentPay;
            }
        }
        return (total >= 1)
    }

    public function countPay(i:int):int {
        return countTotal() + i;
    }
}
}
