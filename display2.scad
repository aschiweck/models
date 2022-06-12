$fn=50;

width=102.0;
length=122.0;
depth=3.0;
display_width = 80.0;
display_height = 52.0;

m3_head=5.0;
m3_thread=2.9;
m4_head=7.0;
m4_thread=4.2;
stand_depth=5.0;
stand_height=20.0;
stand_offset=3.0;
stand_side=sqrt((stand_depth*stand_depth)+(stand_height*stand_height));
stand_angle=asin(stand_depth/stand_side);
tolerance=0.1;
2020_nut_width=6.2;
2020_nut_depth=1.8;


module hole(x, y, z, d) {
    translate([x, y, z]) {
        translate([0, 0, -tolerance]) {
            cylinder(depth+1, d=d, true);
        };
    };
};

module display(x, y, z) {
    translate([x, y, z]) {
        translate([0, 0, -tolerance]) {
             cube([display_width, display_height, depth+2*tolerance]);
        };
    };
};

module sleeve(x, y, z) {
     translate([x, y, z]) {
          difference(){
               cylinder(7, d=6, true);
               translate([0, 0, -0.1]) {
                    cylinder(7+2*tolerance, d=m3_thread, true);
               };
          };
     };
};

module mount(x, y, z) {
     translate([x, y, z]) {
          sleeve(0, 0, depth);
          sleeve(87.9, 0, depth);
          sleeve(0, 64.9, depth);
          sleeve(87.9, 64.9, depth);
     };
};

module frame(x, y, z){
     translate([x, y, z]) {
          difference() {
               cube([width, length, depth]);
               display((width-display_width)/2, length-display_height-6.45-5.5, 0);
               hole((width/2)-32.1, length-(5.5+6.45+display_height+16), 0, 10);
          };
          mount((width-87.9)/2, length-64.9-5.5, z);
     };
};

module stand(x, y, z) {
     translate([x, y, z]) {
          difference() {
               union() {
                    difference() {
                         union(){
                              translate([0, 0, 0]) {
                                   polyhedron(
                                        points=[
                                             [0,0,0],
                                             [0, stand_depth, 0],
                                             [0, stand_depth, stand_height],
                                             [width, 0, 0],
                                             [width, stand_depth, 0],
                                             [width, stand_depth, stand_height]
                                             ],
                                        faces=[
                                             [0,1,2],
                                             [2,3,0],
                                             [3,2,5],
                                             [3,5,4],
                                             [2,1,5],
                                             [1,4,5],
                                             [1,0,4],
                                             [0,3,4]
                                             ]
                                        );
                              };
                              translate([0, stand_depth, 0])
                                   cube([width, stand_offset, stand_height]);
                         };
                    };
                    translate([width/2, stand_depth+stand_offset+(2020_nut_depth/2), stand_height/2])
                         cube([width, 2020_nut_depth, 2020_nut_width], true);
               };
               translate([(width-60)/2, stand_depth+stand_offset-1.0, -tolerance])
                    cube([60.0, 1.0+2020_nut_depth, stand_height+2*tolerance]);
          };
     };
};

difference(){
     union() {
          translate([0, 0, depth]) mirror([0,1,0]) rotate(a=90+stand_angle, v=[1,0,0]) stand(0, 0, 0);
          frame(0, 0, 0);
     };
     translate([width/10*1, stand_side/2-(sin(stand_angle)*(7-4)), 0])
          rotate(a=-stand_angle, v=[1,0,0]) translate([0, 0, -4])
          cylinder(7, d=m4_head, true);
     translate([width/10*1, stand_side/2-(sin(stand_angle)*(7-4)), 0])
          rotate(a=-stand_angle, v=[1,0,0]) translate([0, 0, -4])
          cylinder(20, d=m4_thread, true);
     translate([width/10*9, stand_side/2-(sin(stand_angle)*(7-4)), 0])
          rotate(a=-stand_angle, v=[1,0,0]) translate([0, 0, -4])
          cylinder(7, d=m4_head, true);
     translate([width/10*9, stand_side/2-(sin(stand_angle)*(7-4)), 0])
          rotate(a=-stand_angle, v=[1,0,0]) translate([0, 0, -4])
          cylinder(20, d=m4_thread, true);
};
