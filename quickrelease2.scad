$fn=50;

diameter=5;
height=8;
wall=2;



difference(){

     union(){
          translate([0, 0, height+wall]) {
               sphere(d=diameter+wall);
          }
          cylinder(h=height+wall, d=diameter+wall, center=false);
     }
     cylinder(h=height, d=diameter, center=false);

}
