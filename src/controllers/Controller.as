package controllers {
import flash.events.KeyboardEvent;

import models.IModel;

public class Controller implements IKeyboardInputHandler {
    public function Controller(aModel:IModel) {
        _model = aModel;
    }
    private var _model:IModel;

    public function keyPressHandler(event:KeyboardEvent):void {
        _model.roll();
    }

}
}
