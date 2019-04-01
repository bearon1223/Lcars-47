PImage logo, icon, temp, cornerthing, cornerthing2, imgsur;
PFont f;
float RATIOWH = 100, HYPOTNUCE = 100;

Login l = new Login(0, width / 2, height / 2);

void setup() {
  size(900, 600);
  surface.setResizable(true);
  surface.setTitle("Lcars: "+ (year() + 320));
  logo = loadImage("Federation Logo.jpg");
  icon = loadImage("starfleet logo.jpg");
  temp = loadImage("template.png");
  imgsur = loadImage("Image Surroundings.png");
  f = loadFont("Lcars 47.vlw");
  surface.setIcon(icon);
}

void draw() {
  RATIOWH = width / height;
  HYPOTNUCE = sqrt((width * width) + (height * height));
  textFont(f);
  background(0);
  l.x = width / 2;
  l.y = height / 1.25;
  scenes();
}
