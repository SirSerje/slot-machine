package creator {
import items.IItem;

public interface ICreator {
    function createItem(item:String):IItem;
}
}
