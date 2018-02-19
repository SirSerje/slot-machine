package rules {

import models.ILine;
import models.ScatterLine;

public class AnyBarRule extends AbstractRule implements IRule {
    public function AnyBarRule() {
    }

    public function checkWinOnLine(value:ILine):Boolean {
        if(value is ScatterLine) return false;
        var total:int = 0;
        var similarItem:Boolean = false;
        var previous:String = "";
        var b:int = 0;
        var m:String = "";
        for(var i:int = 0; i<value.items.length; i++){
            m = value.items[i];
            if (m == _scatterItem || m == _exceptItem || m == _bonusItem) {
                return false;
            }

            if (m == _wildItem) {
                b++;
                if ((b) == value.length) {
                    return false;
                }
            }

            if (m == "BAR1" || m == "BAR2" || m == "BAR3" || m == _wildItem) {
                if (previous != "" && m == previous || (i==(value.items.length-1) && previous == "")) {
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

    public function countPay(i:int):int {
        return i + 2;
    }

    public function get name():String {
        return "ANY BAR";
    }
}
}
