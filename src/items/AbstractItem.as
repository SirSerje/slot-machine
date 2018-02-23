package items {
public class AbstractItem {
    public function AbstractItem(name:String = "") {
        _name = name;
    }

    protected var _pay:Object;
    protected var _name:String = "";
}
}
