package creator {
import configuration.Config;

import flash.utils.Dictionary;

import items.Bar1Item;
import items.Bar2Item;
import items.Bar3Item;
import items.Bar7Item;
import items.BlankItem;
import items.BonusItem;
import items.H7Item;
import items.IItem;
import items.ScatterItem;
import items.WildItem;

/**
 * Class holds data about items, presented on reels. Based on fact, elements in current case based on same logic, we can
 * hold only one item instead creating new one each time it need to show
 */
public class ItemCreator implements ICreator{
    private var _itemHolder:Dictionary = new Dictionary(false);

    public function ItemCreator() {
    }

    public function createItem(value:String):IItem {
        if(_itemHolder[value]) {
            return _itemHolder[value]
        } else {
            var item:IItem;
            switch (value) {
                case "BONUS":
                    item = new BonusItem(value);
                    break;
                case "WILD":
                    item = new WildItem(value);
                    break;
                case "CHERRY":
                    item = new ScatterItem(value);
                    break;
                case "BAR7":
                    item = new Bar7Item(value);
                    break;
                case "H7":
                    item = new H7Item(value);
                    break;
                case "BAR3":
                    item = new Bar3Item(value);
                    break;
                case "BAR2":
                    item = new Bar2Item(value);
                    break;
                case "BAR1":
                    item = new Bar1Item(value);
                    break;
                default:
                    item = new BlankItem(value);
            }
            _itemHolder[value] = item;
            item.setPay(Config.payByValue(value));
            return item;
        }
    }
}
}
