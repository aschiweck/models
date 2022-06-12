$fn = 50;

module parametric_star(N=5, h=3, ri=15, re=30) {

//-- Calculate and draw a 2D tip of the star
//-- INPUT:
//-- n: Number of the tip (from 0 to N-1)
     module tipstar(n) {
          i1 =  [ri*cos(-360*n/N+360/(N*2)), ri*sin(-360*n/N+360/(N*2))];
          e1 = [re*cos(-360*n/N), re*sin(-360*n/N)];
          i2 = [ri*cos(-360*(n+1)/N+360/(N*2)), ri*sin(-360*(n+1)/N+360/(N*2))];
          polygon([ i1, e1, i2]);
     };

     //-- Draw the 2D star and extrude

     //-- The star is the union of N 2D tips.
     //-- A inner cylinder is also needed for filling
     //-- A flat (2D) star is built. The it is extruded
     linear_extrude(height=h)
          union() {
          for (i=[0:N-1]) {
               tipstar(i);
          }
          rotate([0,0,360/(2*N)]) circle(r=ri+ri*0.01,$fn=N);
     }
};




linear_extrude(4)
    text("Jonah",
         spacing=0.75,
         size=15,
         font="Liberation Sans:style=Bold");
parametric_star(N=5, h=3, ri=6/2, re=6);
translate([40, 15, 0])
parametric_star(N=5, h=2, ri=6/2, re=6);

translate([0, 30, 0]) {
linear_extrude(4)
    text("Hanna",
         spacing=0.75,
         size=15,
         font="Liberation Sans:style=Bold");
parametric_star(N=5, h=3, ri=6/2, re=6);
translate([36, 13.5, 0])
parametric_star(N=5, h=2, ri=6/2, re=6);
}

translate([0, 60, 0]) {
linear_extrude(4)
    text("L",
         spacing=0.75,
         size=15,
         font="Liberation Sans:style=Bold");
translate([8, 0, 0]) linear_extrude(4)
    text("ou",
         spacing=0.75,
         size=15,
         font="Liberation Sans:style=Bold");
parametric_star(N=5, h=3, ri=6/2, re=6);
translate([30, 12, 0])
parametric_star(N=5, h=2, ri=6/2, re=6);
}

translate([0, 90, 0]) {
linear_extrude(4)
    text("Noa",
         spacing=0.75,
         size=15,
         font="Liberation Sans:style=Bold");
parametric_star(N=5, h=3, ri=6/2, re=6);
translate([30, 13, 0])
parametric_star(N=5, h=2, ri=6/2, re=6);
}

translate([0, 120, 0]) {
linear_extrude(4)
    text("Ant",
         spacing=0.75,
         size=15,
         font="Liberation Sans:style=Bold");
translate([24, 0, 0]) linear_extrude(4)
    text("on",
         spacing=0.75,
         size=15,
         font="Liberation Sans:style=Bold");
parametric_star(N=5, h=3, ri=6/2, re=6);
translate([37, 14, 0])
parametric_star(N=5, h=2, ri=6/2, re=6);
}

translate([0, 150, 0]) {
linear_extrude(4)
    text("Fel",
         spacing=0.7,
         size=15,
         font="Liberation Sans:style=Bold");
translate([19, 0, 0]) linear_extrude(4)
    text("i",
         spacing=0.7,
         size=15,
         font="Liberation Sans:style=Bold");
translate([21, 0, 0]) linear_extrude(4)
    text("citas",
         spacing=0.7,
         size=15,
         font="Liberation Sans:style=Bold");
parametric_star(N=5, h=3, ri=6/2, re=6);
translate([36, 16, 0])
parametric_star(N=5, h=2, ri=6/2, re=6);
}

translate([0, 180, 0]) {
linear_extrude(4)
    text("Mat",
         spacing=0.8,
         size=15,
         font="Liberation Sans:style=Bold");
translate([26, 0, 0]) linear_extrude(4)
    text("ti",
         spacing=0.75,
         size=15,
         font="Liberation Sans:style=Bold");
parametric_star(N=5, h=3, ri=6/2, re=6);
translate([35, 14.5, 0])
parametric_star(N=5, h=2, ri=6/2, re=6);
}
