package controllers {
import flash.events.KeyboardEvent;

import models.IModel;

public class Controller implements IKeyboardInputHandler {
    private var _model:IModel;

    public function Controller(aModel:IModel) {
        _model = aModel;
    }

    public function keyPressHandler(event:KeyboardEvent):void {
        _model.roll();
    }

}
}
