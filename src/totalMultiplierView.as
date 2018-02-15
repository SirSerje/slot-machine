package {
import flash.events.Event;

import folder_models.IModel;

import views.ComponentView;

public class totalMultiplierView extends ComponentView {
    public function totalMultiplierView(model:IModel) {
        super(model);
    }

    override public function update(event:Event = null):void {
        trace("update", "totalMultiplierView");

        //super.update(event);
    }

    override public function getView():String {
        trace("getView", "totalMultiplierView");

        return "[66666]";
    }
}
}
