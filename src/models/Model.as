package models {
import configuration.Config;

import flash.events.Event;
import flash.events.EventDispatcher;

import configuration.LineType;

import models.ReelHelper;

import rules.ThreeOfKind;
import rules.AnyBarRule;
import rules.Any7Rule;
import rules.IRule;

import rules.RuleSet;
import rules.BonusRule;
import rules.ScatterRule;
import rules.WildRule;

public class Model extends EventDispatcher implements IModel {
    //TODO  добавить линии как сущности
    private var _display:Display;
    private var _displayReelSize:int;
    private var _reelWeights:Object;

    private var _ruleSet:RuleSet;

    private var _matchedRules:Array = [];

    private var _payment:Payment;
    private var _totalPayment:int = 0;
    //Hold spin history
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
            _display.addReel(new Reel(_displayReelSize))
        }
        //creating game rule types
        _ruleSet = new RuleSet();
        //adding rules to rule set
        _ruleSet.add(new ScatterRule());
        _ruleSet.add(new ThreeOfKind());
        _ruleSet.add(new Any7Rule());
        _ruleSet.add(new AnyBarRule());
        //added last, because relies on previous wins
        _ruleSet.add(new BonusRule());
        //creating payment object
        _payment = new Payment();
    }

    public function roll():void {
        _randomNumbers.push(Math.random());
        _display.updateReels(newAvailableItems(/*_randomNumbers[length-1]*/));
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

    private function newAvailableItems(random:int = 0):Array {
        var itemsOnReel:Array = [];
        for (var i:int = 0; i < _displayReelSize; i++) {
            var r:Object = _reelWeights["reel" + (i + 1)];
            if (r.stop.length != r.weight.length) {
                trace("Probabilities config length doesn't match reels config");
            }
            var randomPosOnReel:int = ReelHelper.getRandomOnReel(r.weight, random);
            var items:Array = ReelHelper.getItemsOnReel(randomPosOnReel, r.stop, _displayReelSize);
            itemsOnReel.push(items);
        }
        return itemsOnReel;
    }


}
}
