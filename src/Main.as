package {

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.text.TextField;
import flash.text.TextFieldType;

public class Main extends Sprite {
    public function Main() {


        if (stage) {
            preInit();
            onAddedToStage();
        } else {
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }
    }

    private function preInit():void {
            //TODO взять конфиги
        //TODO ролл должен быть коммандой
    }

    private function onAddedToStage(e:Event = null):void {
        removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;
        stage.stageFocusRect = false;
        stage.showDefaultContextMenu = false;

        //_______________________________________

        var textField:TextField = new TextField();
        textField.text = "Hello, World";
        textField.type = TextFieldType.INPUT;
        textField.border = true
        addChild(textField);
    }
}
}
