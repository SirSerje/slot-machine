package config {
//TODO исходя из условий тестового задания, создаем конфиг на AS для того чтобы не реализовывать приход данных от сервера \ парсинг, etc
public class Config {
    public function Config() {
    }

    private var reelQuantity:int = 3;
    private var visibleQuality:int = 3;

    //TODO подумать на тему того, стоит ли разделить стопы и рилы отдельно
    private var reelConfig:Object = {
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
    }

    private var slotParams:Object = {
        reelQuantity: 3,
        visibleQuality: 3
    }

    private var winLines:Object = {}

    public function get reelConfiguration():Object {
        return reelConfig;
    }

    public function get slotParameters():Object {
        return slotParams;
    }

    public function get winLinesConfiguration():Object {
        return winLines;
    }


}
}
