$fn = 50;

length = 118.75;
width = 157.5;
height = 30;
line = 0.4;
rabbet = 10;

/* b/br */
/* union() { */
/*      difference() { */
/*           cube([length, width, height], false); */
/*           translate([length-(rabbet/2), 30, 0]) { */
/*                cube([rabbet, rabbet, height], false); */
/*           } */
/*      } */
/*      translate([-(rabbet/2)+line, 30+line, 0]) { */
/*           cube([rabbet-(2*line), rabbet-(2*line), height], false); */
/*      } */
/*      translate([length-30-rabbet+line, width-(rabbet/2)+line, 0]) { */
/*           cube([rabbet-(2*line), rabbet-(2*line), height], false); */
/*      } */
/* } */

/* bl */
/* union() { */
/*      difference() { */
/*           cube([length, width, height], false); */
/*           translate([length-5, 30, 0]) { */
/*                cube([rabbet, rabbet, height], false); */
/*           } */
/*           translate([-(rabbet/2), 30, 0]) { */
/*                cube([rabbet, rabbet, height], false); */
/*           } */
/*      } */
/*      translate([30+line, width-(rabbet/2)+line, 0]) { */
/*           cube([rabbet-(2*line), rabbet-(2*line), height], false); */
/*      } */
/* } */

/* t */
/* union() { */
/*      difference() { */
/*           cube([length, width, height], false); */
/*           translate([length-(rabbet/2), 52.5, 0]) { */
/*                cube([rabbet, rabbet, height], false); */
/*           } */
/*           translate([length-30-rabbet, -(rabbet/2), 0]) { */
/*                cube([rabbet, rabbet, height], false); */
/*           } */
/*      } */
/*      translate([-(rabbet/2)+line, 52.5+line, 0]) { */
/*           cube([rabbet-(2*line), rabbet-(2*line), height], false); */
/*      } */
/* } */

/* tr */
/* union() { */
/*      difference() { */
/*           union() { */
/*                cube([length, width-20, height], false); */
/*                hull() { */
/*                     translate([length-rabbet, width-(2*rabbet), 0]) { */
/*                          cube([rabbet, rabbet, height], false); */
/*                     } */
/*                     translate([length-rabbet, width-rabbet, 0]) { */
/*                          cylinder(height, r=rabbet, false); */
/*                     } */
/*                     translate([0, width-(2*rabbet), 0]) { */
/*                          cube([rabbet, 2*rabbet, height], false); */
/*                     } */
/*                } */
/*           } */
/*           translate([length-(rabbet/2), 52.5, 0]) { */
/*                cube([rabbet, rabbet, height], false); */
/*           } */
/*           translate([length-30-rabbet, -(rabbet/2), 0]) { */
/*                cube([rabbet, rabbet, height], false); */
/*           } */
/*      } */
/*      translate([-(rabbet/2)+line, 52.5+line, 0]) { */
/*           cube([rabbet-(2*line), rabbet-(2*line), height], false); */
/*      } */
/* } */

/* tl */
union() {
     difference() {
          union() {
               cube([length, width-20, height], false);
               hull() {
                    translate([0, width-(2*rabbet), 0]) {
                         cube([rabbet, rabbet, height], false);
                    }
                    translate([rabbet, width-rabbet, 0]) {
                         cylinder(height, r=rabbet, false);
                    }
                    translate([length-rabbet, width-(2*rabbet), 0]) {
                         cube([rabbet, 2*rabbet, height], false);
                    }
               }
          }
          translate([length-(rabbet/2), 52.5, 0]) {
               cube([rabbet, rabbet, height], false);
          }
          translate([30, -(rabbet/2), 0]) {
               cube([rabbet, rabbet, height], false);
          }
          translate([-(rabbet/2)+line, 52.5+line, 0]) {
               cube([rabbet-(2*line), rabbet-(2*line), height], false);
          }
     }
}

/* union() { */
/*      difference() { */
/*           cube([length, width, height], false); */
/*           translate([length-(rabbet/2), 52.5, 0]) { */
/*                cube([rabbet, rabbet, height], false); */
/*           } */
/*           translate([length-30-rabbet, -(rabbet/2), 0]) { */
/*                cube([rabbet, rabbet, height], false); */
/*           } */
/*           translate([-(rabbet/2), 52.5, 0]) { */
/*                cube([rabbet, rabbet, height], false); */
/*           } */
/*      } */
/* } */
