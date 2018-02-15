package folder_models {
import flash.events.IEventDispatcher;

public interface IModel extends IEventDispatcher {
    /**
     * Устанавливаем нажатую клавишу
     * @param key
     */
    function setKey(key:uint):void
    /**
     * Получаем текущую нажатую клавишу
     * @return
     */
    function getKey():uint
    /**
     * Получаем рандомные символы на барабанах
     * @return
     */
    function getItems():AbstractDisplay
    function getMatchedRules():String
}
}
