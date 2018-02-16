package views {
import flash.events.Event;

import folder_models.AbstractDisplay;
import folder_models.AbstractReel;

import folder_models.IModel;
import folder_models.IReel;
import folder_models.Reel;

import views.ComponentView;

public class ReelsView extends ComponentView {
    private var a:AbstractDisplay;

    public function ReelsView(aModel:IModel, oController:Object = null) {
        super(aModel, oController);
    }

    override public function update(event:Event = null):void {
        a = model.getDisplay();
        //super.update(event);
    }

    override public function getView():String {
        var str:String = "";
        var b:Array = a.getReels();
        for each (var m:IReel in b) {
           str+=m.getItems() + "\n";
        }
        return str;
    }
}
}
