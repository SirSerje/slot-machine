package rules {
import configuration.Config;

import models.ILine;
import models.ScatterLine;

public class AnyBarRule extends AbstractRule implements IRule {
    private var _itemName:String;
    public function AnyBarRule() {
    }

    //TODO заекстендить от аниРуле
    public function checkWinOnLine(value:ILine):Boolean {

        if(value is ScatterLine) return false;
        var total:int = 0;
        var containsItem:Boolean = false;//variable checks, has combo any item except wild
        var similarItem:Boolean = false;
        var previous:String = "";
        var b:int = 0;
//        _itemName = "";
        for each(var m:String in value.items) {
            if (m == _wildItem) {
                b++;
                if ((b) == value.length) {
                    return false;
                }
            }
            if (m == _bonusItem && m == _scatterItem) {
                return false;
            }
            if (m == "BAR1" || m == "BAR2" || m == "BAR3" || m == _wildItem) {
                if (previous != "" && m == previous) {
                    similarItem = true;
                }
                if (m != _wildItem) {
                    previous = m;
                }
                total++
            }
        }
        return (total == value.length && !similarItem);
    }

    public function isRuleAvailableForLine(line:ILine):Boolean {
        return true;
    }

    public function countPay(i:int):int {
        return i + 2;
    }

    public function get name():String {
        return "ANY BAR";
    }
}
}
