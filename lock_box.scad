
l=20;
w=20;
h=20;
a=2; // wall width 
t=0.8; // tolerance of joint

module box_side(l,w,h,a,clasp){
    difference(){
        union(){
            translate([t/2,0,0]){
                difference(){
                    linear_extrude(height=h){
                        polygon(points=[[0,0],[l,0],[l,w]]);
                    }
                    translate([-a,a,a]){
                        linear_extrude(height=h-(a*2)){
                            polygon(points=[[0,0],[l,0],[l,w]]);
                        }
                    }
                }
                translate([0,0,h/4]){
                    if(clasp=="M"){
                        cube([a*2.5,a*2,h/2]);
                    }
                    if(clasp=="F"){
                        cube([a*3,a*2+t,h/2]);
                    }
                }
            }
            if(clasp=="M"){
   
                translate([0,a,h/2]){
                    cube([a*2+t,a*2,a*2],center=true);
                    hull(){
                        translate([-a-t,0,a]){
                            sphere(r=a,$fn=20);
                        }
                        translate([-a-t,0,-a]){
                            sphere(r=a,$fn=20);
                        }
                    }
                }

            }       
        }
        if(clasp=="F"){
            translate([t,a,h/2]){
                cube([a*4,a*3+t*2,a*3],center=true);
                translate([a,0,a]){
                    sphere(r=a+t,$fn=20);
                }
                translate([a,0,-a]){
                    sphere(r=a+t,$fn=20);
                }
            }
        }
    }
}

rotate([90,0,0]){
    box_side(l,w,h,a,"M");
    mirror([1,0,0])
        box_side(l,w,h,a,"F");
}