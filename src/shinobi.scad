
// shinobi.scad

use <cadence.scad>;


// unit is mm

thickness = 10;
gap = 7; // "g" to leg

gtop_length = 20;
gtop_height = 5;
gback = 26 - 1 + 0.5;

gbottom_length = 35 + 2 * thickness - 3 - 1;
gtooth_height = 5;

width = 30;

leg_height = 50;

// "g"

//paslice(radius, depth, slice=45, radius1=0)
//cube([width,depth,height], center)

translate([ 0, 0, thickness / 2 ]) union() {

  // gtop

  translate([ - thickness * 0.75, 0, gback + gtop_height / 2 ])
    rotate([ 0, 0, 0 ])
      cube([ thickness / 2, width, gtop_height ], center=true);

  translate([ - thickness / 2, width / 2, gback ])
    rotate([ 90, 0, 0 ])
      paslice(gtop_height, width, slice=90);

  hull() {
    translate([ - thickness, - width / 4, gback + gtop_height ])
      rotate([ 0, 180, 0 ])
        paslice(width / 4, gtop_height, slice=180);
    translate([ - thickness, width / 4, gback + gtop_height ])
      rotate([ 0, 180, 0 ])
        paslice(width / 4, gtop_height, slice=180);
  }

  // gback

  translate([ -thickness / 2, 0, gback / 2 ])
    rotate([ 0, 0, 0 ])
      cube([ thickness, width, gback ], center=true);


  translate([ thickness / 2, 0, thickness / 2 ])
    rotate([ 0, 0, 0 ])
      difference() {
        cube([ thickness, width, thickness ], center=true);
        translate([ thickness / 2, 0, thickness / 2 ]) rotate([ 90, 0, 0 ])
          cylinder(r=thickness, h=width * 2, center=true);
      };

  translate([ - 1.5 * thickness, 0, thickness / 2 ])
    rotate([ 0, 0, 180 ])
      difference() {
        cube([ thickness, width, thickness ], center=true);
        translate([ thickness / 2, 0, thickness / 2 ]) rotate([ 90, 0, 0 ])
          cylinder(r=thickness, h=width * 2, center=true);
      };

  // gbottom

  translate([ -gbottom_length / 2 + thickness / 2, 0, - thickness / 2 ])
    rotate([ 0, 0, 0 ])
      cube([ gbottom_length - thickness, width, thickness ], center=true);

  translate([ - gbottom_length + thickness, width / 2, 0 ])
    rotate([ 90, 180, 0 ])
      paslice(thickness, width, slice=90);

  // gtooth

  translate([ -gbottom_length + thickness / 2, 0, gtooth_height / 2 ])
    rotate([ 0, 0, 0 ])
      cube([ thickness, width, gtooth_height ], center=true);
}

// gap

translate([ gap / 2, 0, 0 ]) rotate([ 0, 0, 0 ])
  cube([ gap, width, thickness ], center=true);


// leg

translate([ 0, 0, 0.3 ]) {

  translate([ gap, width / 2, - leg_height + thickness / 2 ])
    rotate([ 90, 0, 0 ])
      paslice(leg_height, width, slice=90, radius1=leg_height - thickness);

  // foot

  translate([ gap + leg_height - thickness, 0, - leg_height + 5 ])
    rotate([ 0, 90, 0 ])
      paslice(width / 2, thickness, slice=180);
}

