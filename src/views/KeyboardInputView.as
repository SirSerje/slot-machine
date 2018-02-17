package views {

import controllers.IKeyboardInputHandler;

import flash.display.Stage;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.text.TextField;

import models.IModel;

public class KeyboardInputView extends CompositeView {
    private var _target:Stage;
    private var _textField:TextField;

    public function KeyboardInputView(aModel:IModel, aController:IKeyboardInputHandler, target:Stage) {
        super(aModel, aController);
        this._target = target;
        target.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onKeyPress(event:KeyboardEvent):void {
        (_controller as IKeyboardInputHandler).keyPressHandler(event);
    }

    //in this case, composite class knows about component classes and on update() it collect all data,
    //from components which need to be displayed
    override public function update(event:Event = null):void {
        super.update(event);
        _textField.text = getView();
    }

    private function onAddedToStage(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

        _textField = new TextField();
        _textField.width = _target.stageWidth - 1;
        _textField.height = _target.stageHeight * .5;
        _textField.wordWrap = true;
        _textField.selectable = false;
        _textField.border = true;
        _textField.text = "WELCOME! PRESS ANY KEY TO MAKE SPIN";

        addChild(_textField);
    }
}
}
