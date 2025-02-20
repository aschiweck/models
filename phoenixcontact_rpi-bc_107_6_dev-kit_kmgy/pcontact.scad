$fn = 50;

length = 85;
width = 38.5;
height = 1.6;

lipo_height = 68.0;
lipo_diameter = 19.0;
lipo_lock = 3.0;

lock_socket = 2.0 + 8.0;

// transmitter
module HMMODRPIPCB(){

     transmitter_height = 9.0;
     transmitter_width = 16.6;
     transmitter_length = 39.0;
     transmitter_antenna_length = 58;
     transmitter_antenna_diameter = 2;

     color("#ff0000"){
          cube([transmitter_width, transmitter_length, transmitter_height], center=false);
          translate([transmitter_width, transmitter_length-(transmitter_antenna_diameter/2), (transmitter_height/2)]) {
               rotate(a=90, v=[0,1,0]) {
                    cylinder(transmitter_antenna_length, d=transmitter_antenna_diameter, center=false);
               }
          }
     }
}

/* translate([10.5+12, 0, height]) { */
/*      HMMODRPIPCB(); */
/* } */

// base
difference(){
     // plate
     cube([length, width, height], center=false);
     // intake
     translate([(length/2) - (40/2),(width/2) - (20/2),-1]) {
          cube([40, 20, height+2], center=false);
     }
}

// lipo lock
translate([3.3,7,0]) {

     difference() {

          // lipo holder
          union() {
               translate([(length-lipo_height)/2, (width-lipo_diameter), height+(lipo_diameter/2)+lock_socket]) {
                    rotate(a=90, v=[0,1,0]) {
                         cylinder(lipo_height, r=(lipo_diameter/2)+(lipo_lock/2), true);
                    }
               }
               translate([(length-lipo_height)/2, (width-lipo_diameter-(lipo_diameter+lipo_lock)/2), height]) {
                    cube([lipo_height, lipo_diameter+lipo_lock, (lipo_diameter/2)+lock_socket], center=false);
               }
          }

          // lipo cutout
          union() {
               // cutout top
               translate([(length-lipo_height-2)/2, (width-(lipo_diameter+lipo_lock)-5), height+20]) {
                    cube([lipo_height+lock_socket, 16, (lipo_diameter+lipo_lock)+1], center=false);
               }
               // cutout lipo
               translate([(length-lipo_height-lock_socket)/2, (width-lipo_diameter), height+(lipo_diameter/2)+lock_socket]) {
                    rotate(a=90, v=[0,1,0]) {
                         cylinder(lipo_height+lock_socket, r=lipo_diameter/2, true);
                    }
               }
               // cutout center
               translate([(length-lipo_height)/2+10, (width-lipo_diameter-((lipo_diameter+lipo_lock)/2)-1), height]) {
                    cube([lipo_height-lipo_diameter-1, lipo_diameter+lipo_lock+1, (lipo_diameter+lipo_lock)+lock_socket], center=false);
               }
          }

     }

     // bottom lipo lock
     translate([(length-lipo_height-2)/2, (width-19-11), height]) {
          cube([1, 22, 14], center=false); //lipo_socket + 3?
     }

     // top lipo lock
     translate([length-(length-lipo_height-2)/2-1, (width-19-11), height]) {
          cube([1, 22, 14], center=false); //lipo_socket + 3?
     }

}

// fan lock

difference() {
     union () {
          translate([0,(width-30)/2,height]) {
               /* rotate(a=90, v=[0,0,1]){ */
                    cube([1.0, 30.0, 6.0], center=false);

               /* } */
          }
          translate([7.8+1.0+0.2,(width-30)/2,height]) {
               /* rotate(a=90, v=[0,0,1]){ */
                    cube([1.0, 30.0, 6.0], center=false);
               /* } */
          }
          translate([0,(width-30)/2-2.0-0.1,height]) {
               cube([1.0+1.0+7.8+0.2, 2.0, 6.0], center=false);
          }
          translate([0,width-((width-30)/2)+0.1,height]) {
               cube([1.0+1.0+7.8+0.2, 2.0, 6.0], center=false);
          }
     }
     translate([0,width/2,height+28/2]) {
          rotate(a=90, v=[0,1,0]){
               cylinder(7.8+2.0+2.0, d=28, center=false);
          }
     }
}

// fan clips
translate([1.0,(width-30)/2+2.0+1.0,height+1.5+1.5]) {
     rotate(a=90, v=[0,1,0]){
          cylinder(0.4, d1=3, d2=2, center=false);
     }
}
translate([1.0,width-((width-30)/2)-2.0-1.0,height+1.5+1.5]) {
     rotate(a=90, v=[0,1,0]){
          cylinder(0.4, d1=3, d2=2, center=false);
     }
}
translate([1.0+7.8-0.2-0.2,(width-30)/2+2.0+1.0,height+2+1.5]) {
     rotate(a=90, v=[0,1,0]){
          cylinder(0.4, d1=3, d2=4, center=false);
     }
}
translate([1.0+7.8-0.2-0.2,width-((width-30)/2)-2-1.0,height+2+1.5]) {
     rotate(a=90, v=[0,1,0]){
          cylinder(0.4, d1=3, d2=4, center=false);
     }
}

// power mount
translate([length-15.0,0,0]) {
     difference() {
          cube([15.0, 14.0, 9.0], center=false);
          translate([6,3,2]) {
               cylinder(7.5, d=3.0, center=false);
          }
          translate([6,11,2]) {
               cylinder(7.5, d=3.0, center=false);
          }
          translate([0,0,6]) {
               cube([3.0, 14.0, 3.0], center=false);
          }
     }
}

// cable management
w = 2.0;
l = 40.0;
h = 7.0;
hh = 1.5;
hs = 8.0;

/* translate([(length/2)-(l/2),(width/2)-10-w,height]) { */
/*      difference() { */
/*           cube([l, w, h], center=false); */
/*           translate([hs,0,4.0]) { */
/*                cube([3.0, w, hh], center=false); */
/*           } */
/*           translate([l-3.0-hs,0,4.0]) { */
/*                cube([3.0, w, hh], center=false); */
/*           } */
/*           translate([hs,0,1.0]) { */
/*                cube([3.0, w, hh], center=false); */
/*           } */
/*           translate([l-3.0-hs,0,1.0]) { */
/*                cube([3.0, w, hh], center=false); */
/*           } */
/*      } */
/* } */
