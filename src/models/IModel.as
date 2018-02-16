package models {
import flash.events.IEventDispatcher;

public interface IModel extends IEventDispatcher {
    /**
     * Spin action after user press spin button
     */
    function roll():void

    /**
     * Contains items on every reel after spin
     * @return Object Display
     */
    function getDisplay():Display;
    /**
     *
     * @return array of rule which have win combination
     */
    function getMatchedRules():Array;

    /**
     *
     * @return total payment value
     */
    function getPayment():int
}
}
