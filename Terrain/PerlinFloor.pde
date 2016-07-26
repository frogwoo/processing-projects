class PerlinFloor {
  int density = 100;
  int floorWidth = width * 9;
  int columnAmount;

  float[][] zHeights;
  float flying = 0;
  float noiseIncrement = 0.15;

  PerlinFloor() {
      columnAmount = floorWidth / density;
      zHeights = new float[columnAmount][columnAmount];
 }
 
 void grabZHeights() {
  // loop through and grab heights of points
  float yoff = flying;
  for (int y = 0; y < columnAmount; y++) {
    float xoff = 0;
    for (int x = 0; x < columnAmount; x++) {
      zHeights[x][y] =  map(noise(xoff,yoff),0,1,-270,270); 
      xoff += noiseIncrement;
    }
    yoff += noiseIncrement;
   }
 }
 
 void run() {
  translate(-floorWidth / 2,-floorWidth / 2);
  grabZHeights();
  for (int y = 0; y < columnAmount - 1; y ++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < columnAmount; x ++) {
      vertex(x*density, y*density, zHeights[x][y]);
      vertex(x*density, (y+1)*density, zHeights[x][y+1]);
    }
    endShape();
  }  
  flying -= 0.2;
 }
}