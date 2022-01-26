package portsim.cargo;

/**
 * Bulk cargo is commodity cargo that is transported unpacked in large quantities.
 */
public class BulkCargo extends Cargo {

    //variables
    /**
     * tonnage for the cargo
     */
    private int tonnage;
    /**
     * the type of BulkCargo being carried
     */
    private BulkCargoType type;

    /**
     * Creates a new Bulk Cargo with the given ID, destination, tonnage and type.
     * @param id cargo ID
     * @param destination destination port
     * @param tonnage the weight of the cargo
     * @param type the type of cargo
     * @throws IllegalArgumentException - if ID < 0 or tonnage < 0
     */
    public BulkCargo(int id, String destination, int tonnage, BulkCargoType type) {
        super(id, destination);
        if (tonnage < 0) {
            throw new IllegalArgumentException();
        }
        this.tonnage = tonnage;
        this.type = type;
    }

    /**
     * Returns the tonnage of this bulk cargo.
     * @return cargo tonnage
     */
    public int getTonnage() {
        return this.tonnage;
    }

    /**
     * Returns the type of this bulk cargo.
     * @return cargo type
     */
    public BulkCargoType getType() {
        return this.type;
    }

    /**
     * Returns the human-readable string representation of this BulkCargo.
     * The format of the string to return is
     * BulkCargo id to destination [type - tonnage]
     * Where:
     * 'id' is the id of this cargo
     * 'destination' is the destination of the cargo
     * 'type' is the type of cargo
     * 'tonnage' is the tonnage of the cargo
     * @overrides toString in class Cargo
     * @return String representation of BulkCargo
     */
    public String toString() {
        String s = "BulkCargo " + this.getId() + " to " + this.getDestination() + " [" + this.type
                + " " + "- " + this.tonnage + "]";
        return s;
    }

}
