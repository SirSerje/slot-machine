package model {

public class Reel extends AbstractReel {
    private var items:Array = []

    public function Reel(reelDisplaySize:int=0) {
    }

    override public function setItem():void {
        super.setItem();
    }

    public function updateReel(itemsOnReel2:Array):void {
        for(var i:int = 0; i<itemsOnReel2.length; i++) {
            items[i] = itemsOnReel2[i]; //try switch to factory method
        }
    }
}
}
