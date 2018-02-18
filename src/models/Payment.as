package models {
import rules.IRule;

public class Payment {

    public function Payment() {
    }

    public function paymentByMatchingRules(matchedRules:Array):int {
        var totalPayment:int = 0;
        var rule:IRule;
        for(var i:int = matchedRules.length; i>0; i--) {
            rule = matchedRules[i-1];
            totalPayment = rule.countPay(totalPayment);
        }
        return totalPayment;
    }
}
}
