/*
   George Jenson Bottle Opener
   Milling template  
   
   By Anton Augustsson 
*/

$fn=90;  // accuracy


// ---------- Variables ----------

openerLength   = 104;
openerDiameter = 18;
// routerBitDepth = 2;

templateLength = 150;
templateWidth  = 60;
templateHeight = 18;



// ---------- Code ----------

difference() {        
cube(size = [
    templateWidth,
    templateLength,
    templateHeight],
    center = true);

cube(size = [
    openerDiameter,
    openerLength,
    templateHeight+0.2],
    center = true);


}
