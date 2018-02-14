package {
import flash.events.KeyboardEvent;

public class Controller implements IKeyboardInputHandler {

    public function Controller(aModel:IModel) {
        this.model = aModel;
    }
    private var model:IModel

    public function keyPressHandler(event:KeyboardEvent):void {
        model.setKey(event.charCode);

    }

}
}
