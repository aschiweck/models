$fn = 50;

difference() {
cube([63, 3.5 , 7],center=false);

union() {

translate([4,0.5,3.5]) {
rotate(a=90, v=[1,0,0]) {
cylinder(h=5, r1=1, r2=3, center=false);
}
}

translate([4,3,3.5]) {
rotate(a=270, v=[1,0,0]) {
cylinder(h=5, r1=1, r2=3, center=false);
}
}

}

}
