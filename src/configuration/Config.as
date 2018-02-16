package configuration {

//исходя из условий тестового задания, создаем конфиг на AS для того чтобы не реализовывать приход данных от сервера \ парсинг, etc
public class Config {
    private static var _displayReelSize:int = 3;
    private static var _reelQuantity:int = 3;
    private static var reelConfig:Object =
            {
                a: {
                    weight: [1, 25, 10, 15, 30, 25, 30, 40, 15, 10, 8, 45, 3, 5, 3, 10, 30, 25, 30, 10, 1, 1],
                    stop: ["BAR7", "BAR7", "BLANK", "BAR3", "BLANK", "BONUS", "BLANK", "BAR2", "BLANK", "H7", "BLANK", "BAR1", "BLANK", "WILD", "BLANK", "BAR3", "BLANK", "BONUS", "BLANK", "H7", "BLANK", "CHERRY"]
                },
                b: {
                    weight: [2, 25, 10, 15, 30, 15, 30, 20, 8, 10, 8, 40, 2, 3, 2, 20, 30, 20, 30, 10, 2, 2],
                    stop: ["BAR7", "BAR7", "BLANK", "BAR3", "BLANK", "BONUS", "BLANK", "BAR2", "BLANK", "H7", "BLANK", "BAR1", "BLANK", "WILD", "BLANK", "BAR3", "BLANK", "BONUS", "BLANK", "H7", "BLANK", "CHERRY"]
                },
                c: {
                    weight: [3, 25, 10, 25, 15, 20, 15, 40, 8, 10, 8, 25, 1, 2, 1, 15, 15, 20, 15, 10, 3, 3],
                    stop: ["BAR7", "BAR7", "BLANK", "BAR3", "BLANK", "BONUS", "BLANK", "BAR2", "BLANK", "H7", "BLANK", "BAR1", "BLANK", "WILD", "BLANK", "BAR3", "BLANK", "BONUS", "BLANK", "H7", "BLANK", "CHERRY"]
                }
            };


    public static function get displayReelSize():int {
        return _displayReelSize;
    }

    public static function get reelConfiguration():Object {
        return reelConfig;
    }

    public static function get reelQuantity():int {
        return _reelQuantity;
    }
}
}
