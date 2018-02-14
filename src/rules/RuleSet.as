package rules {
import rules.AbstractRule;
import rules.Any7Rule;
import rules.AnyBarRule;
import rules.ScatterRule;

public class RuleSet {
    private var rules:Array
    public function RuleSet(rules:Array) {
        for each (var i:String in rules) {
            rules.push(createNewRule(i))
        }
    }

    private function createNewRule(i:String):AbstractRule{
        switch(i) {
            case "one":
                return new ScatterRule()
                break;

            case "two":
                return new AnyBarRule()
                break;

            case "three":
                return new Any7Rule()
                break;
        }
        return null;
    }
}
}
