package rules {
import items.IItem;

public class Any7Rule extends AnyBarRule implements IRule {

    public function Any7Rule(usingItems:Vector.<IItem>, anyItems:Vector.<IItem>, exceptItems:Vector.<IItem>, itemNeedToWin:int = 0) {
        super(usingItems, anyItems, exceptItems, itemNeedToWin);
    }

    override public function get name():String {
        return "ANY7";
    }


}
}

