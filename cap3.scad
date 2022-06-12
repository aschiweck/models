$fn = 50;

difference() {
     cylinder(40, r=4.1, true);
     translate([0,0,1]) {
          cylinder(40, r=3.1, true);
     }

}
