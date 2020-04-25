/*
   George Jenson Teapot
   Milling template  
   
   By Anton Augustsson 
*/

$fn=90;  // accuracy


// ---------- Variables ----------


teapotDiameter = 100;
teapotRadius = teapotDiameter/2; 
// routerBitDepth = 3;

templateLength = 170;
templateWidth  = 170;
templateHeight = 18;



// ---------- Code ----------

difference() {        
cube(size = [
    templateWidth,
    templateLength,
    templateHeight],
    center = true);

cylinder(
    h = templateHeight+0.2, 
    r = teapotRadius,
    center = true);


}
