package {
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

import models.ILine;
import models.ReelHelper;
import models.StraightLine;

import org.flexunit.Assert;

import rules.Any7Rule;

import rules.AnyBarRule;

import rules.IRule;
import rules.ThreeOfKindRule;

/**
 * Check basic game mechanics like getting correct item reel with random, correct combinations on pay line,
 * bonus combo
 */
public class MainTest {
    private var reel:Array = ["BLANK", "H7", "BLANK", "BAR3", "BLANK", "BONUS", "BLANK", "BAR2", "BLANK", "H7", "BLANK", "BAR1", "BLANK", "WILD", "BLANK", "BAR3", "BLANK", "BONUS", "BLANK", "H7", "BLANK", "CHERRY"];
    private var stops:Array = [1, 25, 10, 15, 30, 25, 30, 40, 15, 10, 8, 45, 3, 5, 3, 10, 30, 25, 30, 10, 1, 1];



    [Test]
    public function checkCombos():void {
        var threeOfKind:IRule = new ThreeOfKindRule(3);
        var anyBar:IRule = new AnyBarRule(3);
        var any7:IRule = new Any7Rule(3);


        var anyItems:Vector.<IItem> = new Vector.<IItem>();
        var exceptItems:Vector.<IItem> = new Vector.<IItem>();
        var threeItems:Vector.<IItem> = new Vector.<IItem>();
        var anyBarItems:Vector.<IItem> = new Vector.<IItem>();
        var anySeven:Vector.<IItem> = new Vector.<IItem>();

        threeItems.push(new Bar1Item(), new Bar2Item(), new Bar3Item(), new H7Item(), new Bar7Item());
        exceptItems.push(new BlankItem(), new ScatterItem());
        anyBarItems.push(new BarItem());
        anyItems.push(new WildItem());
        anySeven.push(new SevenItem());

        threeOfKind.setItems(threeItems, anyItems, exceptItems);
        anyBar.setItems(anyBarItems, anyItems, exceptItems);
        any7.setItems(anySeven, anyItems, exceptItems);

        var items:Vector.<IItem> = new Vector.<IItem>(3);
        var line:ILine = new StraightLine(items);

        var object:Object = {
          /*  rule1: {items: ["BAR2", "BAR2", "BAR2"], rule: threeOfKind, line: StraightLine, result: true, index: 1},  //1
            rule2: {items: ["WILD", "WILD", "WILD"], rule: threeOfKind, line: StraightLine, result: true, index: 2},  //2
            rule3: {items: ["CHERRY", "WILD", "WILD"], rule: threeOfKind, line: StraightLine, result: false, index: 3}, //3
            rule4: {items: ["H7", "WILD", "H7"], rule: threeOfKind, line: StraightLine, result: true, index: 4},  //4
            rule5: {items: ["WILD", "H7", "BAR2"], rule: threeOfKind, line: StraightLine, result: false, index: 5}, //5
            rule6: {items: ["BAR1", "BAR2", "BAR1"], rule: threeOfKind, line: StraightLine, result: false, index: 6},  //6

            rule7:  {items: ["BAR1", "BAR2", "BAR3"], rule: anyBar, line: StraightLine, result: true, index: 7},  //7
            rule8:  {items: ["BAR1", "BAR3", "BAR3"], rule: anyBar, line: StraightLine, result: true, index: 8},  //8
            rule9:  {items: ["BAR3", "WILD", "BAR2"], rule: anyBar, line: StraightLine, result: true, index: 9},  //9
            rule10: {items: ["WILD", "WILD", "BAR1"], rule: anyBar, line: StraightLine, result: false, index: 10},  //10
            rule11: {items: ["BAR1", "WILD", "BONUS"], rule: anyBar, line: StraightLine, result: false, index: 11},  //11
            rule12: {items: ["BAR1", "BAR2", "WILD"], rule: anyBar, line: StraightLine, result: false, index: 12},  //12*/

            rule13: {items: ["H7", "BAR7", "BAR7"], rule: any7, line: StraightLine, result: true, index: 13},  //13
            rule14: {items: ["WILD", "BAR7", "WILD"], rule: any7, line: StraightLine, result: false, index: 14},  //14
            rule15: {items: ["H7", "BAR7", "WILD"], rule: any7, line: StraightLine, result: true, index: 15}  //15
    };
        for each(var item in object) {
            tr(item);
            items[0] = ReelHelper.createItem(item.items[0]);
            items[1] = ReelHelper.createItem(item.items[1]);
            items[2] = ReelHelper.createItem(item.items[2]);

            Assert.assertEquals(item.result, (item.rule as IRule).checkWinOnLine(line));
            trace("DONE")
        }

        function tr(item:Object) {
            trace("TEST:", item.index, item.items, item.rule, item.line, item.result);
        }




        /* var any7Rule:IRule = new Any7Rule();
         Assert.assertEquals(true, any7Rule.checkWinOnLine(new StraightLine(["H7", "BAR7", "BAR7"] 
         Assert.assertEquals(false, any7Rule.checkWinOnLine(new StraightLine(["H7", "WILD", "H7"] 
         Assert.assertEquals(true, any7Rule.checkWinOnLine(new StraightLine(["BAR7", "H7", "H7"] 

         var anyBarRule:IRule = new AnyBarRule();
         Assert.assertEquals(true, anyBarRule.checkWinOnLine(new StraightLine(["BAR1", "BAR2", "BAR3"] 
         Assert.assertEquals(true, anyBarRule.checkWinOnLine(new StraightLine(["BAR1", "BAR3", "BAR3"] 
         Assert.assertEquals(true, anyBarRule.checkWinOnLine(new StraightLine(["BAR3", "WILD", "BAR2"] 
         Assert.assertEquals(false, anyBarRule.checkWinOnLine(new StraightLine(["WILD", "WILD", "BAR1"] 

         var scatterRule:IRule = new ScatterRule();
         Assert.assertEquals(true, scatterRule.checkWinOnLine(new ScatterLine(["CHERRY"] 
         Assert.assertEquals(true, scatterRule.checkWinOnLine(new ScatterLine(["WILD", "CHERRY"] 
         Assert.assertEquals(false, scatterRule.checkWinOnLine(new ScatterLine(["BAR1", "WILD", "BAR1"] 
         }*/
    }

  /*  [Test]
    public function checkRandomization():void {
        Assert.assertEquals(0, ReelHelper.getRandomOnReel(stops));
        Assert.assertEquals(1, ReelHelper.getRandomOnReel(stops, 0.01));
        Assert.assertEquals(8, ReelHelper.getRandomOnReel(stops, 0.5));
        Assert.assertEquals(21, ReelHelper.getRandomOnReel(stops, 1));
    }
*/
   /* [Test]
    public function checkItemOnReel():void {
        Assert.assertEquals("H7", ReelHelper.getItemsOnReel(ReelHelper.getRandomOnReel(stops, 1), reel, 3)[2]);
    }*/

//    [Test]
//    public function checkBonusPayments():void {
//        //Bonus + some other win
//        var totalPayment:int = 0;
//        var matchedRules:Array = [new AnyBarRule(), new Any7Rule(), new BonusRule()];
//        var rule:IRule;
//        for (var i:int = 0; i < matchedRules.length; i++) {
//            rule = matchedRules[i];
//            totalPayment = rule.countPay(totalPayment);
//        }

//
//        //Simply bonus
//        totalPayment = 0;
//        matchedRules = [new BonusRule()];
//        for (var j:int = 0; j < matchedRules.length; j++) {
//            rule = matchedRules[j];
//            totalPayment = rule.countPay(totalPayment);
//        }
//    }

}
}