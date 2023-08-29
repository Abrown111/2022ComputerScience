class Particles {
  float angle;
  float speed;
  float gravity;
  boolean momentumIsDone = true;
  int t;
  float x = 0;
  float y = 0;
  float ySpeed = 1;
  int xGrowth = 1;
  color fireworkColor;
  boolean fireworkIsDone = false;
  float vel = 5;
  float weight = 8;


  Particles(float theta, float velocity, float grav) {
    strokeWeight(weight);
    fireworkColor = color(random(100, 400), random(100, 400),  random(100, 400));
    stroke(fireworkColor);
    angle = radians(theta);
    speed = velocity;
    gravity = grav;
  }

  void explode() {
    if (momentumIsDone) {
      strokeWeight(5);
      t+=speed;
      if(vel >= 2.5){
        speed = speed - 0.15;
        vel = speed - 0.15;
      }
      x = t*cos(this.angle);
      y = -t*sin(this.angle);
      
      
      if (dist(0, 0, x, y)>=random(100, 300)||!momentumIsDone) {
        momentumIsDone = false;
        fireworkIsDone = true;
      }
    }
  }

  void fall() {
    if (dist(0, 0, x, y)>=random(100, 300)||!momentumIsDone) {
      momentumIsDone = false;
      y = y + ySpeed;
      ySpeed = ySpeed + gravity;
      //fireworkColor = color(hue(fireworkColor), saturation(fireworkColor), brightness(fireworkColor - 10));
      if(weight>=0.2){
        weight -= 0.2;
      }
      strokeWeight(weight);
      
    }
  }

  void display() {
    point(x, y);
  }
}
