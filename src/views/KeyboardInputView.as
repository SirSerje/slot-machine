package views {

import controllers.IKeyboardInputHandler;

import flash.display.Stage;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.text.TextField;

import folder_models.IModel;

public class KeyboardInputView extends CompositeView {
    private var target:Stage;
    private var tF:TextField;

    public function KeyboardInputView(aModel:IModel, aController:IKeyboardInputHandler, target) {
        super(aModel, aController);
        this.target = target;
        target.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onKeyPress(event:KeyboardEvent):void {
        (controller as IKeyboardInputHandler).keyPressHandler(event);
    }

    override public function update(event:Event = null):void {
        model.makeSpin();
        //TODO: remove makeSpin here
        super.update(event);
        tF.text = getView();
    }

    private function onAddedToStage(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

        tF = new TextField();
        tF.width = target.stageWidth - 1;
        tF.height = target.stageHeight * .5;
        tF.selectable = false;
        tF.border = true;
        addChild(tF);

        update();
    }
}
}
