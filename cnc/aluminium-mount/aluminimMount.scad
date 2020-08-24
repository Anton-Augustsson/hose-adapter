use <threadlib/threadlib.scad>

$fn=90;  // accuracy


tolerance = 0.1;
length = 40;
width = 20-tolerance;
height = 10-tolerance;

innerHeight = 7.5-tolerance;
innerwidth = 14+tolerance;

flatspotTop = 10;
flatspotSide = 2;


lowerSectionAngleHeight = 2;
lowerSectionAngleWidth = 3;
lowerSectionAngleLength =
    sqrt(pow(lowerSectionAngleHeight,2)
    +pow(lowerSectionAngleWidth,2));
lowerSectionAngle = atan(
    lowerSectionAngleHeight
    /lowerSectionAngleWidth);

upperSectionAngleHeight = innerHeight-flatspotSide;
upperSectionAngleWidth = (width-flatspotTop)/2;
upperSectionAngle = atan(
    upperSectionAngleHeight
    /upperSectionAngleWidth);
upperSectionAngleLength = 
    sqrt(pow(upperSectionAngleHeight,2)
    +pow(upperSectionAngleWidth,2));


rotate([180,0,0])
difference () {
union () {

translate([-length/2,-width/2,0])
cube([
    length,
    width,
    height]);
}

union () {
// Male thread
bolt("M8", turns=8, higbee_arc=30);

// lower middle section
translate([-length/2-1,-innerwidth/2,0])
cube([
    length+2,
    innerwidth,
    height-innerHeight]);

// lower left
translate([
    -length/2-1,
    width/2
    -(cos(lowerSectionAngle)
    *lowerSectionAngleLength
    -sin(lowerSectionAngle)
    *lowerSectionAngleLength),
    -cos(lowerSectionAngle)
    *lowerSectionAngleLength])
rotate([lowerSectionAngle,0,0])
cube([
    length+2,
    lowerSectionAngleLength,
    lowerSectionAngleLength]);

// lower right 
translate([
    -length/2-1,
    -width/2
    -sin(lowerSectionAngle)*lowerSectionAngleLength,
    sin(lowerSectionAngle)
    *lowerSectionAngleLength
    -cos(lowerSectionAngle)*lowerSectionAngleLength])
rotate([-lowerSectionAngle,0,0])
cube([
    length+2,
    lowerSectionAngleLength,
    lowerSectionAngleLength]);

// upper left
translate([-length/2-1,-width/2,
    height-(sin(upperSectionAngle)
    *upperSectionAngleLength)])
rotate([upperSectionAngle,0,0])
cube([
    length+2,
    upperSectionAngleLength,
    upperSectionAngleLength]);

// upper right
translate([-length/2-1,
    width/2-(cos(upperSectionAngle)
    *upperSectionAngleLength),
    height])
rotate([-upperSectionAngle,0,0])
cube([
    length+2,
    upperSectionAngleLength,
    upperSectionAngleLength]);
}}