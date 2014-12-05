// Box with lid
x=20; // weidth (horiztonal )
y=20; // height (horizontal
z=20; // depth
a=2; // wall thickness
t=0.3; // tolerane of lid
ld=2; // lid depth
lh=ld + a;
th=1;

translate([0,0,z/2]){
    // box
    union(){
        difference(){
            cube([x,y,z],center=true);
            translate([0,0,a]){
                cube([x-(a*2),y-(a*2),z],center=true);
            }
        }

        
        for(i=[0:4]){
            rotate([0,0,90*i]){
                translate([0,-y/2-0.1,0]){
                    rotate([90,0,0]){
                        linear_extrude(height=th,center=true){
                            text("H",halign="center",valign="center");
                        }
                    }
                }
            }
        }
    }
}    
    // lid
translate([x*2,0,lh/2]){
    union(){
        cube([x,y,lh],center=true);
        translate([0,0,lh-a]){
            cube([x-(a*2)-(t*2),y-(a*2)-(t*2),a],center=true);
        }
    }
}

