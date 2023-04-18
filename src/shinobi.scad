
// unit is mm

slot_width = 25;
slot_depth = 5;
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

