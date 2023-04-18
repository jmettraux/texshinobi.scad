
// shinobi.scad

use <cadence.scad>;


// unit is mm

thickness = 10;
gap = 20; // "g" to leg

gtop_length = 20;
gtop_height = 5;
gback = 26;

gbottom_length = 35 + 2 * thickness;
gtooth_height = 5;

width = 30;

leg_height = 50;

// "g"

//cube([width,depth,height], center)

translate([ 0, 0, thickness / 2 ]) union() {

  // gtop

  translate([ - gtop_length / 2, 0, gback ])
    rotate([ 0, 0, 0 ])
      cube([ gtop_length, width, gtop_height ], center=true);

  // gback

  translate([ -thickness / 2, 0, gback / 2 ])
    rotate([ 0, 0, 0 ])
      cube([ thickness, width, gback ], center=true);

  // gbottom

  translate([ -gbottom_length / 2, 0, - thickness / 2 ])
    rotate([ 0, 0, 0 ])
      cube([ gbottom_length, width, thickness ], center=true);

  // gtooth

  translate([ -gbottom_length + thickness / 2, 0, gtooth_height / 2 ])
    rotate([ 0, 0, 0 ])
      cube([ thickness, width, gtooth_height ], center=true);
}

// gap

translate([ gap / 2, 0, 0 ]) rotate([ 0, 0, 0 ])
  cube([ gap, width, thickness ], center=true);


// leg

translate([ gap, width / 2, - leg_height + thickness / 2 ])
  rotate([ 90, 0, 0 ])
    paslice(leg_height, width, slice=90, radius1=leg_height - thickness);

// foot

translate([ gap + leg_height - thickness, 0, - leg_height + 5 ])
  rotate([ 0, 90, 0 ])
    paslice(width / 2, thickness, slice=180);

//translate([ - leg_height, 0, - leg_height + 5 ])
//  rotate([ 0, 90, 0 ])
//    paslice(width / 2, thickness, slice=180);

