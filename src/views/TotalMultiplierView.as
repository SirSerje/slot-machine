package views {
import flash.events.Event;

import folder_models.IModel;

import views.ComponentView;

public class TotalMultiplierView extends ComponentView {
    private var cash:int;
    public function TotalMultiplierView(model:IModel) {
        super(model);
    }

    override public function update(event:Event = null):void {
        cash = model.getPayment();
        //super.update(event);
    }

    override public function getView():String {
        return "Total multiplier: ["+ cash.toString() + " ]";
    }
}
}
