$fn = 50;

difference() {
     import("handle_6mm_x2_Rev1.STL");
     translate([0, -20+1, 0])
          cube([200, 20, 30], false);
}
