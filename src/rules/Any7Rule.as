package rules {
import items.IItem;

import models.ILine;
import models.ScatterLine;

public class Any7Rule extends AnyBarRule implements IRule {

    public function Any7Rule(itemNeedToWin) {
        super(itemNeedToWin);
    }

    override public function countPay(i:int):int {
        return i + 10;
    }

    override public function get name():String {
        return "ANY7";
    }


}
}

