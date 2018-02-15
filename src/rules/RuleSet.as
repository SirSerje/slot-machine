package rules {

public class RuleSet {
    private var _availableRules:Array = [];

    public function RuleSet() {

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
                trace("Проверяем", line, "по правилу", rule);
                if (rule.checkWinOnLine(line)) {
                    winComboName.push(rule.getName());
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
