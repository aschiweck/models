$fn = 50;

height=10.0;
width=2.5;
wall=1.5;

difference(){
     cylinder(height, d=width+(2*wall), true);
     translate([0,0,-1]){
          cylinder(height+2, d=width, true);
     }
}
