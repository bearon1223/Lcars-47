import processing.sound.*;

PImage logo, icon, temp, imgsur, standby;
PFont f, og;
float RATIOWH = 100, HYPOTNUCE = 100;
String[] PanelDebug = {"test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test10"};
String[] mSPText = {"SYS DIRECTORY", "AUX DIRECTORY", "MED DIRECTORY", "COMMUNICATIONS", "STELLAR CHART", "MISSION OPS", "DATABASE"};
float[] mSPView = {3, 4, 5, 6, 7, 8, 9};
float[] mSPScene = {2, 3, 4, 5, 6, 7, 8};
float[] PanelDebugfloat = {1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1};
SoundFile click;

Login l = new Login(0, width / 2, height / 2, 1);
panel d = new panel(200, 100, 100, height - 100, 10, PanelDebug);
panel mSP = new panel(0, 0, 0, 0, 7, mSPText);
panel sSP = new panel(0, 0, 0, 0, 8);
panel tSP = new panel(0, 0, 0, 0, 2);

void setup() {
  size(900, 600);
  surface.setResizable(true);
  surface.setTitle("Lcars: "+ (year() + 320));
  smooth(2);
  logo = loadImage("Federation Logo.jpg");
  icon = loadImage("starfleet logo.jpg");
  temp = loadImage("template.png");
  imgsur = loadImage("Image Surroundings.png");
  standby = loadImage("Federation Standby.jpg");
  f = loadFont("Lcars 47.vlw");
  og = loadFont("InaiMathi-48.vlw");
  click = new SoundFile(this, "207.wav");
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
  
  tSP.x = width / 3.488372093023256;
  tSP.h = height / 4;
  tSP.w = width / 11.25;
  scenes();
  //textFont(og);
  //fill(255);
  //text(mouseX, 30, 50);
  //text(mouseY, 30, 100);
  //noCursor();
  //stroke(255);
  //ellipse(mouseX, mouseY, 5, 1);
}
