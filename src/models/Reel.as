package models {

public class Reel implements IReel{
    private var _items:Array = [];
    private var _reelDisplaySize:int;

    public function Reel(reelDisplaySize:int = 0) {
        _reelDisplaySize = reelDisplaySize
    }

    public function updateReel(itemsOnReel:Array):void {
        for(var i:int = 0; i<itemsOnReel.length; i++) {
            _items[i] = itemsOnReel[i];
        }
    }

    public function getItems():Array {
        return _items;
    }

    public function getDisplaySize():int {
        return _reelDisplaySize;
    }
}
}
