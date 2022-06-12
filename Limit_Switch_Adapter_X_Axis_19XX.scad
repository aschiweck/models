$fn = 50;

difference() {
     import("Limit_Switch_Adapter_X_Axis.stl");
     translate([10.5,13,6]) {
          hull() {
               cylinder(5, d=5, center=false);
               translate([5, 0, 0]) {
                    cylinder(5, d=5, center=false);
               }
          }
     }
}
