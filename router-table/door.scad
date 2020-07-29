/*
    Door
    
    By Anton Augustsson
*/

module door (
    thicknessPlywood,
    height,
    width,
    x,y,z
    ){
/*
    ---------- Local varibles ---------- 
*/

holeDiameter = 30;


/*
    ---------- Code ---------- 
*/
  
translate([
    x,
    y,
    z])
difference () {
union () {

// Front
translate([
    0,
    0,
    0])
cube([
    width,
    thicknessPlywood,
    height]);

}
translate([
    width/4*3,
    -1,
    height/4*3])
rotate([-90,0,0])
cylinder(
    h = thicknessPlywood+2,
    r = holeDiameter/2
    );

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

routerBoxHeight = 400;
routerBoxWidth = 400;        
positionShelfHeight = 
        foundationHeight
        -thicknessPlywood*2
        -routerBoxHeight;

sideHeight = 
        foundationHeight
        -thicknessPlywood*2;


door (
    thicknessPlywood,
    routerBoxHeight,
    routerBoxWidth,
    0,0,0
    );