package rules {
import configuration.Config;

import models.ILine;
import models.ScatterLine;

public class AnyBarRule extends AbstractRule implements IRule {
    public function AnyBarRule() {
    }

    //TODO заекстендить от аниРуле
    public function checkWinOnLine(value:ILine):Boolean {
        return false;//TODO
        if(value is ScatterLine) return false;
        var total:int = 0;
        var containsItem:Boolean = false;//variable checks, has combo any item except wild
        var similarItem:int = 0;
        _itemName = "";
        for each(var m:String in value.items) {
            if (m == "BAR1" || m == "BAR2" || m == "BAR3" ) {
                if(m != _wildItem) {
                    containsItem = true;
                }
                if(_itemName == m) {
                    similarItem ++;
                }
                _itemName = m;
                total++;
            }
            if(m == _wildItem) {

            }
        }
        return (total == value.length && containsItem && similarItem < (Config.reelQuantity-1));
    }

    public function isRuleAvailableForLine(line:ILine):Boolean {
        return true;
    }

    public function countPay(i:int):int {
        return i + 2;
    }
}
}
