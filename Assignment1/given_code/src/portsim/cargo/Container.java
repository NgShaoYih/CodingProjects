package portsim.cargo;

/**
 * Represents a shipping container, used for holding or transporting something.
 */
public class Container extends Cargo {

    //variables
    /**
     * the type of container being carried
     */
    private ContainerType type;

    /**
     * Creates a new Container of the specified ContainerType, with the given ID and destination.
     * @param id cargo ID
     * @param destination destination port
     * @param type type of container
     * @throws IllegalArgumentException - if ID < 0
     */
    public Container(int id, String destination, ContainerType type) {
        super(id, destination);
        this.type = type;
    }

    /**
     * Returns the type of this container.
     * @return container type
     */
    public ContainerType getType() {
        return type;
    }

    /**
     * Returns the human-readable string representation of this Container.
     * The format of the string to return is
     * Container id to destination [type]
     * Where:
     * 'id' is the id of this cargo
     * 'destination' is the destination of the cargo
     * 'type' is the type of cargo
     * @overrides toString in class Cargo
     * @return String representation of Container
     */
    public String toString() {
        String s = "Container " + this.getId() + " to " + this.getDestination() + " ["
                + this.type + "]";
        return s;
    }
}
