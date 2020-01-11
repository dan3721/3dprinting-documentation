/*
* Candy Dish 1 (v1). 

* 1/5/2020
* dan.bush@techentourage.com
*/

$fn=60;

module bullet(width, height) {
  // body
  scale_height=height/width*2;
  echo("scale_height:", scale_height);
  difference() {
    scale([1,1,scale_height]) {
      sphere(d=width);
    }
    // cut other half
    translate([0,0,height/-2]) {
      cube([width,width,height], true);
    }
  }
  
  // check
//  translate([width,width, height/2]) {
//    cube([width,width,height], true);
//  }
}

module ring(offset, radius) {
  rotate_extrude(angle = 360, convexity = 10) {
    translate([offset, 0, 0]) {
      circle(radius);
    }
  }
}

module top(width) {
  // topper
  translate([0,0,65]) topper();
  // top bullet
  translate([0,0,10]) bullet(width, 60);
  // flange
  translate([0,0,-0]) cylinder(h=10,d1=width-5,d2=width-1);
}

module bottom(width) {
  // bottom
  bullet(width, 100);
}

// total height = 40
module topper() {
  translate([0,0,12]) {
    bullet(18,30);
    translate([0,0,5]) ring(9, 3);
    rotate(a=[180,0,0]) {
      bullet(18,17);
    }
  }
}

module stem (stem_height, stem_width, radis) {
  cut_offset=stem_width/2+radis;
  difference() {
    cylinder(d=cut_offset*2, h=stem_height/2, center=true);
    scale([1,1,3]) {
      rotate_extrude(convexity = 10) {
        translate([cut_offset, 0, 0]) circle(r = radis);
      }
    }
  }
}

module vase() {
  width=120;
  translate([0,0,130]) top(120);
  translate([0,0,120]) rotate([180,0,0]) bottom(width);
  // stem
  translate([0,0,14]) stem(50,30,5);
  // foot
  bullet(80,6);
}

vase();




//translate([0,0,0]) cube([14,14,25], true);






