package portsim.movement;

/**
 * The movement of ships or cargo coming into or out of the port from land or sea.
 */
public abstract class Movement {

    //variables
    /**
     * time when movement should occur
     *
     */
    private long time;
    /**
     * direction of the movement
     */
    private MovementDirection direction;

    //constructor

    /**
     * Creates a new movement with the given action time and direction.
     * @param time the time the movement should occur
     * @param direction the direction of the movement
     * @throws IllegalArgumentException - if time < 0
     */
    public Movement(long time, MovementDirection direction) {
        if (time < 0) {
            throw new IllegalArgumentException();
        }
        this.time = time;
        this.direction = direction;
    }

    //getDirection

    /**
     * Returns the direction of the movement.
     * @return movement direction
     */
    public MovementDirection getDirection() {
        return this.direction;
    }

    //getTime

    /**
     * Returns the time the movement should be actioned.
     * @return movement time
     */
    public long getTime() {
        return this.time;
    }

    //toString

    /**
     * Returns the human-readable string representation of this Movement.
     * The format of the string to return is
     * DIRECTION MovementClass to occur at time
     * Where:
     *'DIRECTION' is the direction of the movement
     *'MovementClass' is the Movement class name
     *'time' is the time the movement is meant to occur
     * @return string representation of this Movement
     */
    public String toString() {
        String s = this.direction + " Movement to occur at " + this.time;
        return s;
    }
}
