package views {
import flash.events.Event;

import models.IModel;

public class MatchedRules extends ComponentView {
    private var _matchedRules:Array;

    public function MatchedRules(model:IModel) {
        super(model);
    }

    override public function update(event:Event = null):void {
         _matchedRules = _model.getMatchedRules();//берем у модели, что вышло
    }

    override public function getView():String {

        return "Matching rules: [ " + _matchedRules + " ]";
    }
}
}
