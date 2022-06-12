$fn=50;

difference() {

union() {
import("PsuMountBottom.stl");
translate([0, -150, 0]) {
     difference() {
          mirror(v=[0,1,0])
               import("PsuMountBottom.stl");
          translate([-51, 65, 4])
               cube([102, 20, 5]);
          translate([-51, 78, 0])
               cube([102, 10, 5]);
     }
}
}

union() {
translate([0, -48, 0]) {
translate([0, -100, -1]) {
     difference() {
     translate([-48, 60, 0])
          cube([95, 22, 3.9]);
     difference() {
          mirror(v=[0,1,0])
               import("PsuMountBottom.stl");
          translate([-51, 65, 4])
               cube([102, 20, 5]);

     }
     }
}
translate([0, -100, 2]) {
     difference() {
     translate([-48, 60, 0])
          cube([95, 22, 3.9]);
     difference() {
          mirror(v=[0,1,0])
               import("PsuMountBottom.stl");
          translate([-51, 65, 4])
               cube([102, 20, 5]);

     }
     }
}
}
}

}
