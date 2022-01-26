package portsim.ship;

// add any required imports here
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.Timeout;
import portsim.cargo.BulkCargo;
import portsim.cargo.BulkCargoType;
import portsim.port.BulkQuay;
import portsim.port.ContainerQuay;
import portsim.util.NoSuchCargoException;

import java.awt.*;

import static org.junit.Assert.*;

public class BulkCarrierTest {

    // add unit tests here
    //variables to test with
    private BulkCarrier bulkCarrier1;
    private BulkCarrier bulkCarrier2;
    private BulkQuay bulkQuay;
    private ContainerQuay invalidQuay;
    private BulkCargo bulkCargo1;
    private BulkCargo bulkCargo2;
    private BulkCargo bulkCargo3;

    //Setup
    @Before
    public void setUp() throws Exception {
        bulkCarrier1 = new BulkCarrier(1010101,"Fish","Australia", NauticalFlag.BRAVO,300);
        bulkCarrier2 = new BulkCarrier(23,"Crab", "Japan" , NauticalFlag.WHISKEY, 200);
        bulkCargo1 = new BulkCargo(1,"Australia", 150, BulkCargoType.GRAIN);
        bulkCargo2 = new BulkCargo(2,"Japan", 200, BulkCargoType.OIL);
        bulkCargo3 = new BulkCargo(3, "America", 90, BulkCargoType.COAL);
        bulkQuay = new BulkQuay(1,400);
        invalidQuay = new ContainerQuay(1,30);
    }

    @Test
    //
    public void canLoadLoadCargo_Test() {

        assertTrue(bulkCarrier1.canLoad(bulkCargo1));
        assertFalse(bulkCarrier1.canLoad(bulkCargo3));
        assertTrue(bulkCarrier2.canLoad(bulkCargo2));
        bulkCarrier1.loadCargo(bulkCargo1);
        bulkCarrier2.loadCargo(bulkCargo2);
        assertEquals(bulkCargo1, bulkCarrier1.getCargo());
        assertEquals(bulkCargo2, bulkCarrier2.getCargo());
    }

    @Test
    //
    public void canDock_Test() {
        assertTrue(bulkCarrier1.canDock(bulkQuay));
        assertFalse(bulkCarrier2.canDock(invalidQuay));
    }

    @Test
    //
    public void unloadCargo_Test() throws NoSuchCargoException {
        bulkCarrier1.loadCargo(bulkCargo1);
        bulkCarrier2.loadCargo(bulkCargo3);

        assertEquals(bulkCarrier1.unloadCargo(), bulkCargo1);
        assertEquals(bulkCarrier2.unloadCargo(), bulkCargo3);
    }

    @Test
    //
    public void toString_Test() {
        assertEquals("BulkCarrier Fish from Australia [BRAVO] carrying null",
                bulkCarrier1.toString());
        bulkCarrier2.loadCargo(bulkCargo2);
        assertEquals("BulkCarrier Crab from Japan [WHISKEY] carrying OIL",
                bulkCarrier2.toString());
    }

}