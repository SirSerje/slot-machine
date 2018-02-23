package models {

import configuration.Config;

import flash.events.Event;
import flash.events.EventDispatcher;

import items.IItem;

import rules.RuleSet;

public class Model extends EventDispatcher implements IModel {
    private var _display:Display;
    private var _displayReelSize:int;
    private var _reelWeights:Object;
    private var _ruleSet:RuleSet;
    private var _matchedRules:Array = [];
    private var _payment:Payment;
    private var _totalPayment:int = 0;
    private var _randomNumbers:Array = [];

    public function Model() {
        init();
    }

    private function init():void {
        //Figuring out, how many items user can see on one reel
        _displayReelSize = Config.displayReelSize;
        //Taking data about reel weights
        _reelWeights = Config.reelConfiguration;
        //creating display object
        _display = new Display(Config.reelQuantity, _displayReelSize, Config.possibleLines);
        //creating reels and adding them to display
        for each(var a:Object in _reelWeights) {
            _display.addReel(new Reel(_displayReelSize));
        }
        //creating game rule types
        _ruleSet = new RuleSet(_displayReelSize);
        //creating payment
        _payment = new Payment();
    }

    public function roll():void {
        var random:Vector.<Number> = new Vector.<Number>(_displayReelSize,true);
        for(var i:int=0; i<random.length;i++) random[i] = Math.random();

        _randomNumbers.push(random);
        _display.updateReels(newAvailableItems(random));
        _matchedRules = _ruleSet.matchByCurrentRules(_display.availableLines());
        _totalPayment = _payment.paymentByMatchingRules(_matchedRules);

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

    private function newAvailableItems(random:Vector.<Number>):Array {
        var itemsOnReel:Array = [];
        for (var i:int = 0; i < _displayReelSize; i++) {
            var r:Object = _reelWeights["reel" + (i + 1)];
            if (r.stop.length != r.weight.length) {
                trace("Probabilities config length doesn't match reels config");
            }
            var randomPosOnReel:int = ReelHelper.getRandomOnReel(r.weight, random[i]);
            var items:Vector.<IItem> = ReelHelper.getItemsOnReel(randomPosOnReel, r.stop, _displayReelSize);
            itemsOnReel.push(items);
        }
        return itemsOnReel;
    }
}
}
