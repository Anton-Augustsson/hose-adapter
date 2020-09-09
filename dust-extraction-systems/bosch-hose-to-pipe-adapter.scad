/*
 
    Standerd hose adapter for 100mm pipe
    Anton Augustsson
    
*/

$fn=90;

mountLenght  = 35;
mountRadius  = 100/2;
hoseLenght   = 30+mountLenght;
hoseRadius   = 58/2;

wallThickness = 3;
wallesRadius = hoseRadius+wallThickness;



difference() {
union(){
cylinder(
    h = mountLenght, 
    r = mountRadius);

cylinder(
    h = hoseLenght, 
    r = wallesRadius);

}
union() {
cylinder(
    h = hoseLenght+1, 
    r = hoseRadius);

cylinder(
    h = mountLenght-wallThickness, 
    r1 = mountRadius-wallThickness,
    r2 = hoseRadius);

}}