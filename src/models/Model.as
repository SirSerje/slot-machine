package models {
import configuration.Config;

import flash.events.Event;
import flash.events.EventDispatcher;

import configuration.LineType;

import rules.Any3Rule;
import rules.IRule;

import rules.RuleSet;
import rules.BonusRule;

public class Model extends EventDispatcher implements IModel {
    private var lastKeyPressed:uint = 0;

    private var _reelWeights:Object;
    private var _display:Display;
    private var _ruleSet:RuleSet;

    private var randomHistory:Array = [];

    //TODO 1) стоит ли представить в виде сущностей 2)добавить правила 3) добавить линии
    private var _possibleLines:Array = [LineType.ALL_HORIZONTAL, LineType.SQUARE_DIAGONAL];
    private var _displayReelSize:int;
    private var payment:Payment;
    private var wild:IRule;
    private var any3:IRule;


    public function Model() {
            init();
    }

    private function init():void {
        //Figuring out, how many items user can see on one reel
        _displayReelSize = Config.displayReelSize;
        //Taking data about reel weights
        _reelWeights = Config.reelConfiguration;
        //creating display object
        _display = new Display(Config.reelQuantity, _displayReelSize, _possibleLines);
        //creating reels and adding them to display
        for each(var a:Object in _reelWeights) {
            _display.addReel(new Reel(_displayReelSize))
        }
        //creating game rule types
        _ruleSet = new RuleSet();
        any3 = new Any3Rule();
        wild = new BonusRule();
        _ruleSet.add(any3);
        _ruleSet.add(wild);
        //creating payment object
        payment = new Payment();
    }

    //TODO remove
    public function setKey(key:uint):void {
      //  this.lastKeyPressed = key;
       // dispatchEvent(new Event(Event.CHANGE));

    }

    public function makeRoll():void {
        //TODO add makeSpin()
        //TODO сюда правила
        //TODO add расчет пейментов и выдать переменную
        dispatchEvent(new Event(Event.CHANGE));
    }

    //TODO not needed
    public function getKey():uint {
        return lastKeyPressed;
    }

    /**
     *
     * @return total win size
     */
    public function getPayment():int {
        trace("getPayment");//TODO вынести в отдельную переменную а запускать это в makeRoll
       return payment.paymentByMatchingRules(getMatchedRules())
    }

    /**
     * @return items which user can see on every reel
     */
    public function getDisplay():Display {
        return _display;
    }

    /**
     * Method checks what rules
     * @return
     */
    public function getMatchedRules():Array {
        //TODO отдавать только переменную, логику перенести в makeRoll
        return _ruleSet.matchByCurrentRules(_display.availableLines())
    }

    /**
     * Реализуем логику "крутки" лент
     */
    public function makeSpin():void {
        var itemsOnReel:Array = [];
        for each(var a:Object in _reelWeights) {
            if( a.stop.length != a.weight.length) {
                throw new Error("Таблица вероятностей не соотвествуют таблице символов на барабане at getItems ")
            }
            var randomPosOnReel:int = getRandomOnReel(a.weight);
            var items:Array = getItemsOnReel(randomPosOnReel, a.stop);
            itemsOnReel.push(items);
        }
        _display.updateReels(itemsOnReel); //TODO _display.updateReels(itemsOnReel) перенести в makeRoll ТОЛЬКО ЄТУ СТРОКУ
    }

    /**
     * Узнаем, какие айтемы на риле увидим. Учитываем "зацикленность" барабана
     * @param itemCounter - позиция на барабане
     * @param itemsOnReel - все значения на барабане
     * @return массив значений для отображения
     */
    private function getItemsOnReel(itemCounter:int, itemsOnReel:Array):Array {
        var result:Array = [];
        for (var i:int = 0; i < _displayReelSize; i++) {
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
     * returns certain item
     * @param weights - массив
     * @return - случайное значение в массиве
     */
    private function getRandomOnReel(weights:Array):int {
        if(weights.length != _displayReelSize) {
            throw new Error("Weights configКОНФИГ ДЛЯ ВЕСОВ МЕНЬШЕ РАЗМЕРА ОТОБРАЖАЕМЫХ ЗНАЧЕНИЙ at getRandomOnReel");
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
