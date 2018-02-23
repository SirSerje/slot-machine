package items {

public class ScatterItem extends AbstractItem implements IItem {
    public function ScatterItem(name:String = "") {
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
