$fn=50;

width=50.0;
height=70.0;
depth=20.0;
thickness=2.0;

cube([width, height / 2 * 1, thickness]);
translate([0, height / 2 * 1, 0])
    cube([width, height / 2 * 1, thickness]);
translate([0, height / 2 * 1, depth])
    cube([width, height / 2 * 1, thickness]);

translate([0, 0, thickness])
    cube([width, thickness, depth]);
translate([0, height / 2 * 1, 0])
    cube([width, thickness, depth]);
translate([0, height-thickness, 0])
    cube([width, thickness, depth]);
