
// shinobi.scad

use <cadence.scad>;


// unit is mm

beam_width = 30;

thickness = 10;

leg_height = 50;


// leg

translate([ 0, beam_width / 2, - leg_height + thickness / 2 ])
  rotate([ 90, 0, 0 ])
    paslice(leg_height, beam_width, slice=90, radius1=leg_height - thickness);

// foot

translate([ leg_height - thickness, 0, - leg_height + 5 ])
  rotate([ 0, 90, 0 ])
    paslice(beam_width / 2, thickness, slice=180);

//translate([ - leg_height, 0, - leg_height + 5 ])
//  rotate([ 0, 90, 0 ])
//    paslice(beam_width / 2, thickness, slice=180);

