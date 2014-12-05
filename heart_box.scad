
x=20;
y=20;
z=5;
a=1.5;
t=0.4;
ts=1; // text size
floral_heart="\u2766";
heart="\u2665";
f="Arial Unicode MS";

module heart(l,w,h,shrink=1.0){
    linear_extrude(height=h,scale=shrink){
        scale([l,w,0]){
            text(heart,font=f,halign="center",valign="center",size=1);
        }
    }
}


module heartbox(name){
    //Reference
    translate([10,10,10]){
    //    cube([10,10,10]);
    }

    // box
    difference(){
        heart(x,y,z);
        translate([0,0,a]){
            heart(x-a*2,y-a*2,z);
        }
        translate([0,0,z]){
            mirror([0,0,1]){
                heart(x,y,a,0.8);
            }
        }
    }

    // Top
    translate([x*1.5,0,a]){
        mirror([0,0,1]){
            union(){
                heart(x+t*2,y+t*2,a,0.8);
                translate([0,3,0]){
                    mirror([0,0,1]){
                        linear_extrude(height=ts,scale=0.8){
                            text(name,font=f,halign="center",valign="center",size=8);
                        }
                    }
                }
        //        translate([0,0,a]){
        //            heart(x-a*2-t*2,y-a*2-t*2,a,shrink=0.8);
        //        }
            }
        }
    }
}

heartbox("H");
translate([0,y*1.5,0]){
    heartbox("B");
}