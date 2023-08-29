int boxSize = 7;
float xChange = 0;
float zChange = 0;
int gridAmount = 5;
int citySize = 600;
float orbitTime = 20;
float distSun  = 5000;
color sun = #FFF81F;
float sizeOfSun;
float b = 50;
boolean lock = false;
boolean night = false;
ArrayList<Clouds> fog = new ArrayList<Clouds>();

void setup() {
  frameRate(60);
  fill(139, 122, 122);
  fullScreen(P3D);
  noStroke();
}


void draw() {
  colorMode(HSB); //color mode change to darken screen based off time
  if (b < 75 && frameCount % 30 == 10) {
    night = true; //used for debugging
  }
  noStroke();
  if (b <= 0 || lock) { // function to alter color of background
    lock = true; //lock triggers at night and in the morning
    b+=0.16;
    if (b >= 200) {
      lock = false;
    }
  } else if (b >= 200 || !lock) {
    b-=0.16;
    lock = false;
  }
  background(150, 100, b);
  colorMode(RGB);
  lights();
  pushMatrix();
  rotateZ(PI/4);
  pointLight(red(sun), green(sun), blue(sun), width/2, yRotationOfSun(distSun-100, orbitTime), -xRotationOfSun(distSun-100, orbitTime)); //color perpective for sun
  pointLight(255, 255, 255, width/2, yRotationOfSun(distSun-100, orbitTime), -xRotationOfSun(distSun-100, orbitTime));
  fill(sun);
  translate(width/2, yRotationOfSun(distSun, orbitTime), -xRotationOfSun(distSun, orbitTime));
  sphere(100); //the sun
  popMatrix();
  if (keyPressed && key == 'w') { //movement commands
    zChange -= boxSize;
  }
  if (keyPressed && key == 'a') {
    xChange -= boxSize;
  }
  if (keyPressed && key == 's') {
    zChange += boxSize;
  }
  if (keyPressed && key == 'd') {
    xChange += boxSize;
  }
  for (int x = 450; x<450+citySize; x+=boxSize) { 
    for (int z = 240; z<240+citySize; z+=boxSize) {
      pushMatrix();
      translate(x, height, z);
      fill(25);
      box(boxSize, 900*noise(x + xChange, z + zChange), boxSize); //using Perlin noise to precedurally generate building heights
      popMatrix();
    }
  }
  if (frameCount % 40 == 10) { //cloud class additions
    fog.add(new Clouds(random(0, width), random(0, height/2), 100));
  }
  for (Clouds f : fog) {
    f.createCloud(b);
  }
}

float xRotationOfSun(float dis, float tim) { //rotation functions for sun (x)
  return dis*cos((PI*frameCount)/(60*tim));
}

float yRotationOfSun(float dis, float tim) { //rotation functions for sun (y)
  return dis*sin((PI*frameCount)/(60*tim));
}
