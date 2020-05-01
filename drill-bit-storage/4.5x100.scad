/*
    Drill bit storage
*/

$fn=90;  // accuracy

// import module
use <module/drill-bit-storage.scad>;



// Tootale lenght of the unit
storageLenght = 150; 

// Width of the unit
storageWidth  = 14;  // (Constant under 4mm)  

// The lenght of the drill bit
maxBitLenght  = 81;  

// Drill bit diameter  
bitDiameter = 4.5;


// Call the module
drillBitStorage 
    (bitDiameter,maxBitLenght,storageWidth,storageLenght);
