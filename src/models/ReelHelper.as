package models {
public class ReelHelper {
    /**
     * Defines, what items on reel user sees.
     * @param itemCounter - position on reel
     * @param itemsOnReel - all available items, placed on reel
     * @param reelSize - quantity of items, presented on a single rule
     * @return items on reel available for show
     */
    public static function getItemsOnReel(itemCounter:int, itemsOnReel:Array, reelSize:int):Array {
        var result:Array = [];
        for (var i:int = 0; i < reelSize; i++) {
            if(itemsOnReel.length<=itemCounter) {
                itemCounter=0;
            }
            var currentItem:String = itemsOnReel[itemCounter];
            result.push(currentItem);
            itemCounter += 1;
        }

        return result;
    }

    /**
     * returns certain randomized item
     * @param weights - probabilities array
     * @return - random position
     */
    public static function getRandomOnReel(weights:Array):int {
        var sum:Number = 1;
        for each(var currentArrayValue:int in weights) {
            sum += currentArrayValue;
        }
        var rand:int = 0;Math.floor(Math.random() * sum);
        var all:int = 0;
        for (var i:int = 0; i <= weights.length; i++) {
            var currentValue:int = weights[i];
            if (all >= rand) {
                return i;
            }
            all += currentValue;

        }
        return -1;
    }
}
}
