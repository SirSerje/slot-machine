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
        var previous:String = "";
        var total:int = 1;
        _itemName = '"';
        for each(var m:String in value) {
            if(m == _exceptItem) {
                return false
            }
            if (m == previous || m == _wildItem && /*m != _exceptItem && */m != _scatterItem && previous != "") {
                _itemName = m != _wildItem ? m : previous;
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
