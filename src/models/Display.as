package models {
import configuration.LineType;

/**
 * Display class knows about reels and possible lines, which able to give win
 */
//Definitely, some slot machines have more than one display, so for this scalability class should be extends
//from AbstractDisplay
public class Display {
    private var reels:Array = [];
    private var reelsQuantity:int;
    private var availableWinLines:Array; //TODO rename possible lineTypes
    private var reelSize:int;

    public function Display(reelsQuantity:int, reelSize:int, possibleLines:Array) {
        this.availableWinLines = possibleLines;
        this.reelsQuantity = reelsQuantity;
        this.reelSize = reelSize;
    }

    public function addReel(reel:IReel):void {
        if (reelSize != reel.getDisplaySize()) {
            throw new Error("Reel doesn't match to display configuration");
        }
        reels.push(reel);
    }

    //TODO remove this
    public function getReels():Array {
        return reels;
    }

    public function updateReels(itemsOnReel:Array):void {
        for (var i:int = 0; i < itemsOnReel.length; i++) {
            var currentReel:Reel = reels[i];
            currentReel.updateReel(itemsOnReel[i]);
        }
    }


    /**
    * Get all available lines for win combinations
    * @return array of possible line win combinations
    */
    //For scalability, any line should be presented as some essence line Rule classes
    public function availableLines():Array {
        var all:Array = [];
        var currentLine:Array = [];
        for each(var currentLineType:String in availableWinLines) {

            switch (currentLineType) {
                case LineType.ALL_HORIZONTAL:
                    for (var i:int = 0; i < reels.length; i++) {
                        currentLine = [];
                        var b:Reel = reels[i];
                        for (var j:int = 0; j < b.getDisplaySize(); j++) {
                            var item:String = reels[j].getItemAt(i);
                            currentLine.push(item)
                        }
                        all.push(currentLine);
                    }
                    break;

                case LineType.SQUARE_DIAGONAL:
                    currentLine = [];
                    for (var i:int = 0; i < reels.length; i++) {
                        var item:String = reels[i].getItemAt(i);
                        currentLine.push(item)
                    }
                    all.push(currentLine);
                    var m:int = 0;
                    currentLine = [];
                    for (var i:int = 0; i < reels.length; i++) {
                        var b:Reel = reels[i];
                        //noinspection LoopStatementThatDoesntLoopJS
                        for (var j:int = b.getDisplaySize() - 1; j >= 0; j--) {
                            var item:String = reels[i].getItemAt(j - m);
                            currentLine.push(item);
                            m++;
                            break
                        }
                    }
                    all.push(currentLine);
                    break;
            }
        }
        return all;
    }

}
}
