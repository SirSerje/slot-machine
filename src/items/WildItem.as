package items {
import items.AbstractItem;
import items.IItem;

public class WildItem extends AbstractItem implements IItem {
    public function WildItem(name:String = "") {
        super(name);
    }

    public function get name():String {
        return _name;
    }

    public function setPay(value:Object):void {
        _pay = value;
    }

    public function getPay():Object {
        return _pay;
    }
}
}
