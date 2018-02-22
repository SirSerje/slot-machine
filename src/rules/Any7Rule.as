package rules {
import items.IItem;

import models.ILine;
import models.ScatterLine;

public class Any7Rule extends AbstractRule implements IRule {
    private var _winPay:int = 0;
    private var _exceptItems:Vector.<IItem>;
    private var _anyItems:Vector.<IItem>;
    private var _usingItems:Vector.<IItem>;

    public function Any7Rule(itemNeedToWin) {
        super(itemNeedToWin);
    }

    public function checkWinOnLine(value:ILine):Boolean {
        var currentItem:IItem;
        var exceptItem:IItem;
        var anyItem:IItem;
        var firstItem:IItem;
        var total:int = 0
        var any:int = 0;
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

            total+=1;

        }
        if ((total + any) == _itemsNeedToWin) {
            _winPay += currentItem.getPay()["cost_any"];
        }
        return ((any != _itemsNeedToWin) && ((total + any) == _itemsNeedToWin))
    }

    private function suits(arr:Array):Boolean {
        var current:String;
        var previous:String;
        var array:Array = [];
        for each(var j:String in arr) {
            if (j != _wildItem) {
                array.push(j);
            }
        }
        for (var i:int = 0; i < array.length; i++) {
            current = array[i];
            if (i > 0) {
                previous = array[i - 1];
                if (current != previous) {
                    return true
                }
            }

        }
        return false;
    }

    public function countPay(i:int):int {
        return i + 10;
    }

    public function get name():String {
        return "ANY7";
    }

    public function setItems(usingItems:Vector.<IItem>, anyItems:Vector.<IItem>, exceptItems:Vector.<IItem>):void {
        _usingItems = usingItems
        _anyItems = anyItems
        _exceptItems = exceptItems

    }
}
}

