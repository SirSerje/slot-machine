package rules {

/**
 * Find win combination only in "3 of kind" items in line
 */
public class Any3Rule extends AbstractRule implements IRule {
    private var _itemName:String;

    public function Any3Rule() {
        super();
    }

    public function checkWinOnLine(value:Array):Boolean {
        var previous:String = "";
        var total:int = 1;
        for each(var m:String in value) {
            if (m == previous && m != _exceptItem && previous!="") {
                _itemName=m;
                total++;
            }
            previous = m;
        }

        return total == value.length;
    }

    public function getName():String {
        return "Any3Rule";
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
