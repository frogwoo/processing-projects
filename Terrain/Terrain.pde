import peasy.*;
import peasy.org.apache.commons.math.*;

PeasyCam cam;

int starAmount = 5000;
Star[] stars;

PerlinFloor floor;
Sun sun;

void setup() {
  size(displayWidth,displayHeight,P3D);

  // setup star array + floor + sun
  stars = new Star[starAmount];
  floor = new PerlinFloor();
  sun = new Sun();
  
  // loop through stars + assign location
  // location values weird + arbitrary
  int maxPos = ((width * 9) / 2) + 17100 * 2;
  for (int i = 0; i < starAmount; i++) {
    stars[i] = new Star(new PVector(random(-maxPos,maxPos),random(-maxPos,maxPos),random(width * 2,width * 4)));
  }
 
   // setup camera
  cam = new PeasyCam(this,0,0,0, 1000);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  cam.setSuppressRollRotationMode();
  
  
}

void draw() {
  background(0);
  
  // show sun + add general light to stop complete darkness
  sun.show();
  pointLight(20, 20, 20, width/2, height/2, 0);
  
  // add motion effect + raise up perspective
  translate(floor.flying,600);
  // tilt camera right way up (not below floor)
  rotateX(PI / 2.2);
  
  // loop through stars, increase/decrease size, then display
  stroke(255);
  pushMatrix();
  rotateX(radians(sun.rotation - 180));
  for (int i = 0; i < starAmount; i++) {
    stars[i].pulsate();
    stars[i].display();  
  }
  popMatrix();
  
  noStroke();
  fill(255);
  floor.run();
}