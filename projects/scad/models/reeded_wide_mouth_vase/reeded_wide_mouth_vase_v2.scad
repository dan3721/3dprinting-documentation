/*
* Reeded Wide Mouth Vase (v1). 

* 1/5/2020
* dan.bush@techentourage.com
*/
//use <SCADLIBB/bullet.scad>;

include <BOSL/constants.scad>
//use <BOSL/shapes.scad>
use <BOSL/beziers.scad>
use <BOSL/transforms.scad>

$fn=200;

module reeded_wide_mouth_vase() {
  // body
  width=40;
  height=200;
//  linear_extrude(height = height, twist = 120, slices = height, convexity = 10, scale=[3,5]) {
    hump_diameter=width/3;
    circle(d=width-hump_diameter/2);
    num_humps = 360/8;
    for (i =[0:num_humps]) {
      rotate(a=i*30) {
        translate([(width-hump_diameter)/2,0,0]) {
          circle(d=hump_diameter);
        }
      }
    }
//  }
  // base
//  scale([1,1.5,1]) bullet(100,20);
}

// base does not work in vase mode (too flat resulting in seaperated lines!)



path = [ [0, 0, 0], [33, 33, 33], [66, -33, -33], [100, 0, 0] ];
extrude_2d_shapes_along_bezier(path) {
 reeded_wide_mouth_vase();
 //scircle(d=8);
}

//path = [ [0, 0, 0], [33, 33, 33], [66, -33, -33], [100, 0, 0] ];
//extrude_2d_shapes_along_bezier(path) difference(){
//    circle(r=10);
//    fwd(10/2) circle(r=8);
//}




