$fn=50;

diameter=18;
height=13;
screw_diameter=5.5;
screw_length=40;

difference(){

     cylinder(h=height, d=diameter, center=false);

     translate([-diameter/2, 0, 0]) {
          cube([diameter, diameter, height], center=false);
     }

     translate([0, screw_length/ 2, height/2]) {
          rotate(a=90, v=[1,0,0]) {
               cylinder(h=screw_length, d=screw_diameter, center=false);
          }
     }

     translate([0, 0, height/2]) {
          rotate(a=90, v=[1,0,0]) {
               cylinder($fn=6, d=10, h=4);
          }
     }

}
