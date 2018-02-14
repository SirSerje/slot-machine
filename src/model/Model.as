package model {
import defaults.LineType;

import flash.events.Event;
import flash.events.EventDispatcher;

import model.Reel;

import rules.RuleSet;

public class Model extends EventDispatcher implements IModel {
    private var lastKeyPressed:uint = 0;

    private var reelWeights:Object = {};
    private var display:Display;
    private var displaySize:int = 3;
    private var ruleSet:RuleSet;
    private var possibleLines:Array = [LineType.ALL_HORIZONTAL, LineType.SQUARE_DIAGONAL];
    private var rules:Array = [RuleType.WILD, RuleType.ANY_3]; //TODO добавить список правил

    public function Model() {
//        if(reelWeights == {})
            initializeFromConfig();

    }

    public function setKey(key:uint):void {
        this.lastKeyPressed = key;
        dispatchEvent(new Event(Event.CHANGE));

    }

    public function getKey():uint {
        return lastKeyPressed;
    }

    /**
     * При клике
     * @return
     */
    public function getItems():AbstractDisplay {
        var itemsOnReel:Array = [];
        for each(var a:Object in reelWeights) {
            itemsOnReel.push(getItemsOnReel(getRandomOnReel(a.weight), a.stop));
        }

        display.updateReels(itemsOnReel);

        return display;
    }

    /**
     * метод, который проверит, есть ли линии
     * @return
     */
    public function getRules():String {


        //проверить прямые
        display.getLine(0)
        display.getLine(1)
        display.getLine(2)
        //проверить диагонали
        display.getDiagonal(true)
        display.getDiagonal(false)
        //проверить на скаттеры
        display.getScatters
        display.hasBonus

        display.getAllLines()


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
        display = new Display(displaySize, possibleLines);
        ruleSet = new RuleSet(rules);


        for each(var a in reelWeights) {
            display.addReel(new Reel())
        }
        //trace(">>>", display.getReels());

    }

    /**
     * Узнаем, какие айтемы на риле увидим
     * @param itemCounter - позиция на барабане
     * @param itemsOnReel - все значения на барабане
     * @return массив значений для отображения
     */
    private function getItemsOnReel(itemCounter:int, itemsOnReel:Array):Array {
        var result:Array = [];
        for (var i:int = 0; i < displaySize; i++) {
            result.push(itemsOnReel[itemCounter + i]);
        }
        return result;
    }

    /**
     * возвращаем рандомное число из массива
     * @param weights - массив
     * @return - случайное значение в массиве
     */
    private function getRandomOnReel(weights:Array):int {
        var sum:Number = 0;
        for each(var currentArrayValue:int in weights) {
            sum += currentArrayValue;
        }
        var rand:Number = Math.round(Math.random() * sum)
        var all:int = 0;
        for (var i:int = 0; i <= weights.length; i++) {
            var currentValue:int = weights[i];
            if (all >= rand) {
                return i
            }
            all += currentValue;

        }
        return -1
    }


}
}
