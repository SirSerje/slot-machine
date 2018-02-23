package models {
import creator.ICreator;

import items.IItem;

public class ReelHelper {
    private var _creator:ICreator;
    public function ReelHelper(creator:ICreator) {
        _creator = creator;
    }

    /**
     * Defines, what items on reel user sees.
     * @param itemCounter - position on reel
     * @param itemsOnReel - all available items, placed on reel
     * @param reelSize - quantity of items, presented on a single rule
     * @return items on reel available for show
     */
    public function getItemsOnReel(itemCounter:int, itemsOnReel:Array, reelSize:int):Vector.<IItem> {
        var result:Vector.<IItem> = new Vector.<IItem>();
        for (var i:int = 0; i < reelSize; i++) {
            if(itemsOnReel.length<=itemCounter) {
                itemCounter=0;
            }
            
            result[i] = _creator.createItem(itemsOnReel[itemCounter]);
            itemCounter += 1;
        }

        return result;
    }

    /**
     * returns certain randomized item
     * @param weights - probabilities array
     * @param random
     * @return - random position
     */
    public function getRandomOnReel(weights:Array, random:Number = 0):int {
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
