package rules {
public class AbstractRule {
    //item, which can't take part in win combination
    protected var _exceptItem:String = "BLANK";
    protected var _scatterItem:String = "CHERRY";
    protected var _wildItem:String = "WILD";
    protected var _bonusItem:String = "BONUS";
    protected var _availableLineTypes:Array = [];

    public function AbstractRule() {
    }
}
}
