$fn=50;

width = 17.5;

difference() {

     union() {
          cube([4.0,width,3.5],center=false);
          translate([-3.5,0,0]) {
               cube([3.5,width,2.5+3.5],center=false);
          }
          translate([-11-3.5,0,2.5]) {
               cube([11,width,3.5],center=false);
          }
     }

     union() {
          translate([-9,width/2,2.5]) {
               cylinder(h=3.5, d1=8, d2=3.5, center=false);
          }
     }

}
