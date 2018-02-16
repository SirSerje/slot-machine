package views {
import flash.events.Event;

import models.Display;

import models.IModel;
import models.IReel;

public class ReelsView extends ComponentView {
    private var _display:Display;

    public function ReelsView(aModel:IModel, oController:Object = null) {
        super(aModel, oController);
    }

    override public function update(event:Event = null):void {
        _display = _model.getDisplay();
    }

    override public function getView():String {
        var str:String = "";
        var b:Array = _display.getReels();
        for each (var m:IReel in b) {
           str+=m.getItems() + "\n";
        }
        return str;
    }
}
}
