package portsim.ship;

import portsim.cargo.*;
import portsim.port.*;
import portsim.util.NoSuchCargoException;

import java.util.*;

/**
 * Represents a ship capable of carrying shipping containers.
 */
public class ContainerShip extends Ship {

    //variables
    /**
     * capacity of the container ship
     */
    private int capacity;
    /**
     * list of cargos on ship
     */
    private List<Container> cargos;

    //constructors

    /**
     * Creates a new container ship with the given IMO number, name and origin port,
     * nautical flag and cargo capacity.
     * @param imoNumber unique identifier
     * @param name name of the ship
     * @param originFlag port of origin
     * @param flag the nautical flag this ship is flying
     * @param capacity the container capacity of this ship
     * @throws IllegalArgumentException - if imoNumber < 0, imoNumber is not 7 digits long
     * or if the container capacity is < than 0
     */
    public ContainerShip(long imoNumber, String name, String originFlag, NauticalFlag flag,
                         int capacity) {
        super(imoNumber, name, originFlag, flag);
        this.capacity = capacity;
        this.cargos = new ArrayList<Container>();
    }

    //canDock

    /**
     * Checks if this ship can dock with the specified quay.
     * The conditions for a compatible quay are:
     * Quay must be a ContainerQuay.
     * The quays maximum number of containers must be ≥ the number of containers on board.
     * @param quay quay to be checked
     * @return true if the Quay satisfies the conditions else false
     */
    public boolean canDock(Quay quay) {
        if (quay instanceof ContainerQuay
                && ((ContainerQuay) quay).getMaxContainers() >= this.cargos.size()) {
            return true;
        }
        return false;
    }

    //canLoad

    /**
     * Checks whether the specified cargo can be loaded onto the ship.
     * The given cargo can only be loaded if all the following conditions are true:
     * The cargo given is a Container
     * The current number of containers on board is less than the container capacity
     * The cargo's destination is the same as the ships origin country
     * @param cargo cargo to be loaded
     * @return true if the Cargo satisfies the conditions else false
     */
    public boolean canLoad(Cargo cargo) {
        if (cargo instanceof Container && cargos.size() < this.capacity
                && cargo.getDestination() == this.getOriginFlag()) {
            return true;
        }
        return false;
    }

    //loadCargo

    /**
     * Loads the specified cargo onto the ship.
     * @param cargo cargo to be loaded
     */
    public void loadCargo(Cargo cargo) {
        if (canLoad(cargo)) {
            cargos.add((Container) cargo);
        }
        cargos.add((Container) cargo);
        //canLoad is a precondition, either way cargo will still be added onto ship
    }

    //unloadCargo

    /**
     * Unloads the cargo from the ship.
     * The ship's cargo should be set to an empty list.
     * @return the ship's cargo before it was unloaded
     * @throws NoSuchCargoException if the ship has already been unloaded
     * (i.e. the ship has no cargo onboard)
     */
    public List<Container> unloadCargo() throws NoSuchCargoException {
        if (this.cargos.isEmpty()) {
            throw new NoSuchCargoException();
        }
        List<Container> con = this.cargos; //variable to hold the list of cargos to return
        this.cargos.clear(); //clear cargo list on ship
        return con;
    }

    //getCargo

    /**
     * Returns the current cargo onboard this vessel.
     * Adding or removing elements from the returned list should not affect the original list.
     * @return containers on the vessel
     */
    public List<Container> getCargo() {
        return cargos;
    }

    //toString

    /**
     * Returns the human-readable string representation of this ContainerShip.
     * The format of the string to return is
     * ContainerShip name from origin [flag] carrying num containers
     * Where:
     * 'name' is the name of this ship
     * 'origin' is the country of origin of this ship
     * 'flag' is the nautical flag of this ship
     * 'num' is the number of containers on board
     * @overrides toString in class Ship
     * @return string representation of this ContainerShip
     */
    public String toString() {
        int amt = cargos.size();
        String s = "ContainerShip " + this.getName() + " from " + this.getOriginFlag() + " ["
                + this.getFlag() + "] carrying " + amt + " containers";
        return s;
    }
}
