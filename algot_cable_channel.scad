
// dimensions
width=200;
height=50;
depth=80;
back=33;
wall=10;
trap=5;

// fixed
SPACER=1;
OPENING=7;




translate([0,wall,0]) {
  cube([wall,width-4*wall,wall]);
}
translate([-SPACER,wall,OPENING]) {
  cube([SPACER,width-4*wall,10-OPENING]);
}
translate([-wall-SPACER,wall,-wall-OPENING]) {
   cube([wall,width-4*wall,wall+OPENING+10]);
}

translate([-SPACER,wall,-OPENING-wall/5]) {
  cube([back-wall+SPACER,width-4*wall,wall/5]);
}

translate([back-wall,wall,-OPENING-wall]) {
  cube([wall,width-4*wall,wall]);
}

translate([back,wall,-back-wall]) {
  cube([wall/5,width-4*wall,back]);
}

translate([back-wall,wall,-OPENING-height]) {
  cube([wall,width-4*wall,wall]);
}
translate([-depth+back,wall,-height-OPENING]) {
  cube([wall,width-4*wall,wall]);
}
translate([-depth+back,wall,-OPENING-wall]) {
  cube([wall,width-4*wall,wall]);
}





// catch
cube([10,wall,10]);

// spacer
translate([-SPACER,0,OPENING]) {
  cube([SPACER,wall,10-OPENING]);
}

//  line
translate([-wall-SPACER,0,-wall-OPENING]) {
   cube([wall,wall,wall+OPENING+10]);
}

// support
translate([-SPACER,0,-wall-OPENING]) {
  cube([back,wall,wall]);
}

// back
translate([back-wall,0,-height-OPENING]) {
  cube([wall,wall,height]);
}

// bottom
translate([-depth+back,0,-height-7]) {
  cube([depth,wall,wall]);
}

// front
translate([-depth+back,0,-height-OPENING]) {
  cube([wall,wall,height]);
}

// trap
translate([-depth+back+wall,0,-wall-OPENING]) {
  cube([trap,wall,wall]);
}




// catch
translate([0,width-2*wall,0]) {
  cube([10,wall,10]);
}

// spacer
translate([-SPACER,width-2*wall,OPENING]) {
  cube([SPACER,wall,10-OPENING]);
}

//  line
translate([-wall-SPACER,width-2*wall,-wall-OPENING]) {
   cube([wall,wall,wall+OPENING+10]);
}

// support
translate([-SPACER,width-2*wall,-wall-OPENING]) {
  cube([back,wall,wall]);
}

// back
translate([back-wall,width-2*wall,-height-OPENING]) {
  cube([wall,wall,height]);
}

// bottom
translate([-depth+back,width-2*wall,-height-7]) {
  cube([depth,wall,wall]);
}

// front
translate([-depth+back,width-2*wall,-height-OPENING]) {
  cube([wall,wall,height]);
}

// trap
translate([-depth+back+wall,width-2*wall,-wall-OPENING]) {
  cube([trap,wall,wall]);
}