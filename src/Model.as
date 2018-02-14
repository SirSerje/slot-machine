package {
import flash.events.Event;
import flash.events.EventDispatcher;

public class Model extends EventDispatcher implements IModel {

    public function Model() {
        /*if(reelWeights == {})*/
        initializeFromConfig();
    }

    private var lastKeyPressed:uint = 0;
    private var lines:Object = {};
    private var reelWeights:Object = {};
    private var reels:Object = {};
    private var displaySize:int = 3;

    public function setKey(key:uint):void {
        this.lastKeyPressed = key;
        dispatchEvent(new Event(Event.CHANGE));

    }

    public function getKey():uint {
        return lastKeyPressed;
    }


    public function getItems():Array {
        for each(var a:Object in reelWeights) {
            trace("значения получим:", getItemsOnReel(getRandomOnReel(a.weight), a.weight));
        }
        return reelWeights.reelW1;
    }

    private function initializeFromConfig():void {
        reelWeights = {
            a: {
                weight: [1, 25, 10, 15, 30, 25, 30, 40, 15, 10, 8, 45, 3, 5, 3, 10, 30, 25, 30, 10, 1, 1],
                stop: ["BLANK", "BAR7", "BLANK", "BAR3", "BLANK", "BONUS", "BLANK", "BAR2", "BLANK", "H7", "BLANK", "BAR1", "BLANK", "WILD", "BLANK", "BAR3", "BLANK", "BONUS", "BLANK", "H7", "BLANK", "CHERRY"]
            },
            b: {
                weight: [2, 25, 10, 15, 30, 15, 30, 20, 8, 10, 8, 40, 2, 3, 2, 20, 30, 20, 30, 10, 2, 2],
                stop: ["BLANK", "BAR7", "BLANK", "BAR3", "BLANK", "BONUS", "BLANK", "BAR2", "BLANK", "H7", "BLANK", "BAR1", "BLANK", "WILD", "BLANK", "BAR3", "BLANK", "BONUS", "BLANK", "H7", "BLANK", "CHERRY"]
            },
            c: {
                weight: [3, 25, 10, 25, 15, 20, 15, 40, 8, 10, 8, 25, 1, 2, 1, 15, 15, 20, 15, 10, 3, 3],
                stop: ["BLANK", "BAR7", "BLANK", "BAR3", "BLANK", "BONUS", "BLANK", "BAR2", "BLANK", "H7", "BLANK", "BAR1", "BLANK", "WILD", "BLANK", "BAR3", "BLANK", "BONUS", "BLANK", "H7", "BLANK", "CHERRY"]
            }
        }
    }

    /**
     * Узнаем, какие айтемы на риле увидим
     * @param value - позиция на барабане
     * @param reel - все значения на барабане
     * @return массив значений для отображения
     */
    private function getItemsOnReel(value:int, reel:Array):Array {
        var result:Array = [];
        for (var i:int = 0; i < displaySize; i++) {
            result.push(reel[value + i]);
        }
        return result;
    }

    /**
     * возвращаем рандомное число из массива
     * @param arr - массив
     * @return - случайное значение в массиве
     */
    private function getRandomOnReel(arr:Array):int {
        var sum:Number = 0;
        for each(var currentArrayValue:int in arr) {
            sum += currentArrayValue;
        }
        var rand:Number = Math.round(Math.random() * sum)
        var all:int = 0;
        for (var i:int = 0; i <= arr.length; i++) {
            var currentValue:int = arr[i];
            if (all >= rand) {
                return i
            }
            all += currentValue;

        }
        return -1
    }


}
}
