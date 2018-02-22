package {
import configuration.*;
import configuration.LineType;

//Based on the conditions of assignment, configuration file realized in *as file, because there is no need to implement
//server features
public class Config {
    private static var _possibleLines:Array = [LineType.BONUS, LineType.SCATTER, LineType.ALL_HORIZONTAL, LineType.SQUARE_DIAGONAL];
    private static var _displayReelSize:int = 3;
    private static var _reelQuantity:int = 3;
    private static var _reelConfig:Object =
            {
                reel1: {
                    weight: [1, 25, 10, 15, 30, 25, 30, 40, 15, 10, 8, 45, 3, 5, 3, 10, 30, 25, 30, 10, 1, 1],
                    stop: ["BONUS", "CHERRY", "BONUS", "BAR3", "BLANK", "BONUS", "BLANK", "BAR2", "BLANK", "H7", "BLANK", "BAR1", "BLANK", "WILD", "BLANK", "BAR3", "BLANK", "BONUS", "BLANK", "H7", "BLANK", "CHERRY"]
                },
                reel2: {
                    weight: [2, 25, 10, 15, 30, 15, 30, 20, 8, 10, 8, 40, 2, 3, 2, 20, 30, 20, 30, 10, 2, 2],
                    stop: ["BLANK", "CHERRY", "BLANK", "BAR3", "BLANK", "BONUS", "BLANK", "BAR1", "BLANK", "H7", "BLANK", "BAR2", "BLANK", "WILD", "BLANK", "BAR1", "BLANK", "BONUS", "BLANK", "H7", "BLANK", "CHERRY"]
                },
                reel3: {
                    weight: [3, 25, 10, 25, 15, 20, 15, 40, 8, 10, 8, 25, 1, 2, 1, 15, 15, 20, 15, 10, 3, 3],
                    stop: ["BLANK", "BONUS", "CHERRY", "BAR3", "BLANK", "BONUS", "BLANK", "BAR2", "BLANK", "H7", "BLANK", "BAR1", "BLANK", "WILD", "BLANK", "BAR2", "BLANK", "BONUS", "BLANK", "H7", "BLANK", "CHERRY"]
                }
            };

    private static var _payments:Object = {
        WILD : {
            cost:1000
        },
        CHERRY : {
            cost1:2,
            cost2:10,
            cost3:25
        },
        BONUS: {
            cost:10,
            costBonus:1000
        },
        H7: {
            cost:100,
            cost_any:10
        },
        BAR7: {
            cost:25,
            cost_any:10
        },
        BAR3: {
            cost:5,
            cost_any:2
        },
        BAR2: {
            cost:4,
            cost_any:2
        },
        BAR1: {
            cost:3,
            cost_any:2
        }
    };

    public static function get displayReelSize():int {
        return _displayReelSize;
    }

    public static function get reelConfiguration():Object {
        return _reelConfig;
    }

    public static function get reelQuantity():int {
        return _reelQuantity;
    }

    public static function get possibleLines():Array {
        return _possibleLines;
    }

    public static function payByValue(value:String):Object {
        return _payments[value];
    }
}
}
