package rules {
import models.ILine;

public class WildRule extends AbstractRule implements IRule {
    public function WildRule() {
    }

    public function checkWinOnLine(value:ILine):Boolean {
        return false;
    }

    public function isRuleAvailableForLine(line:ILine):Boolean {
        return false;
    }

    public function countPay(i:int):int {
        return 0;
    }
}
}
