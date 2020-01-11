/*
* Ring (v1). 
*
* 1/5/2020
* dan.bush@techentourage.com
*/
$fn=60;

module ring(offset_from_center, radius) {
  rotate_extrude(angle = 360, convexity = 10) {
    translate([offset_from_center, 0, 0]) {
      circle(radius);
    }
  }
}

ring(10,1);
ring(20,2);
ring(30,3);