package models {
import items.IItem;

public class Reel implements IReel {
    public function Reel(reelDisplaySize:int = 0) {
        _reelDisplaySize = reelDisplaySize
    }
    private var _reelDisplaySize:int;

    private var _items:Vector.<IItem> = new Vector.<IItem>();

    public function get items():Vector.<IItem> {
        return _items;
    }

    public function updateReel(itemsOnReel:Vector.<IItem>):void {
        for (var i:int = 0; i < itemsOnReel.length; i++) {
            _items[i] = itemsOnReel[i];
        }
    }

    public function getItems():Vector.<IItem> {
        return _items;
    }

    public function getDisplaySize():int {
        return _reelDisplaySize;
    }

    public function getItemAt(value:int):IItem {
        return _items[value];
    }
}
}
