package rules {
public interface IRule {
    function checkWinOnLine(value:Array):Boolean
    //TODO does we really need this ?
    function getName():String; //Представление должно быть тут /
    function countPay():int;//
}
}
