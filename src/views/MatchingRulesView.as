package views {
import flash.events.Event;

import folder_models.IModel;

import views.ComponentView;

public class MatchingRulesView extends ComponentView {
    private var match:Array;
    public function MatchingRulesView(model:IModel) {
        super(model);
    }

    override public function update(event:Event = null):void {
         match = model.getMatchedRules();//берем у модели, что вышло
        //super.update(event);
    }

    override public function getView():String {

        return "Matching rules: [ " + match + " ]";
    }
}
}
