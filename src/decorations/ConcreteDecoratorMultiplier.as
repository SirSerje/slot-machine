package decorations {
public class ConcreteDecoratorMultiplier extends AbstractDecorator{
    private var components:AbstractComponent;
    public function ConcreteDecoratorMultiplier(components:AbstractComponent) {
        this.components = components;
    }

    override public function getInformation():String {
        return components.getInformation() + "multiplier: 77" + "\n";
    }
}
}
