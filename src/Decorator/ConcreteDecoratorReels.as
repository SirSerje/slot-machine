package Decorator {
public class ConcreteDecoratorReels extends AbstractDecorator{
    private var components:AbstractComponent;
    public function ConcreteDecoratorReels(components:AbstractComponent, i:String) {
        this.components = components;
    }

    override public function getInformation():String {
        return components.getInformation() + "decoration ALPHA" + "\n";
    }
}
}
