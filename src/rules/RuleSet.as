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
        //TODO проверить с бонусом
        var winComboName:Array = [];
        var line:ILine;
        var rule:IRule;
        var bonus:IRule;
        var isWin:Boolean;
        for (var i:int = 0; i < itemOnLines.length; i++) {
            line = itemOnLines[i];
            for (var j:int = 0; j < _availableRules.length; j++) {


                rule = _availableRules[j];
                isWin = rule.checkWinOnLine(line);
                if (isWin) {
                    if(!(rule is BonusRule)) {
                        winComboName.push(rule);
                    } else {
                        bonus = rule;
                    }
                    break; //TODO надо не забыть за него
                }




            }
        }
        bonus && winComboName.push(bonus);
        return winComboName;
    }

    public function add(rule:IRule):void {
        _availableRules.push(rule);
    }
}
}
