package rules {
import folder_defauklts.RuleType;

import folder_models.AbstractReel;

//TODO подумать над наличием абстракции
public class RuleSet {
    private var _availableRules:Array = [];

    public function RuleSet(rules:Array) {

        for each (var i:String in rules) {
            _availableRules.push(createNewRule(i));
        }
    }

    public function availableRules():Array {
        return _availableRules;
    }

    /**
     * Проверяем все рилы по всем правилам. Каждое правило получает на вход набор айтемов и если правило выполнено
     * возвращает true
     * @param itemOnLines - все доступные линии, которые есть на слоте
     * @return - массив правил, которые сыграли
     */
    public function matchByCurrentRules(itemOnLines:Array):Array {

        var winComboName:Array = [];
        for each(var line:Array in itemOnLines) {
            for each (var rule:IRule in _availableRules) {
                trace("Проверяем", line, "по правилу", rule)
                if(rule.checkWinOnLine(line)) {
                    winComboName.push(rule.getName());
                }
            }
        }
        return winComboName;
    }

    //TODO фабрике тут место быть
    private function createNewRule(i:String):AbstractRule {
        switch (i) {
            case RuleType.ANY_3:
                return new Any3Rule();
                break;
            case RuleType.WILD:
                return new WildRule();
                break;
            default:
                throw new Error("NOT IMPLEMENTED DEFAULT RULE at createNewRule");
                break;
        }
        return null;
    }
}
}
