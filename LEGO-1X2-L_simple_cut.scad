$fn = 50;



difference() {
     import("LEGO-1X2-L_simple.stl");
     translate([-3.25/2, 8/2-2.25, 0]) {
          cube([3.25, 2.25, 10], false);
     };
}
