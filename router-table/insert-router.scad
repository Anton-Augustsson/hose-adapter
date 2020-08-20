/*
    Insert Router
*/

use <insert.scad>

module insertRouter(thicknessMaterial){
$fn=90;  // accuracy

/*
    P = position from middle
    W = From width
    D = From Depth
*/

width = 300;
depth = 300;

holeDiameter = 3.2;
routerDiamter = 80;
adjustmentDiamter = 6;

hole1PW = 25;
hole1PD = 50;
hole2PW = 32.5;
hole2PD = -50;
hole3PW = -60;
hole3PD = -25;

adjustmentPW = 67.5;
adjustmentPD = -30;

color("grey")
difference () {


translate([0,0,0])    
insert(thicknessMaterial);
    

union () {
    
// Hole Router
cylinder(
    h = thicknessMaterial+2,
    d = routerDiamter
    );

// Hole 1
translate([hole1PW,
    hole1PD,
    -1])
cylinder(
    h = thicknessMaterial+2,
    d = holeDiameter
    );
    
// Hole 2
translate([hole2PW,
    hole2PD,
    -1])
cylinder(
    h = thicknessMaterial+2,
    d = holeDiameter
    );

// Hole 3
translate([hole3PW,
    hole3PD,
    -1])
cylinder(
    h = thicknessMaterial+2,
    d = holeDiameter
    );

// Adjustment
translate([adjustmentPW,
    adjustmentPD,
    -1])
cylinder(
    h = thicknessMaterial+2,
    d = adjustmentDiamter
    );
}}}

thicknessMaterial = 19;
insertRouter(thicknessMaterial);
