$fn=50;

width=40;
depth=15;
height=75 * 2;
screw_diameter=6.0;
screw_depth=10.0;
corner=5.0;

module hole() {
    translate([screw_diameter/2, screw_depth, screw_diameter/2])
        rotate(90, [1, 0, 0])
            cylinder(h=screw_depth+1, d=screw_diameter, center=false);
}

difference() {

    minkowski() {
        translate([corner/2, corner, corner/2])
            rotate(90, [1, 0, 0])
                cylinder(h=corner, d=corner, center=false);
        translate([0, 0, 0])
            cube([width-corner, depth-corner, height-corner], center=false);
    }

    translate([width/2-screw_diameter/2, 0, height - 15 - screw_diameter/2])
        hole();
    translate([width/2-screw_diameter/2, 0, height/2 - 15 - screw_diameter/2])
        hole();
    translate([width/2-screw_diameter/2, 0, height/2 + 15 - screw_diameter/2])
        hole();
    translate([width/2-screw_diameter/2, 0, 15 - screw_diameter/2])
        hole();

}
