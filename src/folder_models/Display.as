package folder_models {
import folder_defauklts.LineType;

public class Display extends AbstractDisplay {
    private var reels:Array = [];//TODO or private
    private var reelsQuantity:int;
    private var possibleLines:Array;
    private var reelSize:int;

    //TODO подумать над тем чтобы вынести создание линий "на потом"
    public function Display(reelsQuantity:int, possibleLines:Array, reelSize:int = 3) {
        this.possibleLines = possibleLines;
        this.reelsQuantity = reelsQuantity;
        this.reelSize = reelSize;
    }

    override public function addReel(reel:AbstractReel):void {
        if (reelSize != reel.getDisplaySize()) {
            throw new Error("размер создаваемого рила не соотвествует конфигурации дисплея")
        }
        reels.push(reel);
    }


    override public function getReels():Array {
        return reels;
    }

    override public function updateReels(itemsOnReel:Array):void {
        for (var i:int = 0; i < itemsOnReel.length; i++) {
            var currentReel:Reel = reels[i];
            currentReel.updateReel(itemsOnReel[i]);
        }
    }

    /** УДАЛИТЬ
     * @Deprecated
     * @return
     */
    public function currentPossibleLines():Array {
        throw new Error("не надо вызывать currentPossibleLiens");
        return [["BLANK", "BAR7", "BAR1"], ["BLANK", "BAR7", "BAR1"]]
    }

    /**
     * выводим массив совпавших линий
     * @return
     */
    //TODO подумать над тем, вынести ли линии в отдельную сущность, чтобы не было костыля в виде свича
    public function availableLines():Array {//может стоит вынести метод в интерфейс
        var all:Array = [];
        var currentLine:Array = [];
        for each(var currentLineType:String in possibleLines) {
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
                    //TODO: add square validation somewhere upper
                    for (var i:int = 0; i < reels.length; i++) {
                        var item:String = reels[i].getItemAt(i);
                        currentLine.push(item)
                    }
                    all.push(currentLine);
                    var m:int = 0
                    currentLine = [];
                    for (var i:int = 0; i < reels.length; i++) {
                        var b:Reel = reels[i];
                        for (var j:int = b.getDisplaySize() - 1; j >= 0; j--) {
                            var item:String = reels[i].getItemAt(j - m);
                            currentLine.push(item)
                            m++
                            break
                        }
                    }
                    all.push(currentLine);
                    break;


                default:
                    throw new Error("NOT IMPLEMENTED DEFAULT LINE at avaliableLines");
                    break;
            }
        }
        return all;
    }

    public function getAvailableLineTypes():Array {
        return possibleLines;
    }
}
}
