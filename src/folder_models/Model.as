package folder_models {
import configuration.Config;

import flash.events.Event;
import flash.events.EventDispatcher;

import configuration.LineType;

import rules.Any3Rule;
import rules.IRule;

import rules.RuleSet;
import rules.WildRule;

public class Model extends EventDispatcher implements IModel {
    private var lastKeyPressed:uint = 0;

    private var reelWeights:Object;
    private var display:Display;
    private var ruleSet:RuleSet;

    private var randomHistory:Array = [];

    //TODO 1) стоит ли представить в виде сущностей 2)добавить правила 3) добавить линии
    private var possibleLines:Array = [LineType.ALL_HORIZONTAL, LineType.SQUARE_DIAGONAL];
    private var displayReelSize:int;
    private var payment:Payment;
    private var wild:IRule;
    private var any3:IRule;


    public function Model() {
        if(!reelWeights) {
            init();
        }
    }

    private function init():void {
        //Узнаем, сколько айтемов доступно к отобаржению пользователю на одном барабане
        displayReelSize = Config.displayReelSize;
        //Получаем данные о том, что на каждой ленте и какая вероятность выпадения
        reelWeights = Config.reelConfiguration;
        //Создаем дисплей
        display = new Display(Config.reelQuantity, displayReelSize, possibleLines);
        //Создаем ленты и помещаем их в дисплей с заданым размером отоброажения
        for each(var a:Object in reelWeights) {
            display.addReel(new Reel(displayReelSize))
        }
        //создаем набор правил
        ruleSet = new RuleSet();
        any3 = new Any3Rule();
        wild = new WildRule();

        ruleSet.add(any3);
        ruleSet.add(wild);
        //Формируем объект выдачи наград
        payment = new Payment();

    }

    public function setKey(key:uint):void {
      //  this.lastKeyPressed = key;
       // dispatchEvent(new Event(Event.CHANGE));

    }

    public function makeRoll():void {
        dispatchEvent(new Event(Event.CHANGE));
    }

    public function getKey():uint {
        return lastKeyPressed;
    }

    /**
     *
     * @return суммарное количество
     */
    public function getPayment():int {
        trace("getPayment")
       return payment.paymentByMatchingRules(getMatchedRules())
    }

    /**
     * Возращаем набор айтемов которые доступны к отображению пользователю
     * @return
     */
    public function getDisplay():AbstractDisplay {
        return display;
    }

    /**
     * метод, который проверит, совпали ли правила по линиям, которые рабоают в дисплее
     * @return
     */
    public function getMatchedRules():Array {
        return ruleSet.matchByCurrentRules(display.availableLines())
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

    /**
     * Узнаем, какие айтемы на риле увидим. Учитываем "зацикленность" барабана
     * @param itemCounter - позиция на барабане
     * @param itemsOnReel - все значения на барабане
     * @return массив значений для отображения
     */
    private function getItemsOnReel(itemCounter:int, itemsOnReel:Array):Array {
        var result:Array = [];
        for (var i:int = 0; i < displayReelSize; i++) {
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
        if(weights.length < displayReelSize) {
            throw new Error("КОНФИГ ДЛЯ ВЕСОВ МЕНЬШЕ РАЗМЕРА ОТОБРАЖАЕМЫХ ЗНАЧЕНИЙ at getRandomOnReel");
        }
        var sum:Number = 1;
        for each(var currentArrayValue:int in weights) {
            sum += currentArrayValue;
        }
        var rand:int = 0;Math.floor(Math.random() * sum);
        //можно использовать для "возврата" предыдущего состояния, например
        randomHistory.push(rand);
        var all:int = 0;
        for (var i:int = 0; i <= weights.length; i++) {
            var currentValue:int = weights[i];
            if (all >= rand) {
                return i
            }
            all += currentValue;

        }
        return -1;
    }
}
}
