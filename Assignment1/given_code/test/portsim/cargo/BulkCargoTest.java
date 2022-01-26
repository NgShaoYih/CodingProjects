package portsim.cargo;

// add any required imports here
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.Timeout;

import java.awt.*;

import static org.junit.Assert.*;

public class BulkCargoTest {

    // add unit tests here
    //variables to test with
    private BulkCargo bulkCargo1;
    private BulkCargo bulkCargo2;
    private BulkCargo bulkCargo3;

    @Before
    public void setUp() throws Exception {
        bulkCargo1 = new BulkCargo(1, "Australia", 100, BulkCargoType.GRAIN);
        bulkCargo2 = new BulkCargo(2,"America", 150, BulkCargoType.OIL);
        bulkCargo3 = new BulkCargo(3, "Japan", 200, BulkCargoType.OTHER);
    }

    @Test
    //To see if BulkCargo.getTonnage is implemented correctly
    public void getTonnage_Test(){
        assertEquals(100, bulkCargo1.getTonnage());
        assertEquals(150, bulkCargo2.getTonnage());
        assertEquals(200, bulkCargo3.getTonnage());
    }

    @Test
    //To see if BulkCargo.getType is implemented correctly
    public void getType_Test(){
        assertEquals(BulkCargoType.GRAIN, bulkCargo1.getType());
        assertEquals(BulkCargoType.OIL, bulkCargo2.getType());
        assertEquals(BulkCargoType.OTHER, bulkCargo3.getType());
    }

    @Test
    //To see if BulkCargo.getDestination is implemented correctly
    public void getDestination_Test(){
        assertEquals("Australia", bulkCargo1.getDestination());
        assertEquals("America", bulkCargo2.getDestination());
        assertEquals("Japan", bulkCargo3.getDestination());
    }

    @Test
    //To see if BulkCargo.toString is implemented correctly
    public void toString_Test() {
        assertEquals("BulkCargo 1 to Australia [GRAIN - 100]", bulkCargo1.toString());
        assertEquals("BulkCargo 2 to America [OIL - 150]", bulkCargo2.toString());
        assertEquals("BulkCargo 3 to Japan [OTHER - 200]", bulkCargo3.toString());
    }

}