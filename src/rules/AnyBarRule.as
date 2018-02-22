package rules {

import items.IItem;

import models.ILine;
import models.ScatterLine;

public class AnyBarRule extends AbstractRule implements IRule {

    public function AnyBarRule(value:int) {
        super(value);
    }

    public function checkWinOnLine(value:ILine):Boolean {
        if(value is ScatterLine) {return false;}
        var currentItem:IItem;
        var validItem:IItem;
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
                    if(any == value.length) {
                        return false;
                    }
                }
            }
            //end check for wild


            //if match to origin, add it
            for (var m:int = 0; m <_usingItems.length; m++) {
                validItem = _usingItems[m];
                if (superCompare(currentItem, validItem)) {
                    total += 1;
                }
            }
            //end of

        }


        //
        if ((total + any) == _itemsNeedToWin) {
            if (firstItem == null) {
                firstItem = currentItem;
            }

            if (firstItem.getPay()["cost_any"]) {
                currentPay = firstItem.getPay()["cost_any"];
                _winPay += currentPay;
            }
        }
        return (((total + any) == _itemsNeedToWin) && total > 1)
    }


    public function countPay(i:int):int {
        return i + 2;
    }

    public function get name():String {
        return "ANY BAR";
    }
}
}
