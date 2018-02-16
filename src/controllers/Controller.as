package controllers {
import flash.events.KeyboardEvent;

import models.IModel;

public class Controller implements IKeyboardInputHandler {
    private var model:IModel;

    public function Controller(aModel:IModel) {
        this.model = aModel;
    }

    public function keyPressHandler(event:KeyboardEvent):void {
        model.roll();
    }

}
}
