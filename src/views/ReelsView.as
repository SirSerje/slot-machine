package views {
import flash.events.Event;

import models.Display;
import models.IModel;
import models.IReel;

public class ReelsView extends ComponentView {
    public function ReelsView(aModel:IModel, oController:Object = null) {
        super(aModel, oController);
    }
    private var _display:Display;

    override public function getView():String {
        var str:String = "";
        var b:Array = _display.getReels();
        str += "REEL1: REEL2: REEL3:" + "\n";

        for (var i:int = 0; i < b.length; i++) {
            var m:IReel = b[i];
            var items:Array = [];
            for (var j:int = 0; j < m.items.length; j++) {
                items.push((b[j] as IReel).items[i].name);
            }
            str += items + "\n";
        }
        return str;
    }

    override public function update(event:Event = null):void {
        _display = _model.getDisplay();
    }
}
}
