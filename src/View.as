package {
import flash.events.Event;

import model.IModel;

import view.ComponentView;

public class View extends ComponentView {


    public function View(aModel:IModel, oController:Object = null) {

        super(aModel, oController);
        this.update();
        trace("вызываем udpate из View");

    }

    override public function update(event:Event = null):void {
        trace(model.getKey());
        super.update(event);
    }
}
}
