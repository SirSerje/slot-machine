package views {

import controllers.IKeyboardInputHandler;

import flash.display.Stage;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.text.TextField;

import models.IModel;

public class KeyboardInputView extends CompositeView {
    private var target:Stage;
    private var tF:TextField;

    public function KeyboardInputView(aModel:IModel, aController:IKeyboardInputHandler, target:Stage) {
        super(aModel, aController);
        this.target = target;
        target.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onKeyPress(event:KeyboardEvent):void {
        (_controller as IKeyboardInputHandler).keyPressHandler(event);
    }

    //in this case, composite class knows about component classes and on update() it collect all data,
    //from components which need to be displayed
    override public function update(event:Event = null):void {
        _model.makeSpin();
        //TODO: remove makeSpin here
        super.update(event);
        tF.text = getView();
    }

    private function onAddedToStage(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        //creating textfield item
        tF = new TextField();
        tF.width = target.stageWidth - 1;
        tF.height = target.stageHeight * .5;
        tF.wordWrap = true;
        tF.selectable = false;
        tF.border = true;
        addChild(tF);

        update();
    }
}
}
