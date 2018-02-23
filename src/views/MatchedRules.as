package views {
import flash.events.Event;

import models.IModel;

import rules.IRule;

public class MatchedRules extends ComponentView {
    public function MatchedRules(model:IModel) {
        super(model);
    }
    private var _matchedRules:Array;

    override public function getView():String {
        return "Matching rules: " + _matchedRules;
    }

    override public function update(event:Event = null):void {
        _matchedRules = [];
        var arr:Array = _model.getMatchedRules();
        var current:IRule;
        for (var i:int = 0; i < arr.length; i++) {
            current = arr[i];
            _matchedRules.push(current.name)
        }
    }
}
}
