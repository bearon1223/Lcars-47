PImage logo, icon, temp, imgsur;
PFont f, og;
float RATIOWH = 100, HYPOTNUCE = 100;
String[] PanelDebug = {"test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test10"};
String[] mSPText = {"SYS DIRECTORY", "AUX DIRECTORY", "MED DIRECTORY", "COMMUNICATIONS", "STELLAR CHART", "MISSION OPS", "DATABASE"};
float[] mSPScene = {2, 3, 4, 5, 6, 7, 8};
float[] PanelDebugfloat = {1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1};

Login l = new Login(0, width / 2, height / 2, 1);
panel d = new panel(200, 100, 100, height - 100, 10, PanelDebug);
panel mSP = new panel(10, 10, 10, 10, 7, mSPText);
panel sSP = new panel(10, 10, 10, 10, 8);

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
  d.h = height - 150;
  d.w = width / 5;
  mSP.x = width / 5.2;
  mSP.h = height;
  mSP.w = width / 11.4;
  sSP.x = width / 3.488372093023256;
  sSP.y = height / 2.2641509243396226;
  sSP.h = height - sSP.y;
  sSP.w = width / 11.25;
  scenes();
  textSize(20);
  fill(100);
  text(mouseX, 10, 20);
  text(mouseY, 10, 40);
}
