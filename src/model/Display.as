package model {
import model.AbstractReel;
import model.Reel;

public class Display extends AbstractDisplay {
    internal var reels:Array = [];//TODO or private
    private var reelsQuantity:int;
    private var counter:int = 0

    public function Display(reelsQuantity:int, possibleLines:Array) {
        this.reelsQuantity=reelsQuantity;
    }

    override public function addReel(reel:AbstractReel):void {
        reels.push(reel);
    }


    override public function getReels():Array {
        return reels;
    }

    override public function updateReels(itemsOnReel:Array):void {
        for (var i:int = 0; i<itemsOnReel.length; i++) {
            var currentReel:Reel = reels[i];
            currentReel.updateReel(itemsOnReel[i]);
        }
    }
}
}
