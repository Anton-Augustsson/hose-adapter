/*
    Insert
*/

module insert(thicknessMaterial){
width = 300;
depth = 300;

translate([
    -width/2,
    -depth/2,
    0])
cube([
    width,
    depth,
    thicknessMaterial]);
}


insert(19);