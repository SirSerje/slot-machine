package {

import flash.display.Sprite;
import flash.events.Event;

public class Main extends Sprite {

    public function Main() {

        var model:IModel = new Model();
        var controller:IKeyboardInputHandler = new Controller(model);

        trace("создаем объект view:ComponentView");
      //  var view:ComponentView = new View(model);

        trace("создаем общую вьюшку")
        var kbInputView:CompositeView = new KeyboardInputView(model, controller, this.stage); //коллектит в себя все вьюшки

//        addChild(view);

       // kbInputView.add(view);
        addChild(kbInputView);

        model.addEventListener(Event.CHANGE, kbInputView.update);

    }

}
}
