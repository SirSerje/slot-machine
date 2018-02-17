package models {
import rules.IRule;

public class Payment {

    public function Payment() {
    }

    //TODO really need to be static?
    public function paymentByMatchingRules(matchedRules:Array):int {
        var rulePayment:int = 0;
        var totalPayment:int = 0; //TODO need implement bonus rule somehow
        for each(var rule:IRule in matchedRules) {
            totalPayment += rule.countPay(rulePayment);
        }
        return totalPayment;
    }
}
}
