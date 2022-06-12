$fn=50;

width=36.0;
depth=36.0;
height=5;


h=4.5;
r=2.5;
d=28.8;
x=(width-d)/2;
y=x;
z=-1;

difference() {

difference() {

difference() {

cube([width,depth,height], center=false);

translate(v = [x, y, z]) {
cylinder(h=h, r=r, center=false);
}

translate(v = [x+d, y, z]) {
cylinder(h=h, r=r, center=false);
}

translate(v = [x+d, y+d, z]) {
cylinder(h=h, r=r, center=false);
}

translate(v = [x, y+d, z]) {
cylinder(h=h, r=r, center=false);
}

}

h2=3;
r2=1;
d2=28.8;
x2=(width-d2)/2;
y2=x2;
z2=3;

translate(v = [x2, y2, z2]) {
cylinder(h=h2, r=r2, center=false);
}

translate(v = [x2+d, y2, z2]) {
cylinder(h=h2, r=r2, center=false);
}

translate(v = [x2+d, y2+d2, z2]) {
cylinder(h=h2, r=r2, center=false);
}

translate(v = [x2, y2+d2, z2]) {
cylinder(h=h2, r=r2, center=false);
}

}

translate(v = [(width-25)/2, (depth-10)/2, 3]) {
cube([25,10,3], center=false);
}

}
