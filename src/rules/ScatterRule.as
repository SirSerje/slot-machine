package rules {

public class ScatterRule extends AbstractRule implements IRule{
    private var _winCount:int = 0;

    public function ScatterRule() {
    }
//TODO должен проверять только один тип линии
    public function checkWinOnLine(value:Array):Boolean {
        //TODO ОЧЕНЬ ГРЯЗНО
        if(value.length < 9) {
            return false
        }
        for each(var m:String in value) {
            if (m == _scatterItem) {
                _winCount++;
            }
        }

        return _winCount >= 1;
    }

    public function isRuleAvailableForLine():Boolean {
        for each(var i:String in _availableLineTypes) {

        }
        return true;
    }

    public function countPay():int {
        switch (_winCount) {
            case 1:
                return 2;
            case 2:
                return 10;
            case 3:
                return 25;
            case 0:
                return 0;
        }
        return 0;
    }
}
}
