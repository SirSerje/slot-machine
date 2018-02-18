package rules {
import models.ILine;

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
        //TODO серьезная проблема: линия из 9 хавается остальными линиям
        //TODO запилить линии и замутить rule.isAvailable(line.type())
        var winComboName:Array = [];
        var line:ILine;
        var rule:IRule;
        for(var i:int = 0; i< itemOnLines.length; i++) {
            line = itemOnLines[i];
            for (var  j:int = 0; j<_availableRules.length; j++) {
                rule = _availableRules[j];
                    if (rule.checkWinOnLine(line)) {
                        winComboName.push(rule);
                        break;
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
