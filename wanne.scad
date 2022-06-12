$fn=50;

length=200.0;
width=200.0;
height=30.0;

minkowski() {
     cube([width-10, length-10, height-10], false);
     cylinder(d=10,h=10);
};
