package views {
import flash.events.Event;

import models.IModel;

public class TotalMultiplierView extends ComponentView {
    public function TotalMultiplierView(model:IModel) {
        super(model);
    }
    private var _cash:int;

    override public function getView():String {
        return "Total multiplier: " + _cash.toString();
    }

    override public function update(event:Event = null):void {
        _cash = _model.getPayment();
    }
}
}
