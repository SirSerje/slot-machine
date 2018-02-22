package models {
import configuration.LineType;

import items.IItem;

/**
 * Display class knows about reels and possible lines, which able to give win
 */
//Definitely, some slot machines have more than one display, so for this scalability class should be extends
//from AbstractDisplay
public class Display {
    private var _reels:Array = [];
    private var _reelsQuantity:int;
    private var _possibleLineTypes:Array; //TODO rename possible lineTypes
    private var _reelSize:int;
    private var _availableLines:Array = [];

    public function Display(reelsQuantity:int, reelSize:int, possibleLineTypes:Array) {
        _possibleLineTypes = possibleLineTypes;
        _reelsQuantity = reelsQuantity;
        _reelSize = reelSize;
    }

    public function addReel(reel:IReel):void {
        if (_reelSize != reel.getDisplaySize()) {
            trace("Reel doesn't match to display configuration");
        }
        _reels.push(reel);
    }

    public function getReels():Array {
        return _reels;
    }

    public function updateReels(itemsOnReel:Array):void {
        for (var i:int = 0; i < itemsOnReel.length; i++) {
            var currentReel:Reel = _reels[i];
            currentReel.updateReel(itemsOnReel[i]);
        }
        updateLines();
    }

    /**
    * Get all available lines for win combinations
    * @return array of possible line win combinations
    */
    //For scalability, any line should be presented as some essence line Rule classes
    public function availableLines():Array {
        return _availableLines;
    }

    private function updateLines():void {
        var currentLine:Vector.<IItem> = new Vector.<IItem>();
        _availableLines = []; //clear lines
        var b:IReel;
        var item:IItem;
        for each(var currentLineType:String in _possibleLineTypes) {
            switch (currentLineType) {
                case LineType.SCATTER:
                    //line for scatter check
                    for (var q:int = 0; q < _reels.length; q++) {
                        b = _reels[q];
                        for (var w:int = 0; w < b.getDisplaySize(); w++) {

                            item = _reels[w].getItemAt(q);
                            currentLine.push(item);
                        }
                    }
                    _availableLines.push(new ScatterLine(currentLine));
                    break;
                case LineType.ALL_HORIZONTAL:
                    for (var e:int = 0; e < _reels.length; e++) {
                        currentLine =  new Vector.<IItem>();
                        b = _reels[e];
                        for (var r:int = 0; r < b.getDisplaySize(); r++) {
                            item = _reels[r].getItemAt(e);
                            currentLine.push(item)
                        }
                        _availableLines.push(new StraightLine(currentLine));
                    }
                    break;
                case LineType.SQUARE_DIAGONAL:
                    currentLine =  new Vector.<IItem>();
                    for (var t:int = 0; t < _reels.length; t++) {
                        item = _reels[t].getItemAt(t);
                        currentLine.push(item);
                    }
                    _availableLines.push(new StraightLine(currentLine));
                    var m:int = 0;
                    currentLine =  new Vector.<IItem>();
                    for (var u:int = 0; u < _reels.length; u++) {
                        b = _reels[u];
                        for (var o:int = b.getDisplaySize() - 1; o >= 0; o--) {
                            item = _reels[u].getItemAt(o - m);
                            currentLine.push(item);
                            m++;
                            break
                        }
                    }
                    _availableLines.push(new StraightLine(currentLine));
                    break;
            }
        }
    }

}
}
