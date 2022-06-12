$fn = 50;

difference(){
     cylinder(2, d=5, true);
     translate([0,0,-1]){
          cylinder(4, d=3.5, true);
     }
}
