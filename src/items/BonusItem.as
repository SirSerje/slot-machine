package items {

public class BonusItem extends AbstractItem implements IItem {
    public function BonusItem(name:String = "") {
        super(name);
    }

     public function setPay(value:Object):void {
        _pay = value;
    }

     public function getPay():Object {
        return _pay;
    }

    public function get name():String {
        return "BONUS";
    }
}
}
