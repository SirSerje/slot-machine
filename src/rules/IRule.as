package rules {
import models.ILine;

public interface IRule {
    function checkWinOnLine(value:ILine):Boolean
    function isRuleAvailableForLine(line:ILine):Boolean; //Представление должно быть тут /
    function countPay(i:int):int;//
    function get name():String;
}
}
