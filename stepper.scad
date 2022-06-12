
width=20.0;
length=25.0;
height=25.0;
tolerance=0.5;

/* cube([width, length, height], false); */
cube([width+2*tolerance, length+2*tolerance, height-10.0-tolerance], false);
