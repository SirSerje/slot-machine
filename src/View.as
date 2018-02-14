package {
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.text.TextField;
import flash.text.TextFieldType;

public class View extends Sprite {
    private var model:IModel;
    private var controller:IKeyboardInputHandler;
    private var target:Stage;
    private var tF:TextField;

    public function View(aModel:IModel, oController:IKeyboardInputHandler, target:Stage) {
        this.model = aModel;
        this.controller = oController;
        this.target = target;
        model.addEventListener(Event.CHANGE, this.update);
        target.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);

        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage)
    }


    private function onAddedToStage(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        tF = new TextField();
        tF.width = target.stageWidth - 1;
        tF.height = target.stageHeight * .5;
        tF.text = "Hello, World";
        tF.type = TextFieldType.INPUT;
        tF.border = true
        addChild(tF);
    }


    private function onKeyPress(event:KeyboardEvent):void {
        controller.keyPressHandler(event)
    }

    private function update(event:Event):void {
        trace(model.getKey());

        tF.text = (model.getKey()).toString();

    }
}
}
