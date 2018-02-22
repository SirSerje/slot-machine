package models {
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
                item = new BonusItem("BONUS");
                break;
            case "WILD":
                item = new WildItem("WILD");
                break;
            case "CHERRY":
                item = new ScatterItem("SCATTER");
                break;
            case "BAR7":
                item = new Bar7Item("BAR7");
                break;
            case "H7":
                item = new H7Item("H7");
                break;
            case "BAR3":
                item = new Bar3Item("BAR3");
                break;
            case "BAR2":
                item = new Bar2Item("BAR2");
                break;
            case "BAR1":
                item = new Bar1Item("BAR1");
                break;
            default:
                item = new BlankItem("BLANK");

        }
        item.setPay(Config.payByValue(value));
        return item;
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
