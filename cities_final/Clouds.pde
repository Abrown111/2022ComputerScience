class Clouds { //using class to create clouds can make them function like objects
  float translationX;
  float translationY;
  float z;
  boolean isStormy = false; // boolean not utilized
  float cloudColor; 
  float widths = 6;
  float sphereSize = 20;

  Clouds(float x, float y, float zCoords) {
    translationX = x;
    translationY = y;
    z = zCoords;
    if (isStormy) {
      cloudColor = 90;
    } else {
      cloudColor = 300;
    }
  }

  void createCloud(float bright) {
    if (this.z >= -450) {
      z--;
      pushMatrix();
      translate(0, 0, z);
      for (int x = 0; x < sphereSize*widths; x+=sphereSize) { //generation of clouds using placement of spheres
        pushMatrix();
        translate((translationX-(sphereSize*widths/2))+x, translationY);
        fill(bright);
        sphere(sphereSize);
        popMatrix();
        if (sphereSize <= x && x < sphereSize*widths-sphereSize) {
          pushMatrix();
          fill(bright);
          translate((translationX-(sphereSize*widths/2))+x, translationY-sphereSize);
          sphere(sphereSize);
          popMatrix();
        }
      }
      popMatrix();
    }
  }
}
