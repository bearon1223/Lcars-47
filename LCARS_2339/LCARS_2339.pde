import processing.sound.*;

PImage logo, icon, temp, imgsur, standby;
PFont f, og;
float RATIOWH = 100, HYPOTNUCE = 100, totalTextFiles = 19;
String[] PanelDebug = {"test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test10"};
String[] mSPText = {"SYS DIRECTORY", "AUX DIRECTORY", "MED DIRECTORY", "COMMUNICATIONS", "STELLAR CHART", "MISSION OPS", "DATABASE"};
float[] mSPView = {3, 4, 5, 6, 7, 8, 9};
float[] mSPScene = {2, 3, 4, 5, 6, 7, 8};
float[] PanelDebugfloat = {1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1};
boolean isNotMuted = true;
float quality = 2;  
SoundFile click, HF;
String[] mainText = new String[int(totalTextFiles)];

static final String CONFIG_FILE = "config.dat";
static final String LANG_US = "lang_us", LANG_JP = "lang_jp";
float LANGUAGE = 0;

Login  l = new Login(0, width / 2, height / 2, 1);
panel  d = new panel(200, 100, 100, height - 100, 10, PanelDebug);
panel  mSP = new panel(0, 0, 0, 0, 7, mSPText);
panel  sSP = new panel(0, 0, 0, 0, 8);
panel  tSP = new panel(0, 0, 0, 0, floor(random(2, 3)));
panelS mSSP  = new panelS(0, 0, 0, 0, floor(random(5, 10)));
viewScreen v = new viewScreen(0);
float pwidth = 1000, pheight = 500;

void setup() {
  size(1000, 500);
  load();
  surface.setResizable(true);
  surface.setTitle("Lcars: "+ (year() + 320));
  smooth(2);
  logo = loadImage("Federation Logo.jpg");
  icon = loadImage("starfleet logo.jpg");
  temp = loadImage("template.png");
  imgsur = loadImage("Image Surroundings.png");
  standby = loadImage("Federation Standby.jpg");
  f = loadFont("Impact-48.vlw");
  og = loadFont("ProcessingSansPro-Regular-48.vlw");
  click = new SoundFile(this, "207.wav");
  HF = new SoundFile(this, "207.wav");
  surface.setIcon(icon);
  if (LANGUAGE == 0) {
    loadLang(LANG_US);
  } else if (LANGUAGE == 1) {
    loadLang(LANG_JP);
  }
}

void loadLang(String currentLang) {
  String[] lines = loadStrings(currentLang + ".dat");
  for (int i = 0; i <= totalTextFiles - 1; i++) {
    mainText[i] = lines[i];
  }
  for (int i = 0; i <= mSPText.length - 1; i++) {
    mSPText[i] = lines[i + 19];
  }
}

void save() {
  String[] lines = {
    str(quality), str(isNotMuted), str(LANGUAGE)
  };
  saveStrings(dataFile(CONFIG_FILE), lines);
}


void load() {
  String[] lines = loadStrings(CONFIG_FILE);
  quality = float(lines[0]);
  isNotMuted = boolean(lines[1]);
  LANGUAGE = float(lines[2]);
}

void draw() {
  frameRate(200);
  RATIOWH = width / height;
  HYPOTNUCE = sqrt((width * width) + (height * height));
  if (quality == 2 || LANGUAGE == 1) {
    textFont(f);
  } else {
    textFont(og);
  }
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
  //tSP.h = height / 4;
  tSP.h = sSP.y;
  tSP.w = width / 11.25;

  mSSP.x = sSP.x + sSP.w + width / 500;
  mSSP.y = sSP.y - mSSP.h - height / 250;
  mSSP.w = width - mSSP.x;
  mSSP.h = height / 50;

  v.x = mSSP.x;
  v.y = sSP.y;
  v.w = mSSP.w - width / 500;
  v.h = sSP.h - height / 250;

  scenes();
  //textFont(og);
  //fill(255);
  //text(mouseX, 30, 50);
  //text(mouseY, 30, 100);
  //noCursor();
  //stroke(255);
  //ellipse(mouseX, mouseY, 5, 1);
  pwidth = width;
  pheight = height;
}
