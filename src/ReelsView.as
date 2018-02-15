package {
import flash.events.Event;

import folder_models.IModel;

import views.ComponentView;

public class ReelsView extends ComponentView {
    public function ReelsView(aModel:IModel, oController:Object = null) {
        super(aModel, oController);
    }

    override public function update(event:Event = null):void {
        trace("update", "ReelsView");
        model.getDisplay();//берем у модели, что вышло //TODO засетить в локальную переменную значение и уже потом с ним работать
        //super.update(event);
    }

    override public function getView():String {
        trace("getView", "ReelsView");

        return "[A,B,C]\n[A,B,C]\n[A,B,C]";
    }
}
}
