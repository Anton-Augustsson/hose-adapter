/*
    Drill bit storage
*/

use <top.scad>;
use <foundation.scad>;

/*
    ---------- Variables ---------- 
*/

$fn=90;  // accuracy


sideOverhangWidth = 100;
sideOverhangDepth = 50;

thicknessMdf = 19;
thicknessPlywood = 12; 

castersHeight = 100;

totalHeight = 900-castersHeight;
totalWidth = 900; // t-profile
totalDepth = 500;

foundationHeight = 
    totalHeight
    -thicknessMdf;
foundationWidth = 
    totalWidth
    -sideOverhangWidth*2;
foundationDepth =
    totalDepth
    -sideOverhangDepth*2;



/*
    ---------- Code ---------- 
*/


// ---------- Foundation ---------- 
foundation (
    thicknessPlywood,
    foundationHeight,
    foundationWidth,
    foundationDepth,
    totalWidth/2-foundationWidth/2,
    sideOverhangDepth,castersHeight
    );

// ---------- Top---------- 
top (
    thicknessMdf,
    totalWidth,
    totalDepth,
    0,0,
    totalHeight-thicknessMdf
    +castersHeight
    );