/*
 
    Standerd hose adapter for BOSH GKS 55+ G
    Anton Augustsson
    
*/

$fn=90;

mountLenght   = 8;
mountRadius   = 38/2;
mountLenghtIn = 20;
mountRadiusIn = 35/2;

hoseLenght   = 55;
hoseRadius   = 33/2;

pegWidth  = 1.5;
pegLenght = 1.5; // not inportent


// difference
difference(){
// union - cylinder1 cylinder2
union(){
cylinder(
    h = mountLenghtIn+hoseLenght, 
    r = mountRadiusIn);


cylinder(
    h = hoseLenght+mountLenght, 
    r = mountRadius);
}

// union - hosecylinder begar
union(){
cylinder(
    h = mountLenghtIn+hoseLenght+mountLenght, 
    r = hoseRadius);
    
for(i = [0:30:360])
    rotate([0,0,i])
    translate([mountRadiusIn,0,hoseLenght])
    cube([pegWidth,pegLenght,mountLenght]);
}
}