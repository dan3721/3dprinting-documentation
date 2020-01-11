/*
* Heart Vase (v1).
*
* 1/8/2020
* dan.bush@techentourage.com
*/

include <BOSL/constants.scad>
include <dotSCAD-2.1/src/dotSCAD.scad>

use <BOSL/shapes.scad>
use <BOSL/beziers.scad>
use <BOSL/transforms.scad>

$fn=100; //200

module heart(height) {
  xflip_copy(){
      bez = [ [0,20], [11,28], [19,15], [10,5], [0,0]];
      closed = bezier_close_to_axis(bez, N=4);
      rotate([0,0,0]) {
//      trace_bezier(closed, size=1, N=4);
      linear_extrude(height=height) bezier_polygon(bez, splinesteps=128, N=4);
        
//      rotate_extrude_bezier(bez, splinesteps=32, $fn=180, N=4, angle=10);

//      path = [ [0, 0, 0], [33, 33, 33], [66, -33, -33], [100, 0, 0] ];
//      extrude_bezier_along_bezier(bez, path, pathsteps=32, bezsteps=16); 

    }
  }
}
//heart(5);

//module heart2() {
//
//  bez = [ [0,20], [11,28], [19,15], [10,5], [0,0] ];
//  closed = bezier_close_to_axis(bez, N=4);
//  //trace_bezier(closed, size=1, N=4);
//  bez2 = [ [0,20], [-11,28], [-19,15], [-10,5], [0,0] ];
//
//  union() {
//    polygon(bezier_polyline(bez, N=4, splinesteps=64));
//    polygon(bezier_polyline(bez2, N=4, splinesteps=64));
//  }
//}
//path = [ [0, 0, 0], [33, 33, 33], [66, -33, -33], [100, 0, 0] ];
//extrude_2d_shapes_along_bezier(path, splinesteps=16) {
// heart2();
//}

//module lid() {
//  intersection() {
//    heart(10);
//    translate([0,14,-70]) sphere(d=150, $fn=300);
//  }
//}
////translate([30,0,0]) lid();

module lid2() {
  height=5;
  difference() {
    intersection() {
      heart(height);
      translate([-50,15,-55]) rotate([0,90,0]) cylinder(d=120, h=100, $fn=300);
    }
    // cut
    translate([0,.9,-1]) scale(.9) {
      intersection() {
        heart(height);
        translate([-50,15,-55]) rotate([0,90,0]) cylinder(d=120, h=100, $fn=300);
      }
    }
  }
}

module body() {
    heart(10);
    // cut
//    translate([0,1.5,10]) scale(.85) {
//        heart(12);
//    }
}

// first box attempt ; cant work out the lid/box joint
translate([0,0,20]) lid2(); 
body();


// hollow_out : 3 concentric hearts
module heart2() {
  hollow_out(shell_thickness = 1) {
    bez = [ [0,20], [11,28], [19,15], [10,5], [0,0], [-10,5], [-19,15], [-11,28], [0,20]];
    bezier_polygon(bez, splinesteps=128, N=4);
  }
}
translate([30,0,0]) {
  scale([.9,.9,1]) heart2();
  rotate([0,33,0]) scale([.8,.8,1]) heart2();
  rotate([0,66,0]) scale([.7,.7,1]) heart2();
}

// box_extrude
translate([60,0,0]) {
box_extrude(height = 10, shell_thickness = 1) 
    heart2();
}






  
  


