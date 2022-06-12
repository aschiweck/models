$fn=50;

length = 102.0;
width = 102.0;
height = 3.0;
angle = 75;
display_width = 80.0;
display_height = 52.0;
screw=2.9;
stand_width = 20.0;
standoff = 5.0;


module hole(x, y, z, d) {
    translate([x, y, z]) {
        translate([0, 0, -0.1]) {
            cylinder(height+1, d=d, true);
        };
    };
};

module standoff(x, y, z, d) {
    translate([x, y, z]) {
        translate([0, 0, -0.1]) {
            cylinder(height+1, d=d, true);
        };
    };
};

module display(x, y, z) {
    translate([x, y, z]) {
        translate([0, 0, -0.1]) {
             cube([display_height, display_width, height+0.2]);
            /* cylinder(height+1, d=screw, true); */
        };
    };
};

module stand(x, y, z) {
    translate([x, y, z]) {
         translate([0, 0, 0]) {
              rotate(a=-angle, v=[0, 1, 0]) {
                   difference() {
                       cube([stand_width, width, height]);
                       hole(x+(stand_width/2), y+(width/3), 0, screw);
                       hole(x+(stand_width/2), y+(width/3)*2, 0, screw);
                   };
                   difference() {
                        translate([0+(stand_width/2)-6.2/2, 0, height]) cube([6.2, width, 1.8]);
                        hole(x+(stand_width/2), y+(width/3), height, screw);
                        hole(x+(stand_width/2), y+(width/3)*2, height, screw);
                   };
              };
         };

    };
};

module mount(x, y, z) {
     translate([x, y, z]) {
          difference(){
               cylinder(7, d=6, true);
               translate([0, 0, -0.1]) {
                    cylinder(7+0.2, d=screw, true);
               };
          };
     };
};

stand(0,0,0);
difference() {
     cube([length, width, height]);
     display((length-display_height)-12, (width-display_width)/2, 0);
     /* hole(32, 6.6, 0, screw); */
     /* hole(32, width-6.6, 0, screw); */
     /* hole(length-5.5, 6.6, 0, screw); */
     /* hole(length-5.5, width-6.6, 0, screw); */
     hole(22, width-19, 0, 10);
};
mount(32, 6.6, height);
mount(32, width-6.6, height);
mount(length-5.5, 6.6, height);
mount(length-5.5, width-6.6, height);
