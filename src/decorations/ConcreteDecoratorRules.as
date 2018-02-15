package decorations {
public class ConcreteDecoratorRules extends AbstractDecorator{
    private var components:AbstractComponent;
    public function ConcreteDecoratorRules(components:AbstractComponent) {
        this.components = components;
    }

    override public function getInformation():String {
        return components.getInformation() + "matching rules: [BONUS], [H7]" + "\n";
    }
}
}
