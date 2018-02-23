package rules {
public interface IRuleSet {
    function initRules(value:int):void
    function matchByCurrentRules(itemOnLines:Array):Array;
}
}
