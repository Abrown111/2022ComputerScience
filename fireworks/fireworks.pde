int i = 0;
int speed = 20;
ArrayList<Fireworks> explosions = new ArrayList<Fireworks>();

void setup() {
  fullScreen();
  background(0);
  
  
  
}

void draw(){
  clear();
  if(frameCount % speed == 10){ 
    explosions.add(new Fireworks(30, 8, 0.4));
  }
  for(Fireworks lightShow: explosions){
    lightShow.fireworksShow();
  }
}










//int fireworkDensity = 30;
//float degreeRotation = (360/fireworkDensity);
//float posX = random(100, width-100);
//float posY = random(100, height-100);

//Particles[] fire = new Particles[fireworkDensity];

//void setup() { 
//  fullScreen();
//  for (int i = 0; i < fire.length; i++) {
//    fire[i] = new Particles(i*degreeRotation, 6, 0.1);
//  }
//  background(0);
//}

//void draw() {
//  clear();
//  for (int i = 0; i < fire.length; i++) {
//    pushMatrix();
//    translate(width/2, height/2);
//    fire[i].explode();
//    fire[i].display();
//    fire[i].fall();
//    popMatrix();
//  }
//}
