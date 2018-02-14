package view {
import Decorator.AbstractComponent;
import Decorator.ConcreteComponent;
import Decorator.ConcreteDecoratorRules;
import Decorator.ConcreteDecoratorMultiplier;
import Decorator.ConcreteDecoratorReels;

import controller.IKeyboardInputHandler;

import flash.display.ActionScriptVersion;
import flash.display.Stage;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.text.TextField;

import model.AbstractDisplay;
import model.IModel;

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
        trace("ключ:",model.getKey());
        var a:AbstractDisplay = model.getItems();
        trace("вес:", a);
        var rules:Object = model.getRules()
        //getTotalMultyplies

//        var testComponent:AbstractComponent = new ConcreteComponent("SPIN");
//        testComponent = new ConcreteDecoratorReels(testComponent, "S");
//        testComponent = new ConcreteDecoratorRules(testComponent);
//        testComponent = new ConcreteDecoratorMultiplier(testComponent);
//
//        trace(testComponent.getInformation())
        super.update(event);
    }

    private function onAddedToStage(event:Event):void {
        trace("отрисовали текстфилд при ините");

        removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

        tF = new TextField();
        tF.width = target.stageWidth - 1;
        tF.height = target.stageHeight * .5;
        //tF.type = TextFieldType.INPUT;
        tF.selectable = false;
        tF.border = true
        addChild(tF);

        //update(); //TODO раскоментить потом
    }
}
}
