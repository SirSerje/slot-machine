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
    private const _possibleLines:Array = [LineType.ALL_HORIZONTAL, LineType.SQUARE_DIAGONAL];
    //TODO 1) стоит ли представить в виде сущностей 2)добавить правила 3) добавить линии
    private var _reelWeights:Object;
    private var _display:Display;
    private var _ruleSet:RuleSet;
    private var _randomHistory:Array = [];
    private var _displayReelSize:int;
    private var payment:Payment;
    private var _wild:IRule;
    private var _any3:IRule;
    private var _totalPayment:int = 0;
    private var _matchedRules:Array = [];


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
        _any3 = new Any3Rule();
        _wild = new BonusRule();
        _ruleSet.add(_any3);
        _ruleSet.add(_wild);
        //creating payment object
        payment = new Payment();
    }

    public function roll():void {
        _display.updateReels(newAvailableItems());
        _matchedRules = _ruleSet.matchByCurrentRules(_display.availableLines());
        _totalPayment = payment.paymentByMatchingRules(getMatchedRules());

        dispatchEvent(new Event(Event.CHANGE));
    }


    public function getPayment():int {
       return _totalPayment;
    }

    public function getDisplay():Display {
        return _display;
    }

    public function getMatchedRules():Array {
        return _matchedRules;
    }

    public function newAvailableItems():Array {
        var itemsOnReel:Array = [];
        for each(var a:Object in _reelWeights) {
            if( a.stop.length != a.weight.length) {
                throw new Error("Probabilities config length doesn't match reels config");
            }
            var randomPosOnReel:int = getRandomOnReel(a.weight);
            var items:Array = getItemsOnReel(randomPosOnReel, a.stop);
            itemsOnReel.push(items);
        }
        return itemsOnReel
    }

    /**
     * Defines, what items on reel user sees.
     * @param itemCounter - position on reel
     * @param itemsOnReel - all available items, placed on reel
     * @return items on reel available for show
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
     * returns certain randomized item
     * @param weights - probabilities array
     * @return - random position
     */
    private function getRandomOnReel(weights:Array):int {
        //TODO тут была проверочка на то, соотвествует ли weights == stops
        var sum:Number = 1;
        for each(var currentArrayValue:int in weights) {
            sum += currentArrayValue;
        }
        var rand:int = 0;Math.floor(Math.random() * sum);
        //allow to save history of all spins user made during session
        _randomHistory.push(rand);
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
