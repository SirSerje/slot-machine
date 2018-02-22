package items {
import items.AbstractItem;

public class BarItem extends AbstractItem implements IItem {
    public function BarItem(name:String = "") {
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
