$fn=90;  // accuracy

width = 90;
depth = 80;

slideWidth   = 12;
slideHeight  = 6.5;
slideOpening = 9;

slidesDistence        = 36;
slidesDistenceOpening = 40;

stopThickness = 3;
stopHeight    = 8+slideHeight;


module fhex(wid,height){
hull(){
cube([wid/1.7,wid,height],center = true);

rotate([0,0,120])
cube([wid/1.7,wid,height],center = true);

rotate([0,0,240])
cube([wid/1.7,wid,height],center = true);
}}


module hole(y){
translate([slideWidth/2,y,-1]){
cylinder(
    h = slideHeight+2,
    d = 4.5);
    
translate([0,0,6-4])
fhex(6,4);    
}}


    
module slide(){
difference() {
union(){
cube([
    slideWidth,
    depth-stopThickness,
    slideHeight]);
}
union(){
hole(20);
hole(60);
}}}

module slideUp(){
slide();
}

module slideDown(){
translate([0,depth-stopThickness,slideHeight])
rotate([180,0,0])
slide();
}


module stop(){
translate([0,0,
    slideHeight-stopHeight])    
cube([
    width,
    stopThickness,
    stopHeight]);
}



union () {
 
stop();
    
slideUp();

translate([slideWidth+slidesDistence,0,0])
slideDown();
    
}