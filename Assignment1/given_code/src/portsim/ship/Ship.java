package portsim.ship;

import portsim.cargo.*;
import portsim.port.*;
import java.util.*;

/**
 * Represents a ship whose movement is managed by the system.
 * Ships store various types of cargo which can be loaded and unloaded at a port.
 */
public abstract class Ship {

    //variables
    /**
     * IMO number of the ship
     */
    private long imoNumber;
    /**
     * the name of the ship
     */
    private String name;
    /**
     * the origin country of the ship
     */
    private String originFlag;
    /**
     * the nautical flag of the ship
     */
    private NauticalFlag flag;
    /**
     * the cargo the ship is currently carrying
     */
    private Cargo cargo;

    //constructor

    /**
     * Creates a new ship with the given IMO number, name, origin port flag and nautical flag.
     * @param imoNumber unique identifier
     * @param name name of the ship
     * @param originFlag port of origin
     * @param flag the nautical flag this ship is flying
     * @throws IllegalArgumentException if imoNumber < 0 or imoNumber is not 7 digits long
     * (no leading zero's [0])
     */
    public Ship(long imoNumber, String name, String originFlag, NauticalFlag flag) {
        if (imoNumber < 0 || imoNumber > 9999999) {
            throw new IllegalArgumentException();
        }
        this.imoNumber = imoNumber;
        this.name = name;
        this.originFlag = originFlag;
        this.flag = flag;
    }

    //getImoNumber

    /**
     * Returns this ship's IMO number.
     * @return imoNumber
     */
    public long getImoNumber() {
        return imoNumber;
    }

    //getName

    /**
     * Returns this ship's name.
     * @return name
     */
    public String getName() {
        return name;
    }

    //getFlag

    /**
     * Returns the nautical flag the ship is flying.
     * @return flag
     */
    public NauticalFlag getFlag() {
        return flag;
    }

    //getOriginFlag
    /**
     * Returns this ship's flag denoting its origin.
     * @return originFlag
     */
    public String getOriginFlag() {
        return originFlag;
    }

    //canDock

    /**
     * Check if this ship can dock with the specified quay according to the conditions
     * determined by the ships type.
     * @param quay quay to be checked
     * @return true if the Quay satisfies the conditions else false
     */
    public abstract boolean canDock(Quay quay);

    //canLoad

    /**
     * Checks if the specified cargo can be loaded onto the ship according to the
     * conditions determined by the ships type.
     * @param cargo cargo to be loaded
     * @return true if the Cargo satisfies the conditions else false
     */
    public abstract boolean canLoad(Cargo cargo);

    //loadCargo

    /**
     * Loads the specified cargo onto the ship.
     * @param cargo cargo to be loaded
     * @required Cargo given is able to be loaded onto this ship according
     * to the implementation of canLoad(Cargo)
     */
    public abstract void loadCargo(Cargo cargo);

    //toString

    /**
     * Returns the human-readable string representation of this Ship.
     * The format of the string to return is
     * ShipClass name from origin [flag]
     * Where:
     * 'ShipClass' is the Ship class
     * 'name' is the name of this ship
     * 'origin' is the country of origin of this ship
     * 'flag' is the nautical flag of this ship
     * @Overrides toString in class Object
     * @return string representation of this Ship
     */
    public String toString() {
        String s = "Ship " + this.name + " from " + this.originFlag + " [" + this.flag + "]";
        return s;
    }
}
