$fn = 50;

wall = 1.8;
/* length = 107.6-(2*wall); */
length = 107.1-(2*wall);
/* width = 89.7-(2*wall); */
width = 89.2-(2*wall);
height = 1.6;

difference(){

     // base
     cube([length, width, height], center=false);

     // cutout1
     translate([9.5 + 0.8, (width/2) - (29.0/2), 0]) {
          rotate(a=90, v=[0,0,1]) {
               cube([29.0, 9.5, height+1], center=false);
          }
     }

     // cutout2
     translate([length, (width/2) - (wall/2), 0]) {
          rotate(a=90, v=[0,0,1]) {
               cube([wall, 3, height+1], center=false);
          }
     }

     // cutout3
     translate([(length/2) + 18.5 - (18.5/2), 0, 0]) {
          rotate(a=90, v=[0,0,1]) {
               cube([4.2, 18.5, height+1], center=false);
          }
     }

     // cutout4
     translate([(length/2) + 18.5 - (18.5/2), width - 4.2, 0]) {
          rotate(a=90, v=[0,0,1]) {
               cube([4.2, 18.5, height+1], center=false);
          }
     }

     // cutout5
     translate([2 + 1.5, width - 4.2, 0]) {
          rotate(a=90, v=[0,0,1]) {
               cube([4.2, 1.5, height+1], center=false);
          }
     }

     // cutout6
     translate([length - 2, width - 4.2, 0]) {
          rotate(a=90, v=[0,0,1]) {
               cube([4.2, 1.5, height+1], center=false);
          }
     }

     // cutout7
     translate([2 + 1.5, 0, 0]) {
          rotate(a=90, v=[0,0,1]) {
               cube([4.2, 1.5, height+1], center=false);
          }
     }

     // cutout8
     translate([length - 2, 0, 0]) {
          rotate(a=90, v=[0,0,1]) {
               cube([4.2, 1.5, height+1], center=false);
          }
     }

     // cutout9
     translate([0.8, (width/2) - (42.1/2), 0]) {
          rotate(a=90, v=[0,0,1]) {
               cube([42.1, 0.8, height+1], center=false);
          }
     }

     // cutout10
     translate([length, (width/2) - (42.1/2), 0]) {
          rotate(a=90, v=[0,0,1]) {
               cube([42.1, 0.8, height+1], center=false);
          }
     }

}
