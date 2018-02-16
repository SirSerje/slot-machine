package rules {
public class WildRule extends AbstractRule implements IRule {
    public function WildRule() {
        super();
    }

    public function checkWinOnLine(value:Array):Boolean {
        var exceptItem:String = "BLANK";


        return false;
    }

    public function getName():String {
        return "WildRule";
    }

    public function countPay():int {
        return 0;
    }
}
}
