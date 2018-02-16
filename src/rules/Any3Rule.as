package rules {
public class Any3Rule extends AbstractRule implements IRule {
    private var itemName:String;

    public function Any3Rule() {
        super();
    }

    public function checkWinOnLine(value:Array):Boolean {
        var exceptItem:String = "BLANK";
        var previous:String = "";
        var total=1; //TODO обсуславливаемся что 1 совпал
        for each(var m:String in value) {

            if (m == previous && m != exceptItem && previous!="") {
                itemName=m;
                total++;
            }
            previous = m;
        }

        return total == value.length;
    }

    public function getName():String {
        return "Any3Rule";
    }

    //TODO после рентерна не нужен брейк, выпилить его
    public function countPay():int {
        switch(itemName) {
            case "WILD":
                return 1000;
                break;
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
                break

        }
        return 0;
    }
}
}
