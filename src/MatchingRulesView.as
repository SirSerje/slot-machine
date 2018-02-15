package {
import flash.events.Event;

import folder_models.IModel;

import views.ComponentView;

public class MatchingRulesView extends ComponentView {
    public function MatchingRulesView(model:IModel) {
        super(model);
    }

    override public function update(event:Event = null):void {
        trace("update", "MatchingRulesView");
        model.getMatchedRules();//берем у модели, что вышло
        //super.update(event);
    }

    override public function getView():String {
        trace("getView", "MatchingRulesView");

        return "[SOME ONE RULE, ANOTHER RULE]";
    }
}
}
