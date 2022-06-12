$fn=50;

width = 47.5;

difference() {

     union() {
          cube([8.0,width,3.5],center=false);
          translate([-3.5,0,0]) {
               cube([3.5,width,2.5+3.5],center=false);
          }
          translate([-15-3.5,0,2.5]) {
               cube([15,width,3.5],center=false);
          }
     }

     union() {
          translate([-10,width/4,2.5]) {
               cylinder(h=3.5, d1=8.0, d2=3.5, center=false);
          }
          translate([-10,width/4*3,2.5]) {
               cylinder(h=3.5, d1=8.0, d2=3.5, center=false);
          }
     }

}
