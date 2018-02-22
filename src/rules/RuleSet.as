package rules {
import items.Bar1Item;
import items.Bar2Item;
import items.Bar3Item;
import items.Bar7Item;
import items.BarItem;
import items.BlankItem;
import items.BonusItem;
import items.H7Item;
import items.IItem;
import items.ScatterItem;
import items.SevenItem;
import items.WildItem;

import models.ILine;

/**
 * RuleSet class knows about all rule types in slot
 */
public class RuleSet {

    private var _availableRules:Array = [];

    public function RuleSet() {
        init();
    }

    private function init():void {

        var threeItems:Vector.<IItem> = new Vector.<IItem>();
        threeItems.push(new Bar1Item(), new Bar2Item(), new Bar3Item(), new H7Item(), new Bar7Item());

        var anyItems:Vector.<IItem> = new Vector.<IItem>();
        anyItems.push(new WildItem());

        var exceptItems:Vector.<IItem> = new Vector.<IItem>();
        exceptItems.push(new BlankItem(), new ScatterItem());

        var anyBarItems:Vector.<IItem> = new Vector.<IItem>();
        anyBarItems.push(new BarItem());

        var scatterItems:Vector.<IItem> = new Vector.<IItem>();
        scatterItems.push(new ScatterItem());

        var anySevenItems:Vector.<IItem> = new Vector.<IItem>();
        anySevenItems.push(new SevenItem());

        var bonusItem:Vector.<IItem> = new Vector.<IItem>();
        bonusItem.push(new BonusItem());


        var _threeOfKind:rules.IRule = new ThreeOfKindRule(threeItems, anyItems, exceptItems, 3);
        var _anySeven:rules.IRule = new Any7Rule(anySevenItems, anyItems, exceptItems, 3);
        var _anyBar:rules.IRule = new AnyBarRule(anyBarItems, anyItems, exceptItems, 3);
        var _scatter:rules.IRule = new ScatterRule(scatterItems, null, null);
        var _bonus:rules.IRule = new BonusRule(bonusItem, null, null, 3);

        add(_threeOfKind);
        add(_anyBar);
        add(_anySeven);
        add(_scatter);
        add(_bonus);
    }

    /**
     * Method check, what kind of lines have prize combinations
     * @param itemOnLines - all possible lines, which user see on display
     * @return - array of win combinations
     *
     */
    public function matchByCurrentRules(itemOnLines:Array):Array {
        var winComboName:Array = [];
        var line:ILine;
        var rule:IRule;
        var bonus:IRule;
        var isWin:Boolean;
        for (var i:int = 0; i < itemOnLines.length; i++) {
            line = itemOnLines[i];
            for (var j:int = 0; j < _availableRules.length; j++) {
                rule = _availableRules[j];
                isWin = rule.checkWinOnLine(line);
                if (isWin) {
                    if (!(rule is BonusRule)) {
                        winComboName.push(rule);
                    } else {
                        bonus = rule;
                    }
                    break;
                }
            }
        }
        bonus && winComboName.push(bonus);
        return winComboName;
    }

    private function add(rule:IRule):void {
        _availableRules.push(rule);
    }
}
}
