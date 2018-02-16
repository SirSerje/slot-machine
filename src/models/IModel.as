package models {
import flash.events.IEventDispatcher;

public interface IModel extends IEventDispatcher {
    function makeRoll():void
    function makeSpin():void;//TODO why duplicates?
    function getDisplay():Display;
    function getMatchedRules():Array;
    function getPayment():int
}
}
