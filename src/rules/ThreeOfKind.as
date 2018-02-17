package rules {

/**
 * Find win combination only in "3 of kind" items in line
 */
public class ThreeOfKind extends AbstractRule implements IRule {

    public function ThreeOfKind() {
        super();
    }

    //TODO WILD может заменить любой символ, кроме BONUS и CHERRY символа.
    //TODO checking for scatter is bad
    public function checkWinOnLine(value:Array):Boolean {
        trace("CHECK WIN ON LINE")

        var previous:String = "";
        var total:int = 1;
        for each(var m:String in value) {
            if (m == previous || m == _wildItem && m != _exceptItem && m != _scatterItem && previous != "") {
                _itemName = m != _wildItem ? m : previous;
                trace(">>", _itemName)
                total++;
            }
            if (m != _wildItem) {
                previous = m;
            }
        }
        return total == value.length;
    }

    public function isRuleAvailableForLine():Boolean {
        return true;
    }

    //In case of real slot payments of any line should be initialized by configs
    public function countPay():int {
        switch (_itemName) {
            case "WILD":
                return 1000;
            case "H7":
                return 100;
                break;
            case "BAR7":
                return 25;
            case "BAR3":
                return 5;
            case "BAR2":
                return 4;
            case "BAR1":
                return 3;
        }

        return 0;
    }
}
}
