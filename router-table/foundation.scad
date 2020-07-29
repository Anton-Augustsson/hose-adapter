/*
    Foundation
    
    By Anton Augustsson
*/

use <router-drawer.scad>;
use <door.scad>;

module foundation (
    thicknessPlywood,
    foundationHeight,
    foundationWidth,
    foundationDepth,
    x,y,z
    ){
/*
    ---------- Local varibles ---------- 
*/

routerBoxHeight = 400;
routerBoxWidth = 400;        
positionShelfHeight = 
        foundationHeight
        -thicknessPlywood*2
        -routerBoxHeight;

sideHeight = 
        foundationHeight
        -thicknessPlywood*2;

boxWidth = (foundationWidth
        -routerBoxWidth
        -thicknessPlywood*2)/2;
boxDepth = foundationDepth-
        thicknessPlywood;
        
/*
    ---------- Code ---------- 
*/
  
translate([
    x,
    y,
    z])
union () {

// Side Left
translate([
    0,
    0,
    thicknessPlywood])
cube([
    thicknessPlywood,
    foundationDepth,
    sideHeight]);

// Side Right
translate([
    foundationWidth
    -thicknessPlywood,
    0,
    thicknessPlywood])
cube([
    thicknessPlywood,
    foundationDepth,
    sideHeight]);

// bottom
translate([
    0,
    0,
    0])
cube([
    foundationWidth,
    foundationDepth,
    thicknessPlywood]);

// top
translate([
    0,
    0,
    foundationHeight-thicknessPlywood])
cube([
    foundationWidth,
    foundationDepth,
    thicknessPlywood]);

// Back
translate([
    0,
    foundationDepth-thicknessPlywood,
    thicknessPlywood])
cube([
    foundationWidth,
    thicknessPlywood,
    sideHeight]);

union () {
// Shelf
translate([
    thicknessPlywood,
    0,
    positionShelfHeight])
cube([
    foundationWidth-thicknessPlywood*2,
    foundationDepth-thicknessPlywood,
    thicknessPlywood]);

// Box side left
translate([
    foundationWidth/2-routerBoxWidth/2,
    0,
    positionShelfHeight
    +thicknessPlywood])
cube([
    thicknessPlywood,
    foundationDepth-thicknessPlywood,
    routerBoxHeight]);

// Box side right
translate([
    foundationWidth/2+routerBoxWidth/2
    -thicknessPlywood,
    0,
    positionShelfHeight
    +thicknessPlywood])
cube([
    thicknessPlywood,
    foundationDepth-thicknessPlywood,
    routerBoxHeight]);

// Drawer box left
routerDrawer (
    thicknessPlywood,
    routerBoxHeight,
    boxWidth,
    boxDepth,
    thicknessPlywood,0,
    positionShelfHeight
    +thicknessPlywood
    );

// Drawer box right
routerDrawer (
    thicknessPlywood,
    routerBoxHeight,
    boxWidth,
    boxDepth,
    foundationWidth
    -boxWidth-thicknessPlywood,0,
    positionShelfHeight
    +thicknessPlywood
    );
    
// Router door
door (
    thicknessPlywood,
    routerBoxHeight,
    routerBoxWidth-thicknessPlywood*2,
    boxWidth+thicknessPlywood*2,0,
    positionShelfHeight
    +thicknessPlywood
    );
}
}
}


/*
    ---------- Example ---------- 
*/

sideOverhangWidth = 100;
sideOverhangDepth = 50;

thicknessMdf = 19;
thicknessPlywood = 12; 

totalHeight = 900;
totalWidth = 900; // t-profile
totalDepth = 500;

foundationHeight = 
    totalHeight
    -thicknessMdf;
foundationWidth = 
    totalWidth
    -sideOverhangWidth*2;
foundationDepth =
    totalDepth
    -sideOverhangDepth*2;


foundation (
    thicknessPlywood,
    foundationHeight,
    foundationWidth,
    foundationDepth,
    0,0,0
    );
