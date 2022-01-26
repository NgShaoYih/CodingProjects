package portsim.movement;

import portsim.ship.*;
import java.util.*;

/**
 * The movement of a ship coming into or out of the port.
 */
public class ShipMovement extends Movement {

    //variables
    /**
     * ship being moved at the moment
     */
    private Ship ship;

    //Constructor

    /**
     * Creates a new ship movement with the given action time and direction
     * to be undertaken with the given ship.
     * @param time the time the movement should occur
     * @param direction the direction of the movement
     * @param ship the ship which that is waiting to move
     * @throws IllegalArgumentException - if time < 0
     */
    public ShipMovement(long time, MovementDirection direction, Ship ship) {
        super(time, direction);
        this.ship = ship;
    }

    //getShip

    /**
     * Returns the ship undertaking the movement.
     * @return movements ship
     */
    public Ship getShip() {
        return ship;
    }

    //toString

    /**
     * Returns the human-readable string representation of this ShipMovement.
     * The format of the string to return is
     * DIRECTION ShipMovement to occur at time involving the ship name
     * Where:
     * 'DIRECTION' is the direction of the movement
     * 'time' is the time the movement is meant to occur
     * 'name' is the name of the ship that is being moved
     * @overrides toString in class Movement
     * @return string representation of this ShipMovement
     */
    public String toString() {
        String s = this.getDirection() + " ShipMovement to occur at " + this.getTime() + " "
                + "involving the ship " + this.ship;
        return s;
    }
}
