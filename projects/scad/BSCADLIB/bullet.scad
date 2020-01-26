/*
* Bullet (v1). 
*
* 1/5/2020
* dan.bush@techentourage.com
*/
//$fn=30;

module bullet(width, height) {
  // body
  scale_height=height/width*2;
  difference() {
    scale([1,1,scale_height]) {
      sphere(d=width);
    }
    // cut other half
    translate([0,0,height/-2]) {
      cube([width,width,height], true);
    }
  }
}
  
bullet(10,20);

// hollow by dimention
translate([20,0,0]) {
  difference() {
    bullet(10,20);
    bullet(9,19);
    translate([-5,-5,0]) cube([10,5,20]); // slice open to see result
  }
}

// hollow by scale
translate([30,0,0]) {
  difference() {
    bullet(10,20);
    scale([.9,.95,.952]) {
      bullet(10,20);
    }
    translate([-5,-5,0]) cube([10,5,30]); // slice open to see result
  }
}
