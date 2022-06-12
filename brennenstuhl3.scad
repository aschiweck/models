$fn=50;

height = 3.2;
width = 48.0;
length = 35.0;
corner = 1.0;
power_strip_length = 380;
shelf_width = 500;
length_inner = 7;
outer_distance = (shelf_width - power_strip_length) / 2;
diameter = 8.0;

module hole() {
    translate([0,0,-1])
         hull() {
         translate([0,10,0])
              cylinder(h=height+2, d=diameter);
         cylinder(h=height+2, d=diameter);
    }
}

// base plate
difference() {
    cube([width, length, height]);
    translate([(width/2)-(19/2), 0, 0])
         cube([19, 21.5, height+1]);
}

// clip
translate([(width/2)-(14.5/2), 1.5, sin(5)*20])
    rotate(a=-5, v=[1,0,0])
        cube([14.5, 20, height]);

// inner spacer
translate([0, -length_inner, 0])
    cube([width, length_inner, height]);

// outer bracket
difference() {
translate([0, -length_inner-outer_distance, 0])
    cube([width, outer_distance, height]);

translate([width/3*1-diameter/2, -length_inner-outer_distance+10, 0])
    hole();

translate([width/3*2+diameter/2, -length_inner-outer_distance+10, 0])
    hole();
}
