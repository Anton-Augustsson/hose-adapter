$fn=90;

widthBetweenHole = 75;
depthBetweenHole = 10;
heightAllowance = 45;
holeDiameter = 4.4;
angleWidth = 65;
angleDiamteter = pow(angleWidth,2)
    /heightAllowance
    +heightAllowance;

thickness = 3;
width = angleWidth+holeDiameter*2+thickness*4;
depth = depthBetweenHole+holeDiameter+thickness*2;
height = heightAllowance+thickness;

startHoleX = thickness+holeDiameter/2;
startHoleY = depth-(thickness+holeDiameter/2);


rotate([-90,0,0])
difference () {
//main pice
cube([
    width,
    depth,
    height]);


union() {
    
// removal front
union () {
translate([
    -1,
    -1,
    -1])
cube([
    angleWidth+holeDiameter+thickness*2+1,
    depthBetweenHole+holeDiameter/2,
    height+2]);

translate([
    1,
    -1,
    thickness])
cube([
    width,
    depth-thickness+1,
    height]);
}

// removal for angel
difference () {
translate([
    thickness*2+holeDiameter,
    depth+1,
    heightAllowance-angleDiamteter/2])
rotate([90,0,0])
cylinder(
    h = depth/2+1,
    d = angleDiamteter);

cube([
    holeDiameter+thickness*2,
    depth+1,
    height]);

}
// removal mounting left
translate([
    -1,
    depth-(holeDiameter+thickness*2),
    thickness])
cube([
    holeDiameter+thickness+1,
    holeDiameter+thickness+1,
    height]);


// removal mounting right
translate([
    width-(holeDiameter+thickness),
    -1,
    thickness])
cube([
    holeDiameter+thickness+1,
    depth-thickness+1,
    height]);


// hole left
translate([
    startHoleX,
    startHoleY,
    -1])
cylinder(
    h = thickness+2,
    d = holeDiameter);

// hole right
translate([
    startHoleX+widthBetweenHole,
    startHoleY-depthBetweenHole,
    -1])
cylinder(
    h = thickness+2,
    d = holeDiameter);    


}}