package portsim.port;

import portsim.ship.*;

/**
 * Quay is a platform lying alongside or projecting into the water where ships are
 * moored for loading or unloading.
 */
public abstract class Quay {

    //variables
    /**
     * ID of the quay
     *
     */
    private int id;
    /**
     * ship docked at quay
     */
    private Ship ship;

    //constructor

    /**
     * Creates a new Quay with the given ID, with no ship docked at the quay.
     * @param id quay ID
     * @throws IllegalArgumentException - if ID < 0
     */
    public Quay(int id) {
        if (id < 0) {
            throw new IllegalArgumentException();
        }
        this.id = id;
    }

    //getId

    /**
     * Get the id of this quay
     * @return quay ID
     */
    public int getId() {
        return id;
    }

    //getShip

    /**
     * Returns the ship currently docked at the quay.
     * @return ship at quay or null if no ship is docked
     */
    public Ship getShip() {
        return ship;
    }

    //isEmpty

    /**
     * Returns whether a ship is currently docked at this quay.
     * @return true if there is no ship docked else false
     */
    public boolean isEmpty() {
        if (this.ship == null) {
            return true;
        }
        return false;
    }

    //shipArrives

    /**
     * Docks the given ship at the Quay so that the quay becomes occupied.
     * @param ship ship to dock to the quay
     */
    public void shipArrives(Ship ship) {
        this.ship = ship;
    }

    //shipDeparts

    /**
     * Removes the current ship docked at the quay. The current ship should be set to null.
     * @return the current ship or null if quay is empty.
     */
    public Ship shipDeparts() {
        this.ship = null;
        return this.ship;
    }

    //toString

    /**
     * Returns the human-readable string representation of this quay.
     * The format of the string to return is
     * QuayClass id [Ship: imoNumber]
     * Where:
     * 'id' is the ID of this quay
     * 'imoNumber' is the IMO number of the ship docked at this quay, or None if the quay is
     * unoccupied.
     * @overrides toString in class Object
     * @return string representation of this quay
     */
    public String toString() {
        String s;
        if (this.isEmpty()) {
            s = "Quay " + this.id + " [Ship: None]";
        } else {
            s = "Quay " + this.id + " [Ship: " + ship.getImoNumber() + "]";
        }
        return s;
    }
}
