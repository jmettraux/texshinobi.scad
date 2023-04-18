
// unit is mm

slot_width = 25;
slot_depth = 4.9;
slot_to_slot = 202;
slot_to_border = 20;
slot_to_end = 70;

beam_width = 30;
beam_height = 10;
beam_length = 290;

leg_height = 50;


use <cadence.scad>;


// beam

cube([ beam_length, beam_width, beam_height ], center=true);


// legs

translate([ beam_length / 2, beam_width / 2, - leg_height + beam_height / 2 ])
  rotate([ 90, 0, 0 ])
    paslice(leg_height, beam_width, slice=90, radius1=leg_height - beam_height);

translate([ - beam_length / 2, - beam_width / 2, - leg_height + beam_height / 2 ])
  rotate([ 90, 0, 180 ])
    paslice(leg_height, beam_width, slice=90, radius1=leg_height - beam_height);

// feet

translate([ beam_length / 2 + leg_height - beam_height, 0, - leg_height + 5 ])
  rotate([ 0, 90, 0 ])
    paslice(beam_width / 2, beam_height, slice=180);

translate([ - beam_length / 2 - leg_height, 0, - leg_height + 5 ])
  rotate([ 0, 90, 0 ])
    paslice(beam_width / 2, beam_height, slice=180);

// slots

translate([ - slot_to_slot / 2 - slot_width / 2, 0, slot_depth * 1.5 ])
  cube([ slot_width, beam_width, slot_depth ], center=true);

translate([ slot_to_slot / 2 + slot_width / 2, 0, slot_depth * 1.5 ])
  cube([ slot_width, beam_width, slot_depth ], center=true);

