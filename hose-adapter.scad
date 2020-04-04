/*
 
    Standerd hose adapter for BOSH GCM 8 SJL Miter Saw
    Anton Augustsson
    
*/

$fn=90;

mountLenght  = 25;
mountRadius  = 45/2;
hoseLenght   = 55;
hoseRadius   = 33/2;

hookRadius   = 8/2;
hookDistance = 10;

wallesRadius = hoseRadius+3;



difference() {
union(){
cylinder(
    h = mountLenght, 
    r = mountRadius);

cylinder(
    h = hoseLenght, 
    r = wallesRadius);

rotate([90,0,0])
translate([
    0,
    hookDistance,
    -mountRadius-0.5]) 
cylinder(
    h = mountRadius*2+1, 
    r = hookRadius);

}

cylinder(
    h = hoseLenght+1, 
    r = hoseRadius);

}