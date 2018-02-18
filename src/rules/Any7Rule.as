package rules {
import configuration.Config;

import models.ILine;
import models.ScatterLine;

public class Any7Rule extends AbstractRule implements IRule {
    private var _itemName:String;
    public function Any7Rule() {
    }

    public function checkWinOnLine(value:ILine):Boolean {
        if(value is ScatterLine) return false;
        var total:int = 0;
        var containsItem:Boolean = false;//variable checks, has combo any item except wild
        var similarItem:int = 0;
        _itemName = "";
        for each(var m:String in value.items) {
            if (m == "BAR7" || m == "H7" || m == "BAR3" || m == _wildItem) {
                if(m != _wildItem) {
                    containsItem = true;
                }
                if(_itemName == m) {
                    similarItem ++;
                }
                _itemName = m;
                total++;
            }
        }
        return (total == value.length && containsItem && !similarItem < (Config.reelQuantity-1));
    }

    public function isRuleAvailableForLine(line:ILine):Boolean {
        return true;
    }

    public function countPay(i:int):int {
        return i + 10;
    }
}
}

