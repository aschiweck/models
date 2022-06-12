
// dimensions
width=10;
height=50;
depth=80;
back=33;
wall=10;
trap=5;

// fixed
SPACER=1;
OPENING=7;

// catch
cube([10,width,10]);

// spacer
translate([-SPACER,0,OPENING]) {
  cube([SPACER,width,10-OPENING]);
}

//  line
translate([-wall-SPACER,0,-wall-OPENING]) {
   cube([wall,width,wall+OPENING+10]);
}

// support
translate([-SPACER,0,-wall-OPENING]) {
  cube([back,width,wall]);
}

// back
translate([back-wall,0,-height-OPENING]) {
  cube([wall,width,height]);
}

// bottom
translate([-depth+back,0,-height-7]) {
  cube([depth,width,wall]);
}

// front
translate([-depth+back,0,-height-OPENING]) {
  cube([wall,width,height]);
}

// trap
translate([-depth+back+wall,0,-wall-OPENING]) {
  cube([trap,width,wall]);
} 