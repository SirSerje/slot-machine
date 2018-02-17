package rules {

public class WildRule extends AbstractRule implements IRule {
    public function WildRule() {
    }

    public function checkWinOnLine(value:Array):Boolean {
        return false;
    }

    public function isRuleAvailableForLine():Boolean {
        return false;
    }

    public function countPay(i:int):int {
        return 0;
    }
}
}
