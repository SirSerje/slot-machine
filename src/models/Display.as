package models {
import configuration.LineType;

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
    //TODO this shit can be fixed
    //TODO запилить линии и замутить rule.isAvailable(line.type())
    public function availableLines():Array {
        return _availableLines;
    }

    private function updateLines():void {
        var currentLine:Array = [];
        _availableLines = []; //clear lines
        for each(var currentLineType:String in _possibleLineTypes) {
            switch (currentLineType) {
                case LineType.SCATTER:
                    //line for scatter check
                    for (var i:int = 0; i < _reels.length; i++) {
                        var b:Reel = _reels[i];
                        for (var j:int = 0; j < b.getDisplaySize(); j++) {
                            var item:String = _reels[j].getItemAt(i);
                            currentLine.push(item);
                        }
                    }
                    _availableLines.push(new ScatterLine(currentLine));
                    break;
                case LineType.ALL_HORIZONTAL:
                    for (var i:int = 0; i < _reels.length; i++) {
                        currentLine = [];
                        var b:Reel = _reels[i];
                        for (var j:int = 0; j < b.getDisplaySize(); j++) {
                            var item:String = _reels[j].getItemAt(i);
                            currentLine.push(item)
                        }
                        _availableLines.push(new StraightLine(currentLine));
                    }
                    break;
                case LineType.SQUARE_DIAGONAL:
                    currentLine = [];
                    for (var i:int = 0; i < _reels.length; i++) {
                        var item:String = _reels[i].getItemAt(i);
                        currentLine.push(item)
                    }
                    _availableLines.push(new StraightLine(currentLine));
                    var m:int = 0;
                    currentLine = [];
                    for (var i:int = 0; i < _reels.length; i++) {
                        var b:Reel = _reels[i];
                        //noinspection LoopStatementThatDoesntLoopJS
                        for (var j:int = b.getDisplaySize() - 1; j >= 0; j--) {
                            var item:String = _reels[i].getItemAt(j - m);
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
