package models {
import items.Bar1Item;
import items.Bar2Item;
import items.Bar3Item;
import items.Bar7Item;
import items.BarItem;
import items.BlankItem;
import items.BonusItem;
import items.H7Item;
import items.IItem;
import items.ScatterItem;
import items.SevenItem;
import items.WildItem;

public class ReelHelper {
    /**
     * Defines, what items on reel user sees.
     * @param itemCounter - position on reel
     * @param itemsOnReel - all available items, placed on reel
     * @param reelSize - quantity of items, presented on a single rule
     * @return items on reel available for show
     */
    public static function getItemsOnReel(itemCounter:int, itemsOnReel:Array, reelSize:int):Vector.<IItem> {
        var result:Vector.<IItem> = new Vector.<IItem>();
        for (var i:int = 0; i < reelSize; i++) {
            if(itemsOnReel.length<=itemCounter) {
                itemCounter=0;
            }
            
            result[i] = createItem(itemsOnReel[itemCounter]);
            itemCounter += 1;
        }

        return result;
    }

    //TODO вынести в какую то фабрику
    public static function createItem(value:String):IItem {
        var item:IItem;
        switch (value) {
            case "BONUS":
                item = new BonusItem("BNS");
                item.setPay(Config.payByValue(value));
                return item;

            case "WILD":
                item = new WildItem("WLD");
                item.setPay(Config.payByValue(value));
                return item;

            case "CHERRY":
                item = new ScatterItem("SCT");
                item.setPay(Config.payByValue(value));
                return item;

            case "BAR7":
                item = new Bar7Item("BR7");
                item.setPay(Config.payByValue(value));
                return item;

            case "H7":
                item = new H7Item("H 7");
                item.setPay(Config.payByValue(value));
                return item;

            case "BAR3":
                item = new Bar3Item("BR3");
                item.setPay(Config.payByValue(value));
                return item;

            case "BAR2":
                item = new Bar2Item("BR2");
                item.setPay(Config.payByValue(value));
                return item;

            case "BAR1":
                item = new Bar1Item("BR1");
                item.setPay(Config.payByValue(value));
                return item;

            default:
                item = new BlankItem(" X ");
                item.setPay(Config.payByValue(value));
                return item;

        }
    }
    /**
     * returns certain randomized item
     * @param weights - probabilities array
     * @param random
     * @return - random position
     */
    public static function getRandomOnReel(weights:Array, random:Number = 0):int {
        var sum:int = 0;
        for(var j:int = 0; j< weights.length; j++) {
            sum += weights[j];
        }
        var rand:Number = random * sum;
        var all:int = 0;
        for (var i:int = 0; i <= weights.length; i++) {
            all +=  weights[i];
            if (rand <= all) {
                return i;
            }
        }
        return -1;
    }
}
}
