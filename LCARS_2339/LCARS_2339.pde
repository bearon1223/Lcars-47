import processing.sound.*;

PImage logo, icon, temp, imgsur, standby;
PFont f, og;
boolean debugPressed = false;
float RATIOWH = 100, HYPOTNUCE = 100;
String[] PanelDebug = {"test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test10"};
String[] mSPText = {"SYS DIRECTORY", "AUX DIRECTORY", "MED DIRECTORY", "COMMUNICATIONS", "STELLAR CHART", "MISSION OPS", "DATABASE"};
float[] mSPView = {3, 4, 5, 6, 7, 8, 9};
float[] mSPScene = {2, 3, 4, 5, 6, 7, 8};
float[] PanelDebugfloat = {1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1};
boolean isNotMuted = true, inverted = false, theaterMode = false;
boolean fullscreen = false;
float quality = 2;  
SoundFile click, keyPress, fail, accept;
String[] mainText = new String[int(1000)];

static final String CONFIG_FILE = "config.dat";
static final String LANG_US = "lang_us", LANG_JP = "lang_jp", LANG_PEW = "lang_pew";
float LANGUAGE = 0;

Login  l = new Login(0, width / 2, height / 2, 1);
panel  d = new panel(200, 100, 100, height - 100, 10, PanelDebug);
panel  mSP = new panel(0, 0, 0, 0, 7, mSPText);
panel  sSP = new panel(0, 0, 0, 0, 8);
panel  tSP = new panel(0, 0, 0, 0, floor(random(2, 3)));
panel  cMP = new panel(0, 0, 0, 0, 4);
panelS mSSP  = new panelS(0, 0, 0, 0, floor(random(5, 10)));
panelS cMSP  = new panelS(0, 0, 0, 0, 3);
textAnalisis mTA = new textAnalisis(0, 0, 0, 0, 4);
textAnalisis sTA = new textAnalisis(0, 0, 0, 0, 6);
viewScreen v = new viewScreen(0);
float pwidth = 1000, pheight = 500;
void settings() {
  load();
  if (!fullscreen) {
    size(1000, 500);
  } else {
    fullScreen();
  }

  smooth(2);
}

void setup() {
  surface.setResizable(true);
  surface.setTitle("Lcars: "+ (year() + 320));
  logo = loadImage("Federation Logo.jpg");
  icon = loadImage("starfleet logo.jpg");
  temp = loadImage("template.png");
  imgsur = loadImage("Image Surroundings.png");
  standby = loadImage("Federation Standby.jpg");
  f = loadFont("Impact-48.vlw");
  og = loadFont("ProcessingSansPro-Regular-48.vlw");
  click = new SoundFile(this, "Click.wav");
  keyPress = new SoundFile(this, "");
  fail = new SoundFile(this, "Deny.wav");
  accept = new SoundFile(this, "Allow.wav");
  surface.setIcon(icon);
  if (LANGUAGE == 0) {
    loadLang(LANG_US);
  } else if (LANGUAGE == 1) {
    loadLang(LANG_JP);
  }
}

void loadLang(String currentLang) {
  String[] lines = loadStrings(currentLang + ".dat");
  for (int i = 0; i <= 19 - 1; i++) {
    mainText[i] = lines[i];
  }
  for (int i = 0; i <= mSPText.length - 1; i++) {
    mSPText[i] = lines[i + 19];
  }
  for (int i = 0; i <= 5 - 1; i++) {
    mainText[i + 26] = lines[i + 26];
  }
  for (int i = 0; i<=lines.length - 1; i++) {
    println(i+": "+lines[i]);
  }
}

void save() {
  String[] lines = {
    str(quality), str(isNotMuted), str(LANGUAGE), str(fullscreen), str(theaterMode)
  };
  saveStrings(dataFile(CONFIG_FILE), lines);
}


void load() {
  String[] lines = loadStrings(CONFIG_FILE);
  quality = float(lines[0]);
  isNotMuted = boolean(lines[1]);
  tempquality = float(lines[0]);
  tempisNotMuted = boolean(lines[1]);
  LANGUAGE = float(lines[2]);
  fullscreen = boolean(lines[3]);
  theaterMode = boolean(lines[4]);
}

void draw() {
  frameRate(100);
  if (keyDetection('*')) {
    l = new Login(0, width / 2, height / 2, 1);
    d = new panel(200, 100, 100, height - 100, 10, PanelDebug);
    mSP = new panel(0, 0, 0, 0, 7, mSPText);
    sSP = new panel(0, 0, 0, 0, 8);
    tSP = new panel(0, 0, 0, 0, floor(random(2, 3)));
    cMP = new panel(0, 0, 0, 0, 4);
    mSSP  = new panelS(0, 0, 0, 0, floor(random(5, 10)));
    cMSP  = new panelS(0, 0, 0, 0, 3);
    mTA = new textAnalisis(0, 0, 0, 0, 4);
    v = new viewScreen(0);
    sTA = new textAnalisis(0, 0, 0, 0, 6);

    scene = -1; 
    veiwScreen = 0; 
    miniScreen = 0; 
    logoZoomin = 100; 
    fade = 250;
  }
  if (scene != -2 || scene != -1) {
    textAlign(CENTER, CENTER);
  }
  RATIOWH = width / height;
  HYPOTNUCE = sqrt((width * width) + (height * height));
  if (quality == 2 || LANGUAGE == 1) {
    textFont(f);
  } else {
    textFont(og);
  }
  background(0);

  scenes();
  pwidth = width;
  pheight = height;
}
