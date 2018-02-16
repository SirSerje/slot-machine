package rules {

/**
 * RuleSet class knows about all rule types in slot
 */
public class RuleSet {
    private var _availableRules:Array = [];

    public function RuleSet() {

    }

    /**
     * Method check, what kind of lines have prize combinations
     * @param itemOnLines - all possible lines, which user see on display
     * @return - array of win combinations
     *
     */
    public function matchByCurrentRules(itemOnLines:Array):Array {
        var winComboName:Array = [];
        for each(var line:Array in itemOnLines) {
            for each (var rule:IRule in _availableRules) {
                if (rule.checkWinOnLine(line)) {
                    winComboName.push(rule);
                }
            }
        }
        return winComboName;
    }

    public function add(rule:IRule):void {
        _availableRules.push(rule);
    }
}
}
