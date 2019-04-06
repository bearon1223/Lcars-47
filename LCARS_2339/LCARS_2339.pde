PImage logo, icon, temp, cornerthing, cornerthing2, imgsur;
PFont f, og;
float RATIOWH = 100, HYPOTNUCE = 100;
String[] PanelDebug = {"test1", "test2", "test3", "test4", "test5"};
String[] mSPText = {"SYS DIRECTORY", "AUX DIRECTORY", "MED DIRECTORY", "COMMUNICATIONS", "STELLAR CHART", "MISSION OPS", "DATABASE"};

Login l = new Login(0, width / 2, height / 2, 1);
panel d = new panel(200, 0, 100, height, 5, PanelDebug);
panel mSP = new panel(0, 0, 0, 0, 7, mSPText);

void setup() {
  size(900, 600);
  surface.setResizable(true);
  surface.setTitle("Lcars: "+ (year() + 320));
  logo = loadImage("Federation Logo.jpg");
  icon = loadImage("starfleet logo.jpg");
  temp = loadImage("template.png");
  imgsur = loadImage("Image Surroundings.png");
  f = loadFont("Lcars 47.vlw");
  og = loadFont("InaiMathi-48.vlw");
  surface.setIcon(icon);
}

void draw() {
  RATIOWH = width / height;
  HYPOTNUCE = sqrt((width * width) + (height * height));
  textFont(f);
  background(0);
  l.x = width / 2;
  l.y = height / 1.25;
  d.h = height;
  d.w = width / 5;
  mSP.x = width / 5.2;
  mSP.h = height;
  mSP.w = width / 11.4;
  scenes();
}
