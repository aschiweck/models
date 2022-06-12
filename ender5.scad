$fn=50;

width = 198.0;
length = 368.0;
height = 2.0;
screw = 3.45;
frame = 20;
vent_width = 5;
vents = 22;
low = false;

part0=true;
part1=false;
test=false;
debug=false;

screw_head_width = low ? 3.7 : 5.6;
screw_head_height = low ? 2.1 : 3;
screw_diameter = low ? 2.1 : 3.1;
screw_length = low ? 17.75 : 18.75;
screw_nut_width = low ? 4.6 : 6.4;
screw_nut_height = low ? 1.7 : 2.4;
bracket_width = low ? 5.5 : 10;
bracket_length = low ? 10 : 10;
bracket_height = low ? 2.25 : 5;


module intersection(x, y, z) {
    translate([x, y, z]) {
        polyhedron(
            points=[
                [0,0,0],
                [0,0,height],
                [width/4,0,height],
                [width/4,0,0],
                [width/4,height,0],
                [0,height,0]
            ],
            faces=[
                [0,1,2],
                [2,3,0],
                [1,0,5],
                [3,2,4],
                [0,3,5],
                [3,4,5],
                [2,1,4],
                [4,1,5]
            ]
        );
    };
};


module hole(x, y, z) {
    translate([x, y, z]) {
        translate([0, 0, -0.5]) {
            cylinder(height+1, d=screw, true);
        };
    };
};


module vent(x, y, z) {
    translate([x, y, z]) {
        translate([vent_width/2, vent_width/2, -0.5]) {
            hull() {
                translate([0, (length/2)-(2*frame), 0])
                    cylinder(height+1, d=vent_width, false);
                cylinder(height+1, d=vent_width, false);
            };
        };
    };
};


module bolt(x, y, z) {
    translate([x, y, z]) {
        difference() {
            translate([0, 0, 0]) {
                union() {
                    cube([bracket_width, bracket_length, bracket_height], false);
                    translate([bracket_width/2, bracket_length, bracket_height]) {
                        difference() {
                             rotate(a=90, v=[1, 0, 0])
                                  cylinder(bracket_length, d=bracket_width, false);
                             translate([-bracket_width/2, -bracket_length-0.1, -3]) cube([bracket_width, bracket_length+0.1+0.1, 2], false);
                        };
                    };
                };
            };
            translate([bracket_width/2, -0.1, bracket_height]) screw();
        };
        if (debug) translate([bracket_width/2, -0.1, bracket_height]) screw();
    };
};


module nut(x, y, z) {
    translate([x, y, z]) {
        difference() {
            translate([0, height, 0]) {
                union() {
                    cube([bracket_width, bracket_length-height, bracket_height], false);
                    translate([bracket_width/2, bracket_length-height, bracket_height]) {
                          difference() {
                               rotate(a=90, v=[1, 0, 0])
                                    cylinder(bracket_length-height, d=bracket_width, false);
                               translate([-bracket_width/2, -bracket_length-0.1, -3]) cube([bracket_width, bracket_length+0.1+0.1, 2], false);
                          };
                    };
                };
            };
            translate([bracket_width/2, height+screw_length-0.1-0.1, bracket_height]) rotate(a=180, v=[1, 0, 0]) screw();
        };
        if (debug) translate([bracket_width/2, height+screw_length-0.1-0.1, bracket_height]) rotate(a=180, v=[1, 0, 0]) screw();
    };
};


module screw() {
    color("green")
        rotate(a=270, v=[1, 0, 0]) {
            cylinder(screw_head_height, d=screw_head_width, true);
            cylinder(screw_length, d=screw_diameter, true);
            translate([0, 0, screw_length-screw_nut_height-0.1]) cylinder($fn=6, screw_nut_height, d=screw_nut_width, true);
    };
};


module plate() {

    nut(((width-bracket_width-bracket_width-bracket_width)/3*0)+bracket_width,(length/2)-10-height,height);
    bolt(((width-bracket_width-bracket_width-bracket_width)/3*1)+bracket_width,(length/2)-10,height);
    nut(((width-bracket_width-bracket_width-bracket_width)/3*2)+bracket_width,(length/2)-10-height,height);
    bolt(((width-bracket_width-bracket_width-bracket_width)/3*3)+bracket_width,(length/2)-10,height);

    intersection(width/4*0, length/2-height, 0);
    translate([width/4*3, 0, height])
        rotate(a=180, v=[0, 1, 0])
            intersection(width/4*1, length/2-height, 0);
    intersection(width/4*2, length/2-height, 0);
    translate([width/4*7, 0, height])
        rotate(a=180, v=[0, 1, 0])
            intersection(width/4*3, length/2-height, 0);

    difference() {
        cube([width, length/2-height, height]);

        hole(5.2, 5.2, 0);
        hole(width-5.2, 5.2, 0);

        for(x = [frame : (width-2*frame-vent_width)/vents : width-frame])
            vent(x, frame, 0);
    };
}


if (part0) {
    plate();
}


if (part1) {
    color("red")
        translate([width, length-height, 0])
            rotate(a=180, v=[0,0,1])
                plate();
};


if (test) {
    if (debug) {
         screw();
         translate([-10, screw_length-0.1, 0]) rotate(a=180, v=[1, 0, 0]) screw();
    }
    bolt(-30,0,0);
    nut(-50, 0, 0);
    translate([-80, 0, 0]) {
         difference() {
              cube([20, 20, height]);
              hole(5.2, 5.2, 0);
         }
    };
};
