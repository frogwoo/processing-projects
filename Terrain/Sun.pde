class Sun {
  PVector location = new PVector(0,0-9000);
  float rotation = 0;
  float rotationSpeed = 0.4;
  
  void show() {
    pushMatrix();
    // rotate to give spinning effect
    rotateX(radians(rotation));
    
    translate(location.x,location.y,location.z);
    fill(#F7E6A7,150);
    sphere(300);
    // apply sunlight
    directionalLight(80, 20, 20, 0,1,0);
    
    rotation += rotationSpeed;
    popMatrix();
  }
    
}