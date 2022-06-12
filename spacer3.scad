$fn = 50;

difference(){
     cylinder(1, d=5.5, true);
     translate([0,0,-1]){
          cylinder(3, d=3.5, true);
     }
}
