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
totalWidth = 915; // t-profile
totalDepth = 600;

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
    
    
    
/* http://www.cannymachines.com/entries/9/openscad_dimensioned_drawings
descs    = [[0, 0, horz, text, 1],
            [12, 12, horz, text, 1]];

details    = [[12, 0, horz, text, 2],
             [12, 12, horz, text, 2]];


details = [
  [cols[0] + desc_x, rows[0] + det_y, DIM_HORZ, " ", 1],   //Responsible dep.
  [cols[1] + desc_x, rows[0] + det_y, DIM_HORZ, " ", 1],   //Technical reference
  [cols[2] + desc_x, rows[0] + det_y, DIM_HORZ, "D. Smiley", 1], //Creator
  [cols[3] + desc_x, rows[0] + det_y, DIM_HORZ, " ", 1],   //Approval person
  [cols[0] + desc_x + 10, rows[2] + det_y, DIM_HORZ, "My OpenSCAD Project", 1],
  [cols[2] + desc_x, rows[1] + det_y, DIM_HORZ, " ", 1],   //Document type
  [cols[3] + desc_x, rows[1] + det_y, DIM_HORZ, "First issue", 1], //Document status
  [cols[2] + desc_x, rows[2] + det_y, DIM_HORZ, "Sample Part", 1], //Title
  [cols[3] + desc_x, rows[2] + det_y, DIM_HORZ, "123", 1], //Identification number
  [cols[3] + desc_x, rows[3] + det_y, DIM_HORZ, " ", 1],  //Rev
  [cols[4] + desc_x, rows[3] + det_y, DIM_HORZ, "2013-3-31", 1], //Date of issue
  [cols[5] + desc_x, rows[3] + det_y, DIM_HORZ, "1/100", 1]  //Sheet
];

titleblock(lines, descs, details);
*/