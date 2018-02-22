package rules {
import items.IItem;

import models.ILine;
import models.ScatterLine;

public class Any7Rule extends AbstractRule implements IRule {

    public function Any7Rule(itemNeedToWin) {
        super(itemNeedToWin);
    }

    public function checkWinOnLine(value:ILine):Boolean {
        var currentItem:IItem;
        var exceptItem:IItem;
        var anyItem:IItem;
        var firstItem:IItem;
        var total:int = 0
        var variety:int = 0
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
                    if (!flag) {
                        firstItem = currentItem;
                        flag = true;
                        continue;
                    }
                }
            }
            //end check for wild


            //if match to origin, add it
            if (firstItem && compare(currentItem, firstItem)) { //TODO тут надо супер заюзать
                total += 1;
                if(!compare(currentItem, firstItem)) {
                    variety+=1
                }

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
        return (((total + any) == _itemsNeedToWin) && total > 1 && variety > 1) //because X Wild X = three of kind
    }



    public function countPay(i:int):int {
        return i + 10;
    }

    public function get name():String {
        return "ANY7";
    }


}
}

