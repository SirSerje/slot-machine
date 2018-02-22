package rules {
import flash.utils.getDefinitionByName;
import flash.utils.getQualifiedClassName;

import items.IItem;

import models.ILine;

/**
 * Find win combination only in "3 of kind" items in line
 */
public class ThreeOfKindRule extends AbstractRule implements IRule {
    private var _winPay:int = 0;
    private var _exceptItems:Vector.<IItem>;
    private var _anyItems:Vector.<IItem>;
    private var _usingItems:Vector.<IItem>;



    public function ThreeOfKindRule(itemsNeedToWin:int) {
        super(itemsNeedToWin);
    }

    public function setItems(usingItems:Vector.<IItem>, anyItems:Vector.<IItem>, exceptItems:Vector.<IItem>):void {
        _usingItems = usingItems
        _anyItems = anyItems
        _exceptItems = exceptItems
    }

    public function checkWinOnLine(value:ILine):Boolean {
        var currentItem:IItem;
        var exceptItem:IItem;
        var anyItem:IItem;
        var firstItem:IItem;
        var total:int = 0
        var any:int = 0;
        var flag:Boolean = false;
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
                }
            }
            //end check for wild

            //get first value
            if(i==0) {
                firstItem = currentItem;
            }
            //end of get first value

            //if match to origin, add it
            if (compare(currentItem, firstItem)) {
                total += 1;
            }
            //end of

        }
        if ((total + any) == _itemsNeedToWin) {
            _winPay += currentItem.getPay()["cost"];
        }
        return ((any != _itemsNeedToWin) && ((total + any) == _itemsNeedToWin))
    }


    public function countPay(i:int):int {
        return countTotal() + i;
    }

    //In case of real slot payments of any line should be initialized by configs
    private function countTotal():int {
        return _winPay;
    }

    public function get name():String {
        return "3 OF KIND";
    }
}
}
