package views {
import decorations.AbstractComponent;
import decorations.ConcreteComponent;
import decorations.ConcreteDecoratorRules;
import decorations.ConcreteDecoratorMultiplier;
import decorations.ConcreteDecoratorReels;

import controllers.IKeyboardInputHandler;

import flash.display.ActionScriptVersion;
import flash.display.Stage;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.text.TextField;

import folder_models.AbstractDisplay;
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
//        trace("getKey():",model.getKey());

        var itemsReels:AbstractDisplay = model.getDisplay(); // отвечает айтемы при спине
        var matchedRules:Array = model.getMatchedRules();


        trace("айтемы на дисплее:", itemsReels);
        trace("win rules: ", matchedRules);
        //getTotal

       /* var testComponent:AbstractComponent = new ConcreteComponent("SPIN");
        testComponent = new ConcreteDecoratorReels(testComponent, "S");
        testComponent = new ConcreteDecoratorRules(testComponent);
        testComponent = new ConcreteDecoratorMultiplier(testComponent);*/
//
//        trace(testComponent.getInformation())
        super.update(event);
    }

    private function draw():void {

    }

    private function onAddedToStage(event:Event):void {
        trace("отрисовали текстфилд при ините");

        removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

        tF = new TextField();
        tF.width = target.stageWidth - 1;
        tF.height = target.stageHeight * .5;
        //tF.type = TextFieldType.INPUT;
        tF.selectable = false;
        tF.border = true;
        addChild(tF);

        update(); //TODO раскоментить потом
    }
}
}
