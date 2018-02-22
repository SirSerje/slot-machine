package rules {
import items.IItem;

import models.ILine;
import models.ScatterLine;

/**
 * Find win combination only in "3 of kind" items in line
 */
public class ThreeOfKindRule extends AbstractRule implements IRule {

    public function ThreeOfKindRule(itemsNeedToWin:int) {
        super(itemsNeedToWin);
    }

    public function checkWinOnLine(value:ILine):Boolean {
        if(value is ScatterLine) {return false;}
        var currentItem:IItem;
        var exceptItem:IItem;
        var anyItem:IItem;
        var firstItem:IItem;
        var total:int = 0
        var any:int = 0;
        var flag:Boolean = false;
        var currentPay:int = 0;
        for (var i:int = 0; i < value.items.length; i++) {
            currentItem = value.items[i];

            //check exception
            for (var j:int = 0; j < _exceptItems.length; j++) {
                exceptItem = _exceptItems[j];
                if (compare(currentItem, exceptItem)) {
                    return false
                }
            }
            //end of check exception

            //check for wild
            for (var k:int = 0; k < _anyItems.length; k++) {
                anyItem = _anyItems[k];
                if (compare(currentItem, anyItem)) {
                    any++;
                } else {
                    if(!flag) {
                    firstItem = currentItem;
                    flag = true;
                    continue;
                    }
                }
            }
            //end check for wild


            //if match to origin, add it
            if (firstItem && compare(currentItem, firstItem)) {
                total += 1;
            }
            //end of

        }
        if ((total + any) == _itemsNeedToWin) {
            if (firstItem == null) {
                firstItem = currentItem;
            }

            if (firstItem.getPay()["cost"]) {
                    currentPay = firstItem.getPay()["cost"];
                    _winPay += currentPay;
                }
        }
        return (/*(any != _itemsNeedToWin) &&*/ ((total + any) == _itemsNeedToWin))
    }


    public function countPay(i:int):int {
        return countTotal() + i;
    }

    //In case of real slot payments of any line should be initialized by configs
    private function countTotal():int {
        var temp:int = _winPay;
        _winPay = 0;
        return temp;
    }

    public function get name():String {
        return "3 OF KIND";
    }
}
}
