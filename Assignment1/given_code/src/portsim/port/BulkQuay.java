package portsim.port;

import java.util.*;
import portsim.cargo.*;
import portsim.movement.*;
import portsim.port.*;
import portsim.ship.*;
import portsim.util.*;

/**
 * A Bulk Quay is a type of quay specifically designed for the unloading of Bulk Carrier vessels.
 */
public class BulkQuay extends Quay {

    //variables
    /**
     * Maximum amount of tonnage the quay can take
     */
    private int maxTonnage;

    //constructors

    /**
     * Creates a new Bulk Quay with the given ID and max tonnage.
     * @param id quay ID
     * @param maxTonnage maximum tonnage the quay can handle
     */
    public BulkQuay(int id, int maxTonnage) {
        super(id);
        if (maxTonnage < 0) {
            throw new IllegalArgumentException();
        }
        this.maxTonnage = maxTonnage;
    }

    //getMaxTonnage

    /**
     * Returns the maximum number of tonnes of cargo this quay can handle.
     * @return maxTonnage
     */
    public int getMaxTonnage() {
        return this.maxTonnage;
    }

    //toString

    /**
     * Returns the human-readable string representation of this BulkQuay.
     * The format of the string to return is
     * BulkQuay id [Ship: imoNumber] - maxTonnage
     * Where:
     * 'id' is the ID of this quay
     * 'imoNumber' is the IMO number of the ship docked at this quay, or None if the quay is
     * unoccupied.
     * 'maxTonnage' is the maximum weight in tonnes of this quay.
     * @override toString in class Quay
     * @return string representation of this quay
     */
    public String toString() {
        String s;
        if (this.isEmpty()) {
            s = "BulkQuay " + this.getId() + " [Ship: None] - " + this.maxTonnage;
        } else {
            s = "BulkQuay " + this.getId() + " [Ship: " + this.getShip().getImoNumber() + "] - "
                    + this.maxTonnage;
        }
        return s;
    }
}
