/*
    top
*/

use <insert.scad>;
use <insert-router.scad>;

module top (
    thicknessMdf,
    totalWidth,
    totalDepth,
    x,y,z
    ){
/*
    ---------- Local varibles ---------- 
*/

//routerBoxHeight = 400;
//positionShelfHeight = ;
fenceHeight = 150;
sliderWidth = 16;
sliderHeight = thicknessMdf;
sliderDepth = 200;
        
/*
    ---------- Code ---------- 
*/
  
translate([
    x,
    y,
    z])
union () {

// Top
difference (){
translate([
    0,
    0,
    0])
cube([
    totalWidth,
    totalDepth,
    thicknessMdf]);

// Removal for insert
translate([
    totalWidth/2,
    totalDepth/2,
    -1])
insert(thicknessMdf+2);
}    

// ---------- Fence ----------
translate([
    0,
    340,
    0])
union () {

// Fence
translate([
    -sliderWidth,
    0,
    thicknessMdf])
cube([
    totalWidth+sliderWidth*2,
    thicknessMdf,
    fenceHeight]);

// Slider 1
translate([
    -sliderWidth,
    -sliderDepth/2+thicknessMdf/2,
    0])
cube([
    sliderWidth,
    sliderDepth,
    sliderHeight]);
      
// Slider 2
translate([
    totalWidth,
    -sliderDepth/2+thicknessMdf/2,
    0])
cube([
    sliderWidth,
    sliderDepth,
    sliderHeight]);
    
}
translate([
    totalWidth/2,
    totalDepth/2,
    0])
insertRouter(thicknessMdf);
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

top (
    thicknessMdf,
    totalWidth,
    totalDepth,
    0,0,0
    );