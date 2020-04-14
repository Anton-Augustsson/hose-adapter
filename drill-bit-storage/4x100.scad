/*
    Drill bit storage
*/

$fn=90;  // accuracy

// import module
use <module/drill-bit-storage.scad>;



// Tootale lenght of the unit
storageLenght = 100; 

// Width of the unit
storageWidth  = 10;  // (Constant under 4mm)  

// The lenght of the drill bit
maxBitLenght  = 80;  

// Drill bit diameter  
bitDiameter = 4.0;


// Call the module
drillBitStorage 
    (bitDiameter,maxBitLenght,storageWidth,storageLenght);
