package models {
import items.IItem;

public class ScatterLine extends AbstractLine implements ILine {


    public function ScatterLine(items:Vector.<IItem>) {
        super(items);
    }

    override public function get lineType():String {
        return "Scatter";
    }

}
}
