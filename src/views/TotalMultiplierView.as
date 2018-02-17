package views {
import flash.events.Event;

import models.IModel;

import views.ComponentView;

public class TotalMultiplierView extends ComponentView {
    private var _cash:int;

    public function TotalMultiplierView(model:IModel) {
        super(model);
    }

    override public function update(event:Event = null):void {
        _cash = _model.getPayment();
    }

    override public function getView():String {
        return "Total multiplier: ["+ _cash.toString() + "]";
    }
}
}
