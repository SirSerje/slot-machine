package models {
import rules.IRule;

public class Payment {

    public function Payment() {
    }

    //TODO really need to be static?
    public function paymentByMatchingRules(matchedRules:Array):int {
        var totalPayment:int = 0; //TODO need implement bonus rule somehow
        for each(var rule:IRule in matchedRules) {
            var rulePayment:int = rule.countPay();
            totalPayment += rulePayment;
        }
        return totalPayment;
    }
}
}
