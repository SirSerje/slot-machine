package rules {
import models.ILine;
import models.ScatterLine;

public class ScatterRule extends AbstractRule implements IRule{
    private var _winCount:int = 0;
    private var _expectLine:Class = ScatterLine;

    public function ScatterRule() {
    }
    public function checkWinOnLine(value:ILine):Boolean {
        if (!(value is _expectLine))
            return false
        for each(var m:String in value.items) {
            if (m == _scatterItem) {
                _winCount++;
            }
        }
        return _winCount >= 1;
    }

    public function isRuleAvailableForLine(line:ILine):Boolean {
        for each(var i:String in _availableLineTypes) {

        }
        return true;
    }

    public function countPay(i:int):int {
        switch (_winCount) {
            case 1:
                return i + 2;
            case 2:
                return i + 10;
            case 3:
                return i + 25;
            case 0:
                return i + 0;
        }
        return i + 0;
    }
}
}
