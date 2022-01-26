package portsim.port;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.Timeout;
import portsim.ship.ContainerShip;
import portsim.ship.NauticalFlag;
import portsim.ship.Ship;


import static org.junit.Assert.*;

public class BulkQuayTest {

    BulkQuay quay1;
    BulkQuay quay2;
    Ship containerShip;

    @Before
    public void setUp() throws Exception {
        containerShip = new ContainerShip(1234567,"ABC","DEF",
                NauticalFlag.BRAVO,50);
        quay1 = new BulkQuay(1,200);
        quay2 = new BulkQuay(2,250);
    }

    @After
    public void tearDown() throws Exception {
    }

    @Rule
    public Timeout timeout = Timeout.seconds(1);

    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //

    //
    //
    //
    //
    //

    @Test
    //
    public void toString_Test() {
        assertEquals("BulkQuay 1 [Ship: None] - 200",
                quay1.toString());
        quay2.shipArrives(containerShip);
        assertEquals("BulkQuay 2 [Ship: 1234567] - 250",
                quay2.toString());

    }

    @Test
    //To see if BulkQuay.getMaxTonnage has been implemented correctly
    public void getMaxTonnage_Test(){
        assertEquals(200, quay1.getMaxTonnage());
        assertEquals(250, quay2.getMaxTonnage());
    }

    @Test
    //To see if BulkQuay.getId has been implemented correctly
    public void getId_Test(){
        assertEquals(1, quay1.getId());
        assertEquals(2, quay2.getId());
    }

    @Test
    //To see if BulkQuay.shipArrive and BulkQuay.getShip has been implemented correctly
    public void shipArriveGetShip_Test(){
        quay1.shipArrives(containerShip);
        assertEquals(containerShip, quay1.getShip());
    }

    @Test
    //To see if BulkQuay.shipDepart and BulkQuay.isEmpty has been implemented correctly
    public void shipDepartIsEmpty_Test(){
        quay1.shipArrives(containerShip);
        quay1.shipDeparts();
        assertTrue(quay1.isEmpty());
    }
}