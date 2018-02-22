package items {
public class AbstractItem {
    protected var _pay:Object;
    protected var _name:String = "";

    public function AbstractItem(name:String = "") {
        _name = name;
    }
}
}
