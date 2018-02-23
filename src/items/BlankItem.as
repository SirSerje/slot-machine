package items {
import items.AbstractItem;

public class BlankItem extends AbstractItem implements IItem {
    public function BlankItem(name:String = "") {
        super(name);
    }

    public function get name():String {
        return _name;
    }

    public function setPay(value:Object):void {
    }

    public function getPay():Object {
        return null;
    }
}
}
