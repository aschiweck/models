$fn=50;

width = 198.0;
length = 367.0;
height = 2.0;
screw = 3.45;
frame = 20;
vent_width = 5;
vents = 22;

part0=false;
part1=false;
test=true;
low=true;

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
                    cube([10, 10, 5], false);
                    translate([10/2, 10, 5]) {
                        rotate(a=90, v=[1, 0, 0]) {
                            cylinder(10, d=10, false);
                        };
                    };
                };
            };
            translate([10/2, -0.1, 5]) screw();
        };
    };
};

module nut(x, y, z) {
    translate([x, y, z]) {
        difference() {
            translate([0, height, 0]) {
                union() {
                    cube([10, 10-height, 5], false);
                    translate([10/2, 10-height, 5])
                        rotate(a=90, v=[1, 0, 0])
                            cylinder(10-height, d=10, false);
                };
            };
            translate([10/2, height+screw_length-0.1-0.1, 5]) rotate(a=180, v=[1, 0, 0]) screw();
        };
        translate([10/2, height+screw_length-0.1-0.1, 5]) rotate(a=180, v=[1, 0, 0]) screw();
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

    nut(((width-10-10-10)/3*0)+10,(length/2)-10-height,height);
    bolt(((width-10-10-10)/3*1)+10,(length/2)-10,height);
    nut(((width-10-10-10)/3*2)+10,(length/2)-10-height,height);
    bolt(((width-10-10-10)/3*3)+10,(length/2)-10,height);

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

screw_head_width=5.6;
screw_head_height=3;
screw_diameter=3.1;
screw_length=18.75;
screw_nut_width=6.4;
screw_nut_height=2.4;

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
    /* screw(); */
    /* rotate(a=180, v=[1, 0, 0]) screw(); */
    translate([0, 4+14.2, 0]) rotate(a=180, v=[1, 0, 0]) screw();
    bolt(-20,0,0);
    nut(-40, 0, 0);
}
