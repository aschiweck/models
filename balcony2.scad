$fn=50;

height = 20.0;
/* diameter = 43.0; */
wall = 3.0;
/* gap = 20.0; */
spacex = 120.0;
spacey = 50.0;
screw = 5.0;
roundoff = 2.0;

minkowski() {
     sphere(r=roundoff);
     cube([spacey,height,wall],center=false);
}

translate([-height,0,0]) {
     minkowski() {
          sphere(r=roundoff);
          cube([height,spacex+height,wall],center=false);
     }
}


/* difference() { */

/*      // spike */
/*      /\* translate([-space-(diameter/2)+wall,-(wall/2),0]) { *\/ */
/*           minkowski() { */
/*                sphere(r=roundoff); */
/*                cube([space,height,wall],center=false); */
/*           } */
/*      /\* } *\/ */

     /* // rope */
     /* translate([-space-(diameter/2)+(space/10),20,height/2]) { */
     /*      hull() { */
     /*           rotate(a=90, v=[1,0,0]) { */
     /*                cylinder(h=40, r=screw/2, center=false); */
     /*           } */
     /*           translate([5,0,0]) { */
     /*                rotate(a=90, v=[1,0,0]) { */
     /*                     cylinder(h=40, r=screw/2, center=false); */
     /*                } */
     /*           } */
     /*      } */
     /* } */

/* } */

/* difference() { */

/*      difference() { */

/*           // holder */
/*           union() { */

/*                // spike */
/*                translate([-space-(diameter/2)+wall,-(wall/2),0]) { */
/*                     minkowski() { */
/*                          sphere(r=roundoff); */
/*                          cube([space,wall,height],center=false); */
/*                     } */

/*       /\*               polyhedron( *\/ */
/*  /\*  points=[ [0,0,0],[0,-10,0],[-10,-10,0],[-10,0,0], // the four points at base *\/ */
/*  /\*           [-10,0,10]  ],                                 // the apex point *\/ */
/*  /\*  faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],              // each triangle side *\/ */
/*  /\*              [1,0,3],[2,1,3] ]                         // two triangles for square base *\/ */
/*  /\* ); *\/ */

/*                } */
/*                // clamp */
/*                minkowski() { */
/*                     translate([0,-(diameter/2),0]) { */
/*                          sphere(r=roundoff); */
/*                     } */
/*                     translate([0,(diameter/2),0]) { */
/*                          /\* cylinder(h=height, r=diameter/2, center=false); *\/ */
/*                          cylinder(h=height, r=(diameter/2)+wall, center=false); */
/*                     } */
/*                } */
/*                // clip */
/*                minkowski() { */
/*                     translate([0,-(gap+2*wall)/2,0]) { */
/*                          cube([(diameter/2)+10+5,gap+2*wall,height],center=false); */
/*                     } */
/*                     sphere(r=roundoff); */
/*                } */
/*           } */

/*           // hole */
/*           translate([0,0,-roundoff]) { */
/*                /\* cylinder(h=height+2*roundoff, r=(diameter-(wall*2))/2, center=false); *\/ */
/*                cylinder(h=height+2*roundoff, r=diameter/2, center=false); */
/*           } */

/*      } */

/*      /\* // gap *\/ */
/*      /\* translate([(diameter/2)-((wall*2)/2)-1.5,-(gap/2),-roundoff]) { *\/ */
/*      /\*      cube([(wall*2)/2+10,gap,height+2*roundoff],center=false); *\/ */
/*      /\* } *\/ */
/*      // gap */
/*      translate([0,-(gap/2),-roundoff]) { */
/*           cube([diameter/2+wall+roundoff+15,gap,height+2*roundoff],center=false); */
/*      } */

/*      // screw */
/*      translate([(diameter/2)+wall+3,20,height/2]) { */
/*           rotate(a=90, v=[1,0,0]) { */
/*                cylinder(h=40, r=screw/2, center=false); */
/*           } */
/*      } */

/*      // rope */
/*      translate([-space-(diameter/2)+(space/10),20,height/2]) { */
/*           hull() { */
/*                rotate(a=90, v=[1,0,0]) { */
/*                     cylinder(h=40, r=screw/2, center=false); */
/*                } */
/*                translate([5,0,0]) { */
/*                     rotate(a=90, v=[1,0,0]) { */
/*                          cylinder(h=40, r=screw/2, center=false); */
/*                     } */
/*                } */
/*           } */
/*      } */

/* } */
