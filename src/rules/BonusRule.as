package rules {

import Config;

import items.IItem;

import models.ILine;
import models.ScatterLine;

public class BonusRule extends AbstractRule implements IRule {
    public function BonusRule() {
        super(3);
    }

    public function checkWinOnLine(value:ILine):Boolean {
        if (!(value is ScatterLine)) return false;
        var total:int = 0;
        for each(var m:String in value.items) {
            if(m==_bonusItem) {
                total++
            }
        }
        return false;
    }

    public function countPay(i:int):int {
        if(i == 0) {
            return 10;
        }
        return i * 1000;
    }

    public function get name():String {
        return "BONUS";
    }

    public function setItems(usingItems:Vector.<IItem>, anyItems:Vector.<IItem>, exceptItems:Vector.<IItem>):void {
    }
}
}
