package items {
public class SevenItem extends AbstractItem implements IItem {
    public function SevenItem(name:String = "") {
        super(name);
    }

    public function get name():String {
        return _name;
    }

    public function setPay(value:Object) {
        _pay = value;
    }

    public function getPay():Object {
        return _pay;
    }
}
}
