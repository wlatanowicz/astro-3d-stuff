include <threads.scad>

h = 40;  // length of the extension (does not include 5mm of external thread at the end)

$fn=360;

difference() {
    union(){
        cylinder(h, d=46);
        translate([0,0,h]){
            metric_thread(42, 0.75, 5, internal=false);
        }
        cylinder(8, d=47, $fn=16);
    }
    union(){
       rotate_extrude($fn=200){
        polygon( points=[[0,6],[21.5,6],[21.5,h-2],[19,h], [19,h+5], [0,h+5]] );
       }
       metric_thread(42.5, 0.75, 6, internal=true);
    }
};

