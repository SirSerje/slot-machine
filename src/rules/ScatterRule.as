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
        var m:int = 0;
        switch (_winCount) {
            case 1:
                m += 2;
                break
            case 2:
                m += 10;
                break
            case 3:
                m += 25;
                break
            case 0:
                m += 0;
                break
        }
        _winCount=0;
        return i + m;
    }
}
}
