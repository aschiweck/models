$fn = 50;

difference(){
     cylinder(1.5, d=4, true);
     translate([0,0,-1]){
          cylinder(3, d=2, true);
     }
}
