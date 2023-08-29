float redX;
float greenX;
float blueX;
float redY;
float greenY;
float blueY;
float colorEnergyX;
float colorEnergyY;
float totalColorEnergy;
float mappedColorDensity;
float scaled;
float[][] imageMatrix;
float[][] imageMatrix2;
float[] percentage;
int totalPercent = 0;

void settings() {
  PImage img;
  img = loadImage("hand.jpg");
  size(img.width, img.height);
}

void setup() {
  colorGradient();
  PImage greyedImage;
  greyedImage = createImage(width, height, RGB);
  greyedImage.loadPixels();
  for (int x = 0; x<width; x++) {
    for (int y = 0; y<height; y++) {
      greyedImage.pixels[(x+width*y)] = color(imageMatrix[x][y]);
    }
  }
  greyedImage.updatePixels();
  image(greyedImage, 0, 0);
  compare();
}

void draw() {
}

void colorGradient() {
  PImage img;
  img = loadImage("hand.jpg");
  imageMatrix = new float[img.width][img.height];
  for (int x = 0; x<img.width; x++) {
    for (int y = 0; y<img.height; y++) {
      redX = abs(red(img.get(x-1, y))-red(img.get(x+1, y)));
      greenX = abs(green(img.get(x-1, y))-green(img.get(x+1, y)));
      blueX = abs(blue(img.get(x-1, y))-blue(img.get(x+1, y)));
      redY = abs(red(img.get(x, y-1))-red(img.get(x, y+1)));
      greenY = abs(green(img.get(x, y-1))-green(img.get(x, y+1)));
      blueY = abs(blue(img.get(x, y-1))-blue(img.get(x, y+1)));
      colorEnergyX = redX + blueX + greenX;
      colorEnergyY = redY + blueY + greenY;
      totalColorEnergy = colorEnergyX + colorEnergyY;
      mappedColorDensity = map(totalColorEnergy, 0, 881, 0, 255);
      stroke(mappedColorDensity);
      imageMatrix[x][y] = mappedColorDensity;
    }
  }
}

void compare() {
  totalPercent = 0;
  PImage comprablePic;
  comprablePic = loadImage("IMG_0702.jpg");
  imageMatrix2 = new float[comprablePic.width][comprablePic.height];
  percentage = new float[width*height];
  for (int x = 0; x<comprablePic.width; x++) {
    for (int y = 0; y<comprablePic.height; y++) {
      redX = abs(red(comprablePic.get(x-1, y))-red(comprablePic.get(x+1, y)));
      greenX = abs(green(comprablePic.get(x-1, y))-green(comprablePic.get(x+1, y)));
      blueX = abs(blue(comprablePic.get(x-1, y))-blue(comprablePic.get(x+1, y)));
      redY = abs(red(comprablePic.get(x, y-1))-red(comprablePic.get(x, y+1)));
      greenY = abs(green(comprablePic.get(x, y-1))-green(comprablePic.get(x, y+1)));
      blueY = abs(blue(comprablePic.get(x, y-1))-blue(comprablePic.get(x, y+1)));
      colorEnergyX = redX + blueX + greenX;
      colorEnergyY = redY + blueY + greenY;
      totalColorEnergy = colorEnergyX + colorEnergyY;
      mappedColorDensity = map(totalColorEnergy, 0, 881, 0, 255);
      stroke(mappedColorDensity);
      imageMatrix2[x][y] = mappedColorDensity;
    }
  }

  for (int x = 0; x<comprablePic.width; x++) {
    for (int y = 0; y<comprablePic.height; y++) {
      percentage[x+width*y] = (abs(imageMatrix[x][y]-imageMatrix2[x][y]))/imageMatrix[x][y];
    }
  }

  for (int i = 0; i<(width*height); i++) {
    totalPercent += 100*percentage[i];
  }
  print(100-totalPercent/percentage.length, "% Match");
}
