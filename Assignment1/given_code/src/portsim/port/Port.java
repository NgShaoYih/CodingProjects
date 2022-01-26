package portsim.port;

import java.util.*;
import portsim.cargo.*;
import portsim.movement.*;
import portsim.port.*;
import portsim.ship.*;
import portsim.util.*;

/**
 * A place where ships can come and dock with Quays to load / unload their cargo.
 * Cargo is stored within the port.
 */
public class Port {

    //variables
    /**
     * name of port
     */
    private String name;
    /**
     * quays in the port
     */
    private List<Quay> quays = new ArrayList<Quay>();
    /**
     * cargos stored in the port
     */
    private List<Cargo> cargos;

    //constructor

    /**
     * Creates a new port with the given name.
     * @param name name of port
     */
    public Port(String name) {
        this.name = name;
    }

    //addQuay

    /**
     * Adds a quay to the ports control.
     * @param quay the quay to add
     */
    public void addQuay(Quay quay) {
        this.quays.add(quay);
    }

    //getCargo

    /**
     * Returns the cargo stored at this port.
     * Adding or removing elements from the returned list should not affect the original list.
     * @return port cargo
     */
    public List<Cargo> getCargo() {
        return this.cargos;
    }

    //getName

    /**
     * Returns the name of this port.
     * @return port's name
     */
    public String getName() {
        return name;
    }

    //getQuay

    /**
     * Returns a list of all quays associated with this port.
     * Adding or removing elements from the returned list should not affect the original list.
     * The order in which quays appear in this list should be the same as the order in which they
     * were added by calling addQuay(Quay).
     * @return all quays
     */
    public List<Quay> getQuays() {
        return this.quays;
    }
}
