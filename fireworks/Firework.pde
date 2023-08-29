class Fireworks {
  int fireworkDensity;
  float degreeRotation;
  float posX;
  float posY;
  Particles[] fire;

  Fireworks(int fiDen, float vel, float accel) {
    fireworkDensity = fiDen;
    fire = new Particles[fireworkDensity];
    degreeRotation = (360/fireworkDensity);
    for (int i = 0; i < fire.length; i++) {
      fire[i] = new Particles(i*degreeRotation, vel, accel);
    }
    posX = random(100, width-100);
    posY = random(100, height-100);
  }

  void fireworksShow() {
    for (int i = 0; i < fire.length; i++) {
      pushMatrix();
      translate(posX, posY);
      fire[i].explode();
      fire[i].display();
      fire[i].fall();
      popMatrix();
    }
  }

}
