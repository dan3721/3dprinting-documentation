/*
* Simple elegant pencil holder (v1). 

* 12/31/2019
* dan.bush@gmail.com
*/

$fn=120;

module pencil_holder(height, width) {
  // base
  base_height=12;
  offset=12;
  rotate([180,0,0]) {
    linear_extrude(height = base_height, scale = 1.1) {
      offset(r = offset) {
        square(width-offset, center = true);
      }
    }
  }
  // body
  linear_extrude(height = height-base_height, twist = 120, slices = 120) {
    difference() {
      offset(r = offset) {
        square(width-offset, center = true);
      }
    }
  }
}

// animation
//$vpt= [0, 0, 50];
//$vpr = [40, -0, 360 * $t];
//$vpd = 400;

translate ([0,0,10]) pencil_holder(110, 60);
