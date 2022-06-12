$fn=50;
/* cylinder(240, r=20); */


/* import("/home/andreas/prints/SWEDISH_BIRD_HOUSE/files/tuer.stl"); */

x=40;
y=85;
z=10;

/* intersection() { */
difference() {
     import("/home/andreas/prints/SWEDISH_BIRD_HOUSE/files/tuer.stl");
translate([-x/2,-1,-1]) {
cube([x, y+1, z], false);
};
};
