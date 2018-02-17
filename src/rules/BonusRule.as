package rules {
public class BonusRule extends AbstractRule implements IRule {
    public function BonusRule() {
        super();
    }

    public function checkWinOnLine(value:Array):Boolean {
        return false;
    }

    public function isRuleAvailableForLine():Boolean {
        return true;
    }

    public function countPay():int {
        return 0;
    }
}
}
