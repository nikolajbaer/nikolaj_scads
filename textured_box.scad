

x=40;
y=40;
z=40;
a=2;
inset=2;
inlay=2;

union(){
    difference(){
        cube([x,y,z],center=true);
        for(i=[0:4]){
            rotate([0,0,90*i]){
                translate([0,z/2,0]){
                    // subtract inlay
                    cube([x-(inset*2),inlay,z-(inset*2)],center=true);
                }
            }
        }
        translate([0,0,z/2+a]){
            cube([x-(a*2),y-(a*2),z],center=true);
        }
    }
    
    for(i=[0:4]){
        rotate([0,0,90*i]){

                translate([0,z/2-inlay/2,0]){
                    rotate([-90,0,0]){
                        scale([(x-(inset*2))/32+0.1,(y-(inset*2))/32+0.1,0.005]){
                            surface(file="data/texture.png",center=true);
                        }
                    }
                }

        }
    }
}

