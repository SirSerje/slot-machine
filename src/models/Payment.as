package models {
import rules.IRule;

public class Payment {

    public function Payment() {
    }

    public function paymentByMatchingRules(matchedRules:Array):int {
        var totalPayment:int = 0;
        var rule:IRule;
        for (var i:int = 0; i < matchedRules.length; i++) {
            rule = matchedRules[i];
            totalPayment = rule.countPay(totalPayment);
        }
        return totalPayment;
    }
}
}
