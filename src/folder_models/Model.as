package folder_models {
import configuration.Config;

import flash.events.Event;
import flash.events.EventDispatcher;

import folder_defauklts.LineType;
import folder_defauklts.RuleType;

import rules.Any3Rule;

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

    private function init():void {
        //Получаем данные о том, что на каждой ленте и какая вероятность выпадения
        reelWeights = Config.reelConfiguration;//TODO может органичнее?
        //Создаем дисплей
        display = new Display(displaySize, possibleLines);
        //Создаем ленты и помещаем их в дисплей с заданым размером отоброажения
        for each(var a:Object in reelWeights) {
            display.addReel(new Reel(Config.displayReelSize))
        }
        //создаем набор правил
        ruleSet = new RuleSet(rules);
        ruleSet.add(new Any3Rule())
    }

    public function setKey(key:uint):void {
      //  this.lastKeyPressed = key;
       // dispatchEvent(new Event(Event.CHANGE));

    }

    public function makeRoll():void {
        trace("ROLL WAS MADE");
        dispatchEvent(new Event(Event.CHANGE));
    }

    public function getKey():uint {
        return lastKeyPressed;
    }

    /**
     * Возращаем набор айтемов которые доступны к отображению пользователю
     * @return
     */
    public function getDisplay():AbstractDisplay {
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
        return -1; //TODO проверить, надо ли так, или можно красивее
    }

    /**
     * Реализуем логику "крутки" лент
     */
    public function makeSpin():void {
        var itemsOnReel:Array = [];
        for each(var a:Object in reelWeights) {
            if( a.stop.length != a.weight.length) {
                throw new Error("Таблица вероятностей не соотвествуют таблице символов на барабане at getItems ")
            }
            var randomPosOnReel:int = getRandomOnReel(a.weight);
            var items:Array = getItemsOnReel(randomPosOnReel, a.stop);
            itemsOnReel.push(items);
        }
        display.updateReels(itemsOnReel);
    }
}
}
