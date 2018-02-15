package configuration {
import flash.utils.Dictionary;

import items.BAR1;

import items.BAR2;

import items.BAR3;

import items.BAR7;
import items.BLANK;
import items.BONUS;
import items.CHERRY;
import items.H7;
import items.WILD;

//TODO исходя из условий тестового задания, создаем конфиг на AS для того чтобы не реализовывать приход данных от сервера \ парсинг, etc
public class Config {
    public  function Config() {
    }

    private static var reelQuantity:int = 3;
    private static var visibleQuality:int = 3;

    //TODO подумать на тему того, стоит ли разделить стопы и рилы отдельно
    private static var reelConfig:Object=
    {
        reel1: {
            stops: [BLANK, BAR7, BLANK, BAR3, BLANK, BONUS, BLANK, BAR2, BLANK, H7, BLANK, BAR1, BLANK, WILD, BLANK, BAR3, BLANK, BONUS, BLANK, H7, BLANK, CHERRY],
            weights: [1, 25, 10, 15, 30, 25, 30, 40, 15, 10, 8, 45, 3, 5, 3, 10, 30, 25, 30, 10, 1, 1]
        },
        reel2: {
            stops: [BLANK, BAR7, BLANK, BAR3, BLANK, BONUS, BLANK, BAR2, BLANK, H7, BLANK, BAR1, BLANK, WILD, BLANK, BAR3, BLANK, BONUS, BLANK, H7, BLANK, CHERRY],
            weights: [2, 25, 10, 15, 30, 15, 30, 20, 8, 10, 8, 40, 2, 3, 2, 20, 30, 20, 30, 10, 2, 2]
        },
        reel3: {
            stops: [BLANK, BAR7, BLANK, BAR3, BLANK, BONUS, BLANK, BAR2, BLANK, H7, BLANK, BAR1, BLANK, WILD, BLANK, BAR3, BLANK, BONUS, BLANK, H7, BLANK, CHERRY],
            weights: [3, 25, 10, 25, 15, 20, 15, 40, 8, 10, 8, 25, 1, 2, 1, 15, 15, 20, 15, 10, 3, 3]
        }
    };

    private static var slotParams:Object = {
        reelQuantity: 3,
        visibleQuality: 3
    };

    private static var  winLines:Object = {};




    public  static function get reelConfiguration():Object {
        return reelConfig;
    }

    public static function get slotParameters():Object {
        return slotParams;
    }

    public static function get winLinesConfiguration():Object {
        return winLines;
    }


}
}