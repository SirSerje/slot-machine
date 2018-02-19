package {
import models.ReelHelper;
import models.ScatterLine;
import models.StraightLine;

import org.flexunit.Assert;

import rules.Any7Rule;
import rules.AnyBarRule;
import rules.BonusRule;
import rules.IRule;
import rules.ScatterRule;
import rules.ThreeOfKind;

/**
 * Check basic game mechanics like getting correct item reel with random, correct combinations on pay line,
 * bonus combo
 */
public class MainTest {
    private var reel:Array = ["BLANK", "H7", "BLANK", "BAR3", "BLANK", "BONUS", "BLANK", "BAR2", "BLANK", "H7", "BLANK", "BAR1", "BLANK", "WILD", "BLANK", "BAR3", "BLANK", "BONUS", "BLANK", "H7", "BLANK", "CHERRY"];
    private var stops:Array = [1, 25, 10, 15, 30, 25, 30, 40, 15, 10, 8, 45, 3, 5, 3, 10, 30, 25, 30, 10, 1, 1];

    [Test]
    public function checkCombos():void {
        var threeOfKind:IRule = new ThreeOfKind();
        Assert.assertEquals(false, threeOfKind.checkWinOnLine(new StraightLine(["BAR1", "BAR2", "BAR1"])));
        Assert.assertEquals(true, threeOfKind.checkWinOnLine(new StraightLine(["WILD", "WILD", "BAR1"])));
        Assert.assertEquals(true, threeOfKind.checkWinOnLine(new StraightLine(["WILD", "BAR1", "WILD"])));
        Assert.assertEquals(true, threeOfKind.checkWinOnLine(new StraightLine(["WILD", "WILD", "WILD"])));
        Assert.assertEquals(false, threeOfKind.checkWinOnLine(new StraightLine(["CHERRY", "WILD", "WILD"])));
        Assert.assertEquals(true, threeOfKind.checkWinOnLine(new StraightLine(["H7", "WILD", "H7"])));

        var any7Rule:IRule = new Any7Rule();
        Assert.assertEquals(true, any7Rule.checkWinOnLine(new StraightLine(["H7", "BAR7", "BAR7"])));
        Assert.assertEquals(false, any7Rule.checkWinOnLine(new StraightLine(["H7", "WILD", "H7"])));
        Assert.assertEquals(true, any7Rule.checkWinOnLine(new StraightLine(["BAR7", "H7", "H7"])));

        var anyBarRule:IRule = new AnyBarRule();
        Assert.assertEquals(true, anyBarRule.checkWinOnLine(new StraightLine(["BAR1", "BAR2", "BAR3"])));
        Assert.assertEquals(true, anyBarRule.checkWinOnLine(new StraightLine(["BAR3", "WILD", "BAR2"])));
        Assert.assertEquals(false, anyBarRule.checkWinOnLine(new StraightLine(["WILD", "WILD", "BAR1"])));

        var scatterRule:IRule = new ScatterRule();
        Assert.assertEquals(true, scatterRule.checkWinOnLine(new ScatterLine(["CHERRY"])));
        Assert.assertEquals(true, scatterRule.checkWinOnLine(new ScatterLine(["WILD", "CHERRY"])));
        Assert.assertEquals(false, scatterRule.checkWinOnLine(new ScatterLine(["BAR1", "WILD", "BAR1"])));
    }

    [Test]
    public function checkRandomization():void {
        Assert.assertEquals(0, ReelHelper.getRandomOnReel(stops));
        Assert.assertEquals(1, ReelHelper.getRandomOnReel(stops, 0.01));
        Assert.assertEquals(8, ReelHelper.getRandomOnReel(stops, 0.5));
        Assert.assertEquals(21, ReelHelper.getRandomOnReel(stops, 1));
    }

    [Test]
    public function checkItemOnReel():void {
        Assert.assertEquals("H7", ReelHelper.getItemsOnReel(ReelHelper.getRandomOnReel(stops, 1), reel, 3)[2]);
    }

    [Test]
    public function checkBonusPayments():void {
        //Bonus + some other win
        var totalPayment:int = 0;
        var matchedRules:Array = [new AnyBarRule(), new Any7Rule(), new BonusRule()];
        var rule:IRule;
        for (var i:int = 0; i < matchedRules.length; i++) {
            rule = matchedRules[i];
            totalPayment = rule.countPay(totalPayment);
        }
        Assert.assertEquals(12000, totalPayment);

        //Simply bonus
        totalPayment = 0;
        matchedRules = [new BonusRule()];
        for (var j:int = 0; j < matchedRules.length; j++) {
            rule = matchedRules[j];
            totalPayment = rule.countPay(totalPayment);
        }
        Assert.assertEquals(10, totalPayment);
    }

}
}