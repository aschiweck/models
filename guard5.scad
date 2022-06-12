$fn=50;

x = 75.0;
y = 70.0;
width = 20.0;
height = 4.0;
bracket_height = 2.0;
bracket_length = 20.0;
screw = 5.0;


module bracket(x, y) {
     difference(){
     translate([x, y, 0]) cube([width, bracket_height, bracket_length], false);
     hull(){
          translate([x + (width/2), y + bracket_height + 0.1, 10]) rotate(a=90, v=[1,0,0]) cylinder(h=bracket_height+0.2, d=screw, center=false);
          translate([x + (width/2), y + bracket_height + 0.1, bracket_length+10]) rotate(a=90, v=[1,0,0]) cylinder(h=bracket_height+0.2, d=screw, center=false);
     }}
};


difference(){
     cube([x + (width/2), y + (width/2), height], false);
     translate([width, width, 0]) cube([x - (width/2), y - (width/2), height], false);
};
translate([-2 * width, y - (width/2), 0]) cube([2 * width, width, height], false);

bracket(0, y + (width/2) - bracket_height);
translate([x + (width/2), 0, 0]) rotate(a=90, v=[0,0,1]) bracket(0, 0);
