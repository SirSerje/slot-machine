package {

import config.Config;

import flash.display.Sprite;

public class Main extends Sprite {

    public function Main() {

        var model:IModel = new Model();
        var controller:IKeyboardInputHandler = new Controller(model);
        var view:View = new View(model, controller, this.stage);

        addChild(view);
        //Config.reelConfiguration;
    }

}
}
