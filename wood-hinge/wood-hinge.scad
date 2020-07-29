use <threadlib/threadlib.scad>

$fn=90;  // accuracy


lengthDrillBitHousing=30;
lenghtThred=8; 
diameterDrillBitHousing=10;
diameterDrillBit=3;

positionDrillScrew = (lengthDrillBitHousing
    -lenghtThred)/2;


difference () {
union () {
// Male thread
translate([0,0,
    lengthDrillBitHousing
    -lenghtThred-1])
bolt("M8", turns=11, higbee_arc=30);

// Mount
cylinder(
    h = lengthDrillBitHousing-lenghtThred,
    r = diameterDrillBitHousing/2
    );

}

// removal
union () {
translate([0,0,
    lengthDrillBitHousing])
cylinder(
    h = lenghtThred,
    r = diameterDrillBitHousing/2
    );

translate([0,0,-1])
cylinder(
    h = lengthDrillBitHousing+2,
    r = diameterDrillBit/2
    );

// screw drill fasten
translate([-diameterDrillBitHousing/2,0,
    positionDrillScrew])
rotate ([0,90,0])
bolt("M3", turns=diameterDrillBitHousing*2,
    higbee_arc=30);


// screw drill fasten countersink back
translate([diameterDrillBitHousing/2-1,0,
    positionDrillScrew])
rotate ([0,90,0])
cylinder(
    h = 2,
    r1 = 1.5,
    r2 = 4
    );

// screw drill fasten countersink front
translate([-diameterDrillBitHousing/2-1,0,
    positionDrillScrew])
rotate ([0,90,0])
cylinder(
    h = 2,
    r2 = 1.5,
    r1 = 4
    );
    
}
}