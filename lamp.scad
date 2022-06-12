$fn=50;

height=80.0; /* 300.0; */
diameter=3.6; /* 3.4 */
cap=true;
thickness=0.8;
tolerance=0.1;

difference() {
     union() {
          translate([0, 0, height/2]) cylinder(height, d=diameter+2*thickness, center=true);
          if (cap) {
               translate([0, 0, height]) sphere(d=diameter+2*thickness);
          };
     };

     translate([0, 0, (height/2)-tolerance]) cylinder(height+(3*tolerance), d=diameter, center=true);
     if (cap) {
          translate([0, 0, height]) sphere(d=diameter);
     };
};
