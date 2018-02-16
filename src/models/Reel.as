package models {

public class Reel implements IReel{
    private var _items:Array = [];
    private var _reelDisplaySize:int;

    public function Reel(reelDisplaySize:int = 0) {
        this._reelDisplaySize = reelDisplaySize
    }

    public function setItem():void { //TODO can we kill it?
        super.setItem();
    }

    public function updateReel(itemsOnReel:Array):void {
        for(var i:int = 0; i<itemsOnReel.length; i++) {
            _items[i] = itemsOnReel[i];
        }
    }

    public function getItemAt(value:int):String { //TODO can we kill it
        return _items[value];
    }

    public function getItems():Array {
        return _items;
    }

    public function getDisplaySize():int {
        return _reelDisplaySize;
    }
}
}
