package {
import flash.events.Event;

import folder_models.IModel;

import views.ComponentView;

public class View extends ComponentView {


    public function View(aModel:IModel, oController:Object = null) {

        super(aModel, oController);
        this.update();
        trace("вызываем update из View");

    }

    override public function update(event:Event = null):void {

        trace(model.getKey());
        super.update(event);
    }
}
}
