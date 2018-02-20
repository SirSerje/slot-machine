package rules {
import models.ILine;
import models.ScatterLine;

public class Any7Rule extends AbstractRule implements IRule {
    public function Any7Rule() {
    }

    public function checkWinOnLine(value:ILine):Boolean {
        if (value is ScatterLine) return false;
        var total:int = 0;
        var m:String = "";
        var items:Array = [];
        for (var i:int = 0; i < value.items.length; i++) {
            m = value.items[i];
            if (m == _scatterItem || m == _exceptItem || m == _bonusItem) {
                return false;
            }
            if (m == "H7" || m == "BAR7" || m == _wildItem) {
                items.push(m);
                total++
            }
        }

        return total == value.items.length && suits(items);
    }

    private function suits(arr:Array):Boolean {
        var current:String;
        var previous:String;
        var array:Array = [];
        for each(var j:String in arr) {
            if (j != _wildItem) {
                array.push(j);
            }
        }
        for (var i:int = 0; i < array.length; i++) {
            current = array[i];
            if (i > 0) {
                previous = array[i - 1];
                if (current != previous) {
                    return true
                }
            }

        }
        return false;
    }

    public function countPay(i:int):int {
        return i + 10;
    }

    public function get name():String {
        return "ANY7";
    }
}
}

