include <MCAD/gears.scad>;

difference(){
    translate([0,0,2.5]){
        linear_extrude(height=5, center=true, convexity=10) {
            gear(number_of_teeth=17,circular_pitch=200);
        }
    }
    translate([0,0,-1]){
        cylinder(h=20,r=5,center=true);
    }
}
