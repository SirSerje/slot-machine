package rules {
public class Any3Rule extends AbstractRule implements IRule {
    public function Any3Rule() {
        super();
    }

    public function checkWinOnLine(value:Array):Boolean {
        var exceptItem:String = "BLANK";
        var previous:String = "";
        var total=1; //TODO обсуславливаемся что 1 совпал
        for each(var m:String in value) {

            if (m == previous && m != exceptItem && previous!="") {
                total++;
            }
            previous = m;

        }

        return total == value.length;
    }

    public function getName():String {
        return "Any3Rule";
    }
}
}
