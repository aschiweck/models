$fn = 50;

difference() {
     import("Limit_Switch_Adapter_Y_Axis.stl");
     translate([12.25, 13, 6]) {
          hull() {
               cylinder(5, d=5, center=false);
               translate([5, 0, 0]) {
                    cylinder(5, d=5, center=false);
               }
          }
     }
}
