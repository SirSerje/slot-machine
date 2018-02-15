package rules {
public class Any3Rule extends AbstractRule implements IRule {
    public function Any3Rule() {
        super();
    }

    public function checkWinOnLine(value:Array):Boolean {
        var exceptItem:String = "BLANK";
        var previous:String = "";

        var current:String;
        var total=0;
        for (var i:int = 0; i < value.length; i++) {
            current = value[i];

            if (current == previous && current != exceptItem) {
                total++
            }
            previous = current;
        }

        return total == value.length;
    }

    public function getName():String {
        return "Any3Rule";
    }
}
}
