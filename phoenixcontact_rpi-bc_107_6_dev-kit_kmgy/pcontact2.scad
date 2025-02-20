$fn = 50;

// plate
length = 104.3;
width = 41.75;
height = 1.5;

// fan
screw = 3.0;
distance = 24.0;
fan = 28.0;

// intake
ilength = 40.0;
iwidth = 30.0;

difference() {

     // base
     cube([length, width, height], center=false);

     // fan
     translate([(length/2) + (fan/2), (width/2) - (fan/2), 0]) {
          union() {
               translate([(screw/2), (screw/2), -1]) {
                    cylinder(h=3, d=screw, center=false);
               }
               translate([(screw/2)+distance, (screw/2), -1]) {
                    cylinder(h=3, d=screw, center=false);
               }
               translate([(screw/2), (screw/2)+distance, -1]) {
                    cylinder(h=3, d=screw, center=false);
               }
               translate([(screw/2)+distance, (screw/2)+distance, -1]) {
                    cylinder(h=3, d=screw, center=false);
               }
               translate([(fan/2), (fan/2), -1]) {
                    cylinder(h=3, d=fan, center=false);
               }
          }
     }

     // intake
     translate([((length/2)-ilength)/2, (width/2) - (iwidth/2), -1]) {
          union() {
               cube([ilength, iwidth, 3], center=false);
          }
     }

}
