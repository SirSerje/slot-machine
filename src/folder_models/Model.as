package folder_models {
import flash.events.Event;
import flash.events.EventDispatcher;

import folder_defauklts.LineType;
import folder_defauklts.RuleType;

import rules.RuleSet;

public class Model extends EventDispatcher implements IModel {
    private var lastKeyPressed:uint = 0;

    private var reelWeights:Object;
    private var display:Display;
    private var displaySize:int = 3; //TODO выпилить это
    private var ruleSet:RuleSet;

    //TODO подумать, стоит ли напрямую добавлять классы правил или делать это внутри через возврат
    private var possibleLines:Array = [LineType.ALL_HORIZONTAL, LineType.SQUARE_DIAGONAL]; //TODO добавить остальные линии
    private var rules:Array = [RuleType.WILD, RuleType.ANY_3];
    private const DISPLAY_REEL_SIZE:int = 3;

    //TODO добавить остальные правила

    public function Model() {
        if(!reelWeights) {
            init();
        }
    }

    //TODO реализовать загрузку из Config
    private function init():void {
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
        };

        display = new Display(displaySize, possibleLines);
        for each(var a in reelWeights) {
            display.addReel(new Reel(DISPLAY_REEL_SIZE))
        }
        ruleSet = new RuleSet(rules);

        trace("Available rules:",ruleSet.availableRules());

    }

    public function setKey(key:uint):void {
      //  this.lastKeyPressed = key;
       // dispatchEvent(new Event(Event.CHANGE));

    }

    public function makeRoll():void {
        trace("ROLL WAS MADE")
        dispatchEvent(new Event(Event.CHANGE));
    }

    public function getKey():uint {
        return lastKeyPressed;
    }

    /**
     * При клике
     * @return
     */
    public function getDisplay():AbstractDisplay {
        var itemsOnReel:Array = [];
        for each(var a:Object in reelWeights) {
            if( a.stop.length != a.weight.length) {
                throw new Error("Таблица вероятностей не соотвествуют таблице символов на барабане at getItems ")
            }
            var randomPosOnReel:int = getRandomOnReel(a.weight);
            var items:Array = getItemsOnReel(randomPosOnReel, a.stop)
            itemsOnReel.push(items);
        }
        display.updateReels(itemsOnReel);
        return display;
    }

    /**
     * метод, который проверит, есть ли линии
     * @return
     */
    public function getMatchedRules():Array {
        return ruleSet.matchByCurrentRules(display.availableLines())
    }

    /**
     * Узнаем, какие айтемы на риле увидим. Учитываем "зацикленность" барабана
     * @param itemCounter - позиция на барабане
     * @param itemsOnReel - все значения на барабане
     * @return массив значений для отображения
     */
    private function getItemsOnReel(itemCounter:int, itemsOnReel:Array):Array {
        var result:Array = [];
        for (var i:int = 0; i<itemsOnReel.length; i++) {
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
     * возвращаем рандомное число из массива
     * @param weights - массив
     * @return - случайное значение в массиве
     */
    private function getRandomOnReel(weights:Array):int {
        if(weights.length < DISPLAY_REEL_SIZE) {
            throw new Error("КОНФИГ ДЛЯ ВЕСОВ МЕНЬШЕ РАЗМЕРА ОТОБРАЖАЕМЫХ ЗНАЧЕНИЙ at getRandomOnReel");
        }

        var sum:Number = 1;
        for each(var currentArrayValue:int in weights) {
            sum += currentArrayValue;
        }
        var rand:int = 0;Math.floor(Math.random() * sum);
        var all:int = 0;
        for (var i:int = 0; i <= weights.length; i++) {
            var currentValue:int = weights[i];
            if (all >= rand) {
                return i
            }
            all += currentValue;

        }
        return null //TODO проверить, надо ли так, или можно красивее
    }



}
}
