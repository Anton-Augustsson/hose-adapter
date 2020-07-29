use <threadlib/threadlib.scad>

$fn=90;  // accuracy


lengthDrillBitHousing=30;
lenghtThred=8; 
diameterDrillBitHousing=10;
diameterDrillBit=3;

dowelDiamter = 12;
dowelLenght = 20; // not the dowel itself
dowelWall = 2;

difference () {
union () {
nut("M8", turns=16, Douter=
    dowelDiamter+dowelWall*2);

}

union () {
translate([0,0,
    lenghtThred])
cylinder(
    h = dowelLenght,
    r = dowelDiamter/2
    );

translate([0,0,
    -lenghtThred])
cylinder(
    h = lenghtThred,
    r = (diameterDrillBitHousing
    +dowelWall*2)/2+2
    );
    
translate([0,0,
    dowelLenght])
cylinder(
    h = lenghtThred,
    r = (diameterDrillBitHousing
    +dowelWall*2)/2+2
    );
}
}