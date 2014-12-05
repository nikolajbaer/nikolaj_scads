
od=8;
id=6;
h=10;
js=h/2;
$fa=20;
arml=20;
t=0.4; // tolerance of joint

rotate([0,0,45]){
    union(){
        difference(){
            cylinder(h=h,d=od,center=true);
            cylinder(h=js,d=id,center=true);
            for(i=[0:2]){
                rotate([0,180*i,0]){
                    translate([0,0,js]){
                        cylinder(h=js,d1=id,d2=0,center=true);
                    }
                }
            }
            translate([0,0,0]){
                cube([od+1,od+1,h/4],center=true);

            }
        }
        translate([0,-(id/2+arml/2),0]){
            cube([od/2,arml,od/2],center=true);
        }
    }

    rotate([0,0,90]){
        union(){
            cylinder(h=js-(t*2),d=id-(t*2),center=true);
            for(i=[0:2]){
                rotate([0,180*i,0]){
                    translate([0,0,js-t]){
                        cylinder(h=js,d1=id-(t*2),d2=0,center=true);
                    }
                }
            }
            translate([0,(arml/2),0]){
                cube([js,arml,js/2],center=true);
            }
        }
    }
}