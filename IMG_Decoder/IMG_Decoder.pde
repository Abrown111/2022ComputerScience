PImage img;
float totalred = 0;
float totalgreen = 0;
float totalblue = 0;


void setup() {
  img = loadImage("https://csp.cs.stab.org/3.png");
  fullScreen();
}

void draw() {
  totalred = 0;
  totalgreen = 0;
  totalblue = 0;
  image(img, 0, 0);
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      totalred = totalred + red(get(x, y));
      totalgreen = totalgreen + green(get(x, y)); 
      totalblue = totalblue + blue(get(x, y));
      if (x == img.width-1 && y == img.height-1) {
        if (totalred == min(totalred, totalgreen, totalblue)) {
          for (int z = 0; z < img.width; z++) {
            for (int l = 0; l < img.height; l++) {
              color r = color(red(img.get(z, l)), 0, 0);
              set(z, l, 9*r);
            }
          }
        }
        if (x == img.width-1 && y == img.height-1) {
          if (totalgreen == min(totalred, totalgreen, totalblue)) {
            for (int z = 0; z < img.width; z++) {
              for (int l = 0; l < img.height; l++) {
                color g = color(0, green(img.get(z, l)), 0);
                set(z, l, 9*g);
              }
            }
          }
        }
        if (totalblue == min(totalred, totalgreen, totalblue)) {
          for (int z = 0; z < img.width; z++) {
            for (int l = 0; l < img.height; l++) {
              color b = color(0, 0, blue(img.get(z, l)));
              set(z, l, 9*b);
            }
          }
        }
      }
    }
  }
}
