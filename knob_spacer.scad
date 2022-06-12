$fn=50;

height=1.0;
diameter=2;
width=1.5;

difference() {
     cylinder(height, d=diameter+2*width, center=true);
     cylinder(height, d=diameter, center=true);
};
