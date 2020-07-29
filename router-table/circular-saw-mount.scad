/*
    Drill bit storage
*/

$fn=90;  // accuracy
outerR = 52/2;  // 5.2
innerR = 41/2-1+0.5;
lenght = 30; //2.5

pegWidth1 = 1.5;
pegWidth2 = 6;
pegDepth1 = outerR+1;
pegDepth2 = innerR+1.5;

module peg (pegDepth,
    pegWidth,l){
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
peg (pegDepth1,
    pegWidth1,lenght);
cylinder(
    h = lenght,
    r = outerR
    );
}    

translate([0,0,-1])
union () {
peg (pegDepth2,
    pegWidth2,lenght+2);
cylinder(
    h = lenght+2,
    r = innerR
    );
}

}





