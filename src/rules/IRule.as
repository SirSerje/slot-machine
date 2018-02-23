package rules {
import models.ILine;

public interface IRule {
    function get name():String;

    function checkWinOnLine(value:ILine):Boolean

    function countPay(i:int):int;
}
}
