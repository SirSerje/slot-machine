package models {

import flash.events.Event;
import flash.events.EventDispatcher;

import items.Bar1Item;
import items.Bar2Item;
import items.Bar3Item;
import items.Bar7Item;

import items.BarItem;
import items.BlankItem;
import items.H7Item;
import items.IItem;
import items.ScatterItem;
import items.SevenItem;
import items.WildItem;

import rules.Any7Rule;
import rules.AnyBarRule;

import rules.IRule;
import rules.RuleSet;
import rules.ThreeOfKindRule;

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


    private var _tOK:IRule;
    private var _any7:IRule;
    private var _anyBar:IRule;


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
        _ruleSet = new RuleSet();

        _tOK = new ThreeOfKindRule(3);
        _any7 = new Any7Rule(3);
        _anyBar = new AnyBarRule(3);


        var anyItems:Vector.<IItem> = new Vector.<IItem>();
        var exceptItems:Vector.<IItem> = new Vector.<IItem>();
        var anyBarItems:Vector.<IItem> = new Vector.<IItem>();

        var threeItems:Vector.<IItem> = new Vector.<IItem>();
        var anySevenItems:Vector.<IItem> = new Vector.<IItem>();

        threeItems.push(new Bar1Item(), new Bar2Item(), new Bar3Item(), new H7Item(), new Bar7Item());
        exceptItems.push(new BlankItem(), new ScatterItem());
        anyItems.push(new WildItem());

        anySevenItems.push(new SevenItem());
        anyBarItems.push(new BarItem());


        _tOK.setItems(threeItems, anyItems, exceptItems);
        _anyBar.setItems(anyBarItems, anyItems, exceptItems);
        _any7.setItems(anySevenItems, anyItems, exceptItems);

        _ruleSet.add(_tOK);
        _ruleSet.add(_anyBar);
        _ruleSet.add(_any7);


        //_ruleSet.add(new AnyBarRule());
        //_ruleSet.add(new BonusRule());


        _payment = new Payment();
    }

    public function roll():void {
        var random:Vector.<Number> = new Vector.<Number>(_displayReelSize,true);
        for(var i:int=0; i<random.length;i++) random[i] = 0;

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
