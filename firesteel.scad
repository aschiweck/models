$fn=50;

height=35;
diameter=15;
steel=9.7;
in=20;
hole=5;

difference() {

     union() {
          cylinder(h=height-diameter/2, d=diameter, center=false);
          translate([0,0,height-diameter/2])
               sphere(d=diameter);
     };

     translate([0,0,-1])
          cylinder(h=in+1, d=steel, center=false);

     translate([0,0,height-diameter/2-hole/2]) {
          union() {
               rotate(a=90, v=[1,0,0]) {
                    cylinder(h=diameter+2, d=hole, center=true);
               }
               translate([0,diameter/2+1,0])
                    sphere(d=hole+2);
               translate([0,-diameter/2-1,0])
                    sphere(d=hole+2);
          };
     };

};
