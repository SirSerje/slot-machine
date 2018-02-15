package folder_models {

public class Reel extends AbstractReel {
    private var items:Array = [];
    private var reelDisplaySize:int;

    public function Reel(reelDisplaySize:int=0) {
        this.reelDisplaySize = reelDisplaySize
    }

    override public function setItem():void {
        super.setItem();
    }

    public function updateReel(itemsOnReel:Array):void {
        for(var i:int = 0; i<itemsOnReel.length; i++) {
            items[i] = itemsOnReel[i]; //TODO ??? try switch to factory method
        }
    }

    public function getItemAt(value:int):String {
        return items[value];
    }

    override public function getDisplaySize():int {
        return reelDisplaySize;
    }
}
}
