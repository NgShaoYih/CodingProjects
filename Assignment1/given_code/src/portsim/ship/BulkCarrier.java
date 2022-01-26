package portsim.ship;

import portsim.cargo.*;
import portsim.port.*;
import portsim.util.NoSuchCargoException;

import java.util.*;

/**
 * Represents a ship capable of carrying bulk cargo.
 */
public class BulkCarrier extends Ship {

    //variable
    /**
     * capacity of ship
     */
    private int capacity;
    /**
     * cargo currently stored on ship
     */
    private BulkCargo cargo;

    //constructor

    /**
     * Creates a new bulk carrier with the given IMO number, name, origin port,
     * nautical flag and cargo capacity.
     * @param imoNumber unique identifier
     * @param name name of the ship
     * @param originFlag port of origin
     * @param flag the nautical flag this ship is flying
     * @param capacity the tonnage capacity of this ship
     * @throws IllegalArgumentException - if imoNumber < 0, imoNumber is not 7 digits long or if
     * the tonnage capacity is < than 0
     */
    public BulkCarrier(long imoNumber, String name, String originFlag,
                       NauticalFlag flag, int capacity) {
        super(imoNumber, name, originFlag, flag);
        if (imoNumber < 0 || imoNumber > 9999999 || capacity < 0) {
            throw new IllegalArgumentException();
        }
        this.capacity = capacity;
        this.cargo = null;
    }

    //getCargo

    /**
     * Returns the current cargo onboard this vessel.
     * @return bulk cargo on the vessel
     */
    public BulkCargo getCargo() {
        return cargo;
    }

    //canDock

    /**
     * Check if this ship can dock with the specified quay.
     * The conditions for a compatible quay are:
     * Quay must be a BulkQuay.
     * The quay's maximum cargo weight must be ≥ this ship's cargo weight in tonnes.
     * @param quay quay to be checked
     * @return true if the Quay satisfies the conditions else false
     */
    public boolean canDock(Quay quay) {
        if (quay instanceof BulkQuay && quay.getShip() == null) {
            return true;
        }
        return false;
    }

    //canLoad

    /**
     * Checks whether the specified cargo can be loaded onto the ship.
     * The given cargo can only be loaded if all the following conditions are true:
     * The ship does not have any cargo on board
     * The cargo given is a BulkCargo
     * The cargo tonnage is less than or equal to the ship's tonnage capacity
     * The cargo's destination is the same as the ships origin country
     * @param cargo cargo to be loaded
     * @return true if the Cargo satisfies the conditions else false
     */
    public boolean canLoad(Cargo cargo) {
        if (this.cargo == null && cargo instanceof BulkCargo
                && ((BulkCargo) cargo).getTonnage() <= this.capacity
                && cargo.getDestination() == this.getOriginFlag()) {
            return true;
        }
        return false;
    }

    //loadCargo

    /**
     * Loads the specified cargo onto the ship.
     * @param cargo cargo to be loaded
     * @requires Cargo given is able to be loaded onto this ship according to canLoad(Cargo)
     */
    public void loadCargo(Cargo cargo) {
        if (canLoad(cargo)) {
            this.cargo = (BulkCargo) cargo;
        }
        this.cargo = (BulkCargo) cargo;
        //canLoad is a precondition, either way cargo will still be loaded onto ship
    }

    //unloadCargo

    /**
     * Unloads the cargo from the ship.
     * The ship's cargo should be set to null at the end of the operation.
     * @return the ships cargo
     * @throws NoSuchCargoException if the ship has already been unloaded
     */
    public BulkCargo unloadCargo() throws NoSuchCargoException {
        if (this.cargo == null) {
            throw new NoSuchCargoException();
        } else {
            BulkCargo bc = this.cargo; //store cargo variable somewhere else to return later
            this.cargo = null; //it is now stored somewhere else, so it is safe to clear
            return bc;
        }
    }

    //toString

    /**
     * Returns the human-readable string representation of this BulkCarrier.
     * The format of the string to return is
     * BulkCarrier name from origin [flag] carrying cargoType
     * Where:
     * 'name' is the name of this ship
     * 'origin' is the country of origin of this ship
     * 'flag' is the nautical flag of this ship
     * 'cargoType' is the type of cargo on board or the literal String nothing if there is no
     * cargo currently on board
     * @override toString in class Ship
     * @return string representation of this BulkCarrier
     */
    public String toString() {
        String s;
        if (this.cargo == null) {   //for ships without cargo
            s = "BulkCarrier " + this.getName() + " from " + this.getOriginFlag()
                    + " [" + this.getFlag() + "] carrying null";
        } else {    //for ships with cargo
            s = "BulkCarrier " + this.getName() + " from " + this.getOriginFlag()
                    + " [" + this.getFlag() + "] carrying " + (this.cargo).getType();
        }
        return s;
    }
}

