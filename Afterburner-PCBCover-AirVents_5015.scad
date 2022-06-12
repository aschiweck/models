$fn = 50;

/* difference() { */

translate([-60,129.5,140]) {
     rotate([-90,0,0])
          rotate([0,90,0])
               import("Afterburner-PCBCover-AirVents.stl");
}


union() {
     translate([-8.2,0,-59.5]) {
          import("5015_mount_back.stl");
          /* translate([5,0,0]) */
          /*      import("5015_mount_back.stl"); */
          /* translate([10,0,0]) */
          /*      import("5015_mount_back.stl");    */
          translate([-40,0,-0.1])
               import("5015_mount_front - Gdstime 5015 fan.stl");
     }
}

translate([-55,15,36])
    cube([25, 10, 10], true);

/* } */
