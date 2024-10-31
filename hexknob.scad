module hexagon(side, height, center) {
  length = sqrt(3) * side;
  translate_value = center ? [0, 0, 0] :
                             [side, length / 2, height / 2];
  translate(translate_value)
    for (r = [-60, 0, 60])
      rotate([0, 0, r])
        cube([side, length, height], center=true);
}


module hexagon_inscribed(radius, height, center) {
  hexagon(2 * radius / sqrt(3), height, center);
}

module fhex(wid,height){
hull(){
cube([wid/1.7,wid,height],center = true);
rotate([0,0,120])cube([wid/1.7,wid,height],center = true);
rotate([0,0,240])cube([wid/1.7,wid,height],center = true);
}
}

// Knob diameter
knob_diameter = 10;

// Knob length
knob_length = 7.5;

// Socket diameter
socket_diameter = 5.75;

// Socket depth
socket_depth = 3.1;

// Knurling offset
knurling_offset = 0.1;

// Knurling depth
knurling_depth = 1;

// Knurl count
knurl_count = 8;

// Knurling facets
knurling_facets = 20;


// Credit for the rounded_cylinder function goes to kevinfquinn.
// Copied from
// https://www.thingiverse.com/groups/openscad/forums/general/topic:17201
// on 2019-02-04.
module rounded_cylinder(r,h,n) {
  rotate_extrude(convexity=1) {
    offset(r=n) offset(delta=-n) square([r,h]);
    square([n,h]);
  }
}

difference() {
    kradius = knob_diameter / 2;
    rounded_cylinder(r=kradius, h=knob_length, n=2, $fn=60);
    kcircle_radius = kradius + knurling_offset;

    for(a=[0:360.0 / knurl_count:360]) {
        translate([kcircle_radius * cos(a), kcircle_radius * sin(a), 0]) {
            rounded_cylinder(h=knob_length, r=knurling_depth, n=1, $fn=knurling_facets);
        }
    }
//    translate([0, 0, 4.5]) {
//        cylinder(r=socket_diameter/2, h=socket_depth, $fn=20);
//    }
}

    translate([0, 0, 9]) {
        //cylinder(r=3/2, h=3, $fn=6);
        //hexagon(3/2, 6, true);
        fhex(3.2,3);
    }


//fhex(3,3);
