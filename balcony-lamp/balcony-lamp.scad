/*
    Drill bit storage
*/

$fn=90;  // accuracy
outerR = 52/2;  // 5.2
innerR = 41/2-1;
lenght = 30; //2.5

pegWidth = 1.5;
pegDepth1 = outerR+1;
pegDepth2 = innerR+1;

module peg (pegDepth,l){
    for(i = [0:45:360])
    rotate([0,0,i])
    translate([
    -pegWidth/2,0,0]) 
    cube([pegWidth,
    pegDepth,
    l]);
}


difference () {

union () {
peg (pegDepth1,lenght);
cylinder(
    h = lenght,
    r = outerR
    );
}    

translate([0,0,-1])
union () {
peg (pegDepth2,lenght+2);
cylinder(
    h = lenght+2,
    r = innerR
    );
}

}





