package rules {

public class Any7Rule extends AbstractRule implements IRule {
    public function Any7Rule() {
    }

    public function checkWinOnLine(value:Array):Boolean {
        var total:int = 0;
        var containsItem:Boolean = false;//variable checks, has combo any item except wild
        var similarItem:Boolean = false; //check, aren't this rule 3 of kind
        _itemName = "";
        for each(var m:String in value) {
            if (m == "H7" || m == "BAR7" || m == _wildItem) {
                if(m != _wildItem) {
                    containsItem = true
                }
                if(_itemName == m) {
                    similarItem = true;
                }
                _itemName = m;
                total++;
            }
        }
        return (total == value.length && containsItem && !similarItem);
    }

    public function isRuleAvailableForLine():Boolean {
        return true;
    }

    public function countPay(i:int):int {
        return i + 10;
    }
}
}

