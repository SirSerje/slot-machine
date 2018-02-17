package rules {
public interface IRule {
    function checkWinOnLine(value:Array):Boolean
    function isRuleAvailableForLine():Boolean; //Представление должно быть тут /
    function countPay(i:int):int;//
}
}
