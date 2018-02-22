package items {
import items.IItem;

public class BonusItem extends ScatterItem implements IItem {
    public function BonusItem(name:String) {
        super(name);
    }

    override public function setPay(value:Object) {
        _pay = value;
    }

    override public function getPay():Object {
        return _pay;
    }
}
}
