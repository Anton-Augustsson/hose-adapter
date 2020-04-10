/*
    Drill bit storage
*/

$fn=90;  // accuracy


// Constants (Don't change)
storageLenght = 100; // Not Bit lenght
maxBitLenght  = 88;  // Check bit lenght
storageWidth  = 10;  // Minimum width

// Bit dependent
bitDiameter = 4.0;

// Automatic  (Don't change)
diameterText      = str(bitDiameter);
storageHight      = bitDiameter*0.6; 
bitRadius         = bitDiameter/2;
bitPositionHeight = storageHight+bitDiameter*0.2; 



// Delition for crating drill track
difference() {

// Union for text and storage
union(){

// Storage 
translate([
    -storageWidth/2,    // Centering
    0, 
    0
    ]) 
cube(size = [
    storageWidth,
    storageLenght,
    storageHight
    ]);

// Milimiter dimension text
translate([
    -4.4,               // Fine deling x-axis
    2,                  // Fine deling y-axis 
    storageHight         
    ])
linear_extrude(height=0.4)text(
    diameterText,  // Dynamic text
    size=5,
    font="tohoma:style=bold",
    spacing=0.9
    );
    
// End of union    
}  

// Begining of Delition
// Drill tracl
rotate([90,0,0])
translate([
    0,                   // x-axis
    bitPositionHeight,   // Z-axis
    -(maxBitLenght+8)    // y-axis
    ])  
cylinder(
    h = maxBitLenght,    // y-axis
    r = bitRadius        // x-axis 
    );      

// End of Delition
}