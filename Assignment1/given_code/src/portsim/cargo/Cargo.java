package portsim.cargo;

/**
 * Denotes a cargo whose function is to be transported via a Ship or land transport.
 * Cargo is kept track of via its ID.
 */
public abstract class Cargo {

    //variables
    /**
     * id of the cargo
     *
     */
    private int id;
    /**
     * destination of the cargo
     */
    private String destination;

    /**
     * Creates a new Cargo with the given ID and destination port.
     * @param id cargo id
     * @param destination destination port
     */
    public Cargo(int id, String destination) {
        if (id < 0) {
            throw new IllegalArgumentException();
        }
        this.id = id;
        this.destination = destination;
    }

    /**
     * Retrieve the destination of this piece of cargo.
     * @return the cargo's destination
     */
    public String getDestination() {
        return this.destination;
    }

    /**
     * Retrieve the ID of this piece of cargo.
     * @return the cargo's ID
     */
    public int getId() {
        return this.id;
    }

    /**
     * Returns the human-readable string representation of this cargo.
     * The format of the string to return is
     * CargoClass id to destination
     * Where:
     * 'CargoClass' is the cargo class name
     * 'id' is the id of this cargo
     * 'destination' is the destination of the cargo
     * @overrides toString in class Object
     * @return String representation of Cargo
     */
    public String toString() {
        String s = "Cargo " + this.id + " to " + this.destination;
        return s;
    }

}
