package folder_models {
import rules.IRule;

public class Payment {

    private var payments:Object = {
        Any3Rule:5,
        WildRule:1000
    }
    private var matchedRules:Array = [];

    public function Payment() {
    }


    //Платежи должны знать о правилах
    //При этом правила не должны знать о платежах
    public function paymentByMatchingRules(matchedRules:Array):int {
        this.matchedRules = matchedRules;
        var totalPayment:int = 0;
        for each(var rule:IRule in matchedRules) {
            var rulePayment:int = rule.countPay();
            totalPayment += rulePayment;
        }
        return totalPayment;
    }
}
}
