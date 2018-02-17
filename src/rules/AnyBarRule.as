package rules {

public class AnyBarRule extends AbstractRule implements IRule {
    public function AnyBarRule() {
    }

    public function checkWinOnLine(value:Array):Boolean {
        var total:int = 0;
        var containsItem:Boolean = false;//variable checks, has combo any item except wild
        var similarItem:Boolean = false; //check, aren't this rule 3 of kind
        for each(var m:String in value) {
            if (m == "BAR1" || m == "BAR2" || m == "BAR3" || m == _wildItem) {
                if(m != _wildItem) {
                    containsItem = true;
                }
                if(_itemName != m) {
                    similarItem = true;
                }
                _itemName = m;
                total++;
            }
        }

        return (total == value.length && containsItem && similarItem);
    }

    public function isRuleAvailableForLine():Boolean {
        return true;
    }

    public function countPay():int {
        return 2;
    }
}
}
