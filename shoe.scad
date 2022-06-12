$fn=50;

width = 100.0;
height = 200.0;
depth = 300.0;
line = 0.44;

difference() {

difference() {
     cube([depth, width+2*line, height+2*line], false);
     translate([-line, line, -line]) {
          cube([depth+2*line, width, height+2*line], false);
     }
}

translate([depth/2, width/2+line, 100]) {
rotate(a=90, v=[1,0,0]) {
     cylinder(h=width+2*line, d=depth/2, center=true);
}
}

}
