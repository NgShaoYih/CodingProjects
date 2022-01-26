package portsim.movement;

import portsim.cargo.*;
import java.util.*;

/**
 * The movement of cargo coming into or out of the port.
 */
public class CargoMovement extends Movement {

    //vaiables
    /**
     * List of cargo
     */
    private List<Cargo> cargo;

    //constructor

    /**
     * Creates a new cargo movement with the given action time and direction
     * to be undertaken with the given cargo.
     * @param time the time the movement should occur
     * @param direction the direction of movement
     * @param cargo the cargo to be moved
     */
    public CargoMovement(long time, MovementDirection direction, List<Cargo> cargo) {
        super(time, direction);
        this.cargo = cargo;
    }

    //getCargo

    /**
     * Returns the cargo that will be moved.
     * Adding or removing elements from the returned list should not affect the original list.
     * @return all cargo in the movement
     */
    public List<Cargo> getCargo() {
        return cargo;
    }

    //toString

    /**
     * Returns the human-readable string representation of this CargoMovement.
     * The format of the string to return is
     * DIRECTION CargoMovement to occur at time involving num piece(s) of cargo
     * Where:
     * 'DIRECTION' is the direction of the movement
     * 'time' is the time the movement is meant to occur
     * 'num' is the number of cargo pieces that are being moved
     * @override toString in class Movement
     * @return string representation of this CargoMovement
     */
    public String toString() {
        int num = cargo.size();
        String s = this.getDirection() + " CargoMovement to occur at " + this.getTime()
                + " involving " + num + " piece(s) of cargo";
        return s;
    }
}
