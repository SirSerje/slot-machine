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
        str += "REEL1: REEL2: REEL3:" + "\n"; //TODO dirty ?

        for (var i:int = 0; i < b.length; i++) {
            var m:IReel = b[i];
            var items:Array = [];
            for (var j:int = 0; j < m.getItems().length; j++) {
                items.push((b[j] as IReel).getItems()[i]);
            }
            str += items + "\n";
        }
        return str;
    }
}
}
