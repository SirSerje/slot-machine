package models {
public class ScatterLine extends AbstractLine implements ILine {


    public function ScatterLine(items:Array) {
        super(items);
    }

    override public function get lineType():String {
        return "Scatter";
    }

}
}
