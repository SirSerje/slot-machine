package rules {

public class AnyH7Rule extends AbstractRule implements IRule {
    public function AnyH7Rule() {
    }

    public function checkWinOnLine(value:Array):Boolean {
        var total:int = 0;
        var containsItem:Boolean = false;//variable checks, has combo any item except wild
        for each(var m:String in value) {
            if (m == "H7" || m == "BAR7" || m == _wildItem) {
                if(m != _wildItem) {
                    containsItem = true
                }
                _itemName = m;
                total++;
            }
        }

        return (total == value.length && containsItem);
    }

    public function isRuleAvailableForLine():Boolean {
        return true;
    }

    public function countPay():int {
        return 10;
    }
}
}

