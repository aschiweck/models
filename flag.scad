$fn = 50;

length = 50;
width = 30;
height = 3;
diameter = 8.6;


cube([length, width, height], false);

translate([0, width/2, diameter-1]) {
     rotate(a=90, v=[0,1,0]) {
          difference() {
               cylinder(h=length, d=diameter+2*height, center=false);
               cylinder(h=length, d=diameter, center=false);
          }
     }
}
