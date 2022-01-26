package portsim.port;

import java.util.*;
import portsim.cargo.*;
import portsim.movement.*;
import portsim.port.*;
import portsim.ship.*;
import portsim.util.*;

/**
 * A Container Quay is a type of quay specifically designed for the
 * unloading of Container Ship vessels.
 */
public class ContainerQuay extends Quay {

    //variables
    /**
     * Maximum amount of containers the quay can hold
     */
    private int maxContainers;

    //constructor

    /**
     * Creates a new Container Quay with the given ID and maximum number of containers.
     * @param id quay ID
     * @param maxContainers maximum number of containers the quay can handle
     * @throws IllegalArgumentException - if ID or maxContainers < 0
     */
    public ContainerQuay(int id, int maxContainers) {
        super(id);
        if (maxContainers < 0) {
            throw new IllegalArgumentException();
        }

        this.maxContainers = maxContainers;
    }

    //getMaxContainers

    /**
     * Returns the maximum number of containers of this quay can process at once.
     * @return maxContainers
     */
    public int getMaxContainers() {
        return maxContainers;
    }

    //toString

    /**
     * Returns the human-readable string representation of this ContainerQuay.
     * The format of the string to return is
     *
     * ContainerQuay id [Ship: imoNumber] - maxContainers
     * Where:
     * 'id' is the ID of this quay
     * 'imoNumber' is the IMO number of the ship docked at this quay, or None if the quay is
     * unoccupied.
     * 'maxContainers' is the number of containers this quay can take.
     * @override toString in class Quay
     * @return string representation of this ContainerQuay
     */
    public String toString() {
        String s;
        if (this.isEmpty()) {
            s = "ContainerQuay " + this.getId() + " [Ship: None] - " + this.maxContainers;
        } else {
            s = "ContainerQuay " + this.getId() + " [Ship: " + this.getShip().getImoNumber()
                            + "] - " + this.maxContainers;
        }
        return s;
    }
}
