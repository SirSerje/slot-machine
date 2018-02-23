
package models {

import items.IItem;

public class BonusLine extends AbstractLine implements ILine {
    public function BonusLine(currentLine:Vector.<IItem>) {
        super(currentLine);
    }

    override public function get lineType():String {
        return "Bonus";
    }
}
}
