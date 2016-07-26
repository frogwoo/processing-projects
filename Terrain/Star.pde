class Star {
  PVector location;
  float size;
  float sizeChangeSpeed;
  float maxSize;
  float minSize;
  
  Star(PVector loc) {
    location = loc;
    
    size = random(1,7);
    sizeChangeSpeed = random(0.1,0.5);
    maxSize = size  * 2;
    minSize = size / 2;
  }
  
  void pulsate() {
    // slowly change size of point
    size += sizeChangeSpeed;
    if (size > maxSize || size < minSize) {
      sizeChangeSpeed *= -1;
      size += sizeChangeSpeed;
    }
  }
  
  void display() {
    strokeWeight(size);
    point(location.x,location.y,location.z);
  }
}