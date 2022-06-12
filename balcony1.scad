$fn=50;

height = 20.0;
diameter = 43.0;
wall = 3.0;
gap = 20.0;
space = 125.0;
screw = 5.0;
roundoff = 2.0;
border = 12;

difference() {

     difference() {

          // holder
          union() {

               // spike
               translate([-space-(diameter/2)+wall,-(wall/2),0]) {
                    minkowski() {
                         sphere(r=roundoff);
                         cube([space,wall,height],center=false);
                    }
               }
               // clamp
               minkowski() {
                    translate([0,-(diameter/2),0]) {
                         sphere(r=roundoff);
                    }
                    translate([0,(diameter/2),0]) {
                         cylinder(h=height, r=(diameter/2)+wall, center=false);
                    }
               }
               // clip
               minkowski() {
                    translate([0,-(gap+2*wall)/2,0]) {
                         cube([(diameter/2)+15,gap+2*wall,height],center=false);
                    }
                    sphere(r=roundoff);
               }
          }

          // hole
          translate([0,0,-roundoff-1]) {
               cylinder(h=height+2*roundoff+2, r=diameter/2, center=false);
          }

     }

     // gap
     translate([0,-(gap/2),-roundoff]) {
          cube([diameter/2+wall+roundoff+15,gap,height+2*roundoff],center=false);
     }

     // screw
     translate([(diameter/2)+wall+15+roundoff-border,20,height/2]) {
          rotate(a=90, v=[1,0,0]) {
               cylinder(h=40, r=screw/2, center=false);
          }
     }

     // rope
     translate([-space-(diameter/2)+border,20,height/2]) {
          hull() {
               rotate(a=90, v=[1,0,0]) {
                    cylinder(h=40, r=screw/2, center=false);
               }
               translate([5,0,0]) {
                    rotate(a=90, v=[1,0,0]) {
                         cylinder(h=40, r=screw/2, center=false);
                    }
               }
          }
     }

}
