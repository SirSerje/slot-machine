package {
import controllers.Controller;
import controllers.IKeyboardInputHandler;

import flash.display.Sprite;
import flash.events.Event;

import folder_models.IModel;
import folder_models.Model;

import views.ComponentView;

import views.CompositeView;
import views.KeyboardInputView;
import views.MatchingRulesView;
import views.ReelsView;
import views.TotalMultiplierView;


public class Main extends Sprite {

    public function Main() {

        var model:IModel = new Model();
        var controller:IKeyboardInputHandler = new Controller(model);

        var reelView:ComponentView = new ReelsView(model);//Вьюшка барабанов
        var matchingRulesView:ComponentView = new MatchingRulesView(model);//Вьюшка совпавших правил
        var totalMultiplier:ComponentView = new TotalMultiplierView(model); //Вьюшка выигрыша
//TODO kbInputView - > compositeView
        var kbInputView:CompositeView = new KeyboardInputView(model, controller, this.stage); //коллектит в себя все вьюшки

        kbInputView.add(reelView);
        kbInputView.add(matchingRulesView);
        kbInputView.add(totalMultiplier);
        addChild(kbInputView);

        model.addEventListener(Event.CHANGE, kbInputView.update);
    }
//TODO убрать русские комменты
    //TODO все приватные начать с _bulshit
    //TODO проверить все ворнинги
    //TODO проверить на двойные строки
}
}
