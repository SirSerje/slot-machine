package rules {
import models.ILine;
import models.ScatterLine;

/**
 * Find win combination only in "3 of kind" items in line
 */
public class ThreeOfKind extends AbstractRule implements IRule {
    private var _itemName:String;

    public function ThreeOfKind() {
        super();
    }

    public function checkWinOnLine(value:ILine):Boolean {
        if(value is ScatterLine) {
            return false;
        }
        var previous:String = "";
        var total:int = 0;
        var wild:int = 0;
        var m:String = "";

        for (var i:int = 0; i < value.items.length; i++) {
            m = value.items[i];
            if (m == _exceptItem) return false
            if (((m == previous || previous == _wildItem || i==0) && m != _bonusItem && m != _scatterItem) || m == _wildItem) {
                if (m == _wildItem) {
                    wild++;
                    if ((wild+1) == value.length) {

                        _itemName = _wildItem;

                        return true;
                    }
                }

                total++;

                if (m != _wildItem) {
                    _itemName = m;
                }
                previous = m;
            }
        }

        return (total) == value.length;
    }

    public function isRuleAvailableForLine(line:ILine):Boolean {
        return true;
    }

    //In case of real slot payments of any line should be initialized by configs
    public function countPay(i:int):int {
        switch (_itemName) {
            case "WILD":
                return i + 1000;
            case "H7":
                return i + 100;
            case "BAR7":
                return i + 25;
            case "BAR3":
                return i + 5;
            case "BAR2":
                return i + 4;
            case "BAR1":
                return i + 3;
        }

        return i + 0;
    }
}
}
