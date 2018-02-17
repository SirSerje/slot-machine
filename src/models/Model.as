package models {
import configuration.Config;

import flash.events.Event;
import flash.events.EventDispatcher;

import configuration.LineType;

import models.ReelHelper;

import rules.ThreeOfKind;
import rules.AnyBarRule;
import rules.AnyH7Rule;
import rules.IRule;

import rules.RuleSet;
import rules.BonusRule;
import rules.ScatterRule;

public class Model extends EventDispatcher implements IModel {
    private const _possibleLines:Array = [LineType.ALL_ITEMS, LineType.ALL_HORIZONTAL, LineType.SQUARE_DIAGONAL];
    //TODO  добавить линии как сущности
    private var _display:Display;
    private var _displayReelSize:int;
    private var _reelWeights:Object;

    private var _ruleSet:RuleSet;
    private var _wild:IRule;
    private var _any3:IRule;
    private var _scatter:IRule;
    private var _anyH7:IRule;
    private var _anyBar:IRule;
    private var _bonus:IRule;

    private var _matchedRules:Array = [];

    private var _payment:Payment;
    private var _totalPayment:int = 0;


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
        _any3 = new ThreeOfKind();
        _wild = new BonusRule();
        _scatter = new ScatterRule();
        _anyH7 = new AnyH7Rule();
        _anyBar = new AnyBarRule();
        _bonus = new BonusRule();
        //adding rules to rule set
        _ruleSet.add(_scatter);
        _ruleSet.add(_any3);
        _ruleSet.add(_wild);
        _ruleSet.add(_anyH7);
        _ruleSet.add(_anyBar);
        _ruleSet.add(_bonus);
        //creating payment object
        _payment = new Payment();
    }

    public function roll():void {
        _display.updateReels(newAvailableItems());
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

    private function newAvailableItems():Array {
        var itemsOnReel:Array = [];
        for (var i:int = 0; i < _displayReelSize; i++) {
            var r:Object = _reelWeights["reel" + (i + 1)];
            if (r.stop.length != r.weight.length) {
                trace("Probabilities config length doesn't match reels config");
            }
            var randomPosOnReel:int = ReelHelper.getRandomOnReel(r.weight);
            var items:Array = ReelHelper.getItemsOnReel(randomPosOnReel, r.stop, _displayReelSize);
            itemsOnReel.push(items);
        }
        return itemsOnReel;
    }


}
}
