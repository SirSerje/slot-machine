package models {
import items.IItem;

public class StraightLine extends AbstractLine implements ILine {
    public function StraightLine(items:Vector.<IItem>) {
        super(items);
    }

    override public function get lineType():String {
        return "Straight";
    }
}
}
