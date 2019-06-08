import processing.sound.*;

PImage logo, icon, temp, imgsur, standby;
PFont f, og;
boolean debugPressed = false;
float RATIOWH = 100, HYPOTNUCE = 100;
String[] PanelDebug = {"test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test10"};
//String[] mSPText = {"SYS DIRECTORY", "AUX DIRECTORY", "MED DIRECTORY", "COMMUNICATIONS", "STELLAR CHART", "MISSION OPS", "DATABASE"}; 
String[] mSPText = new String[7];
float[] mSPView = {3, 4, 5, 6, 7, 8, 9};
float[] mSPScene = {2, 3, 4, 5, 6, 7, 8};
float[] PanelDebugfloat = {1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1};
boolean isNotMuted = true, inverted = false, theaterMode = false, fullscreen = false, timeoutEnabled = true;
float quality = 2, timeoutTime = 60;  
SoundFile click, fail, accept, bSounds, powerDown, dMusic, HFO;
String[] mainText = new String[1000];
boolean RedAlert = false, pRedAlert = false;

static final String CONFIG_FILE = "config.dat";
static final String LANG_US = "lang_us", LANG_JP = "lang_jp", LANG_PEW = "lang_pew";
float LANGUAGE = 0;

Login  l = new Login("omega-alpha-nine", width / 2, height / 2, 1);
panel  d = new panel(200, 100, 100, height - 100, 10, PanelDebug);
panel  mSP = new panel(0, 0, 0, 0, 7, mSPText);
panel  sSP = new panel(0, 0, 0, 0, 8);
panel  tSP = new panel(0, 0, 0, 0, floor(random(2, 3)));
panel  cMP = new panel(0, 0, 0, 0, 4);
panelS mSSP  = new panelS(0, 0, 0, 0, floor(random(5, 10)));
panelS cMSP  = new panelS(0, 0, 0, 0, 3);
textAnalisis mTA = new textAnalisis(0, 0, 0, 0, 3);
textAnalisis sTA = new textAnalisis(0, 0, 0, 0, floor(random(3, 5)));
viewScreen v = new viewScreen(0);

timer timeout = new timer(10);

void settings() {
  load();
  if (!fullscreen) {
    size(1000, 500);
  } else {
    fullScreen();
  }
  timeout = new timer(timeoutTime);
}

void setup() {
  surface.setResizable(true);
  surface.setTitle("Lcars: "+ (year() + 320));
  background(0);
  textAlign(CENTER, CENTER);
  textSize(50);
  text("Loading...", 0, 0, 1000, 500);
  logo = loadImage("Federation Logo.jpg");
  icon = loadImage("starfleet logo.jpg");
  temp = loadImage("template.png");
  imgsur = loadImage("Image Surroundings.png");
  standby = loadImage("Federation Standby.jpg");
  f = loadFont("Impact-48.vlw");
  og = loadFont("ProcessingSansPro-Regular-48.vlw");
  click = new SoundFile(this, "Click.wav");
  click.amp(0.25);
  fail = new SoundFile(this, "Deny.wav");
  fail.amp(0.5);
  accept = new SoundFile(this, "Allow.wav");
  accept.amp(0.5);
  bSounds = new SoundFile(this, "tng_bridge_2.mp3");
  powerDown = new SoundFile(this, "power_down.mp3");
  dMusic = new SoundFile(this, "Extra Music.mp3");
  dMusic.amp(0.5);
  HFO = new SoundFile(this, "Deny.wav");
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
  for (int i = 0; i <= 7 - 1; i++) {
    mainText[i + 26] = lines[i + 26];
  }
}

void save() {
  String[] lines = {
    str(quality), str(isNotMuted), str(LANGUAGE), str(fullscreen), str(theaterMode), str(timeoutTime), str(timeoutEnabled)
  };
  saveStrings(dataFile(CONFIG_FILE), lines);
}


void load() {
  String[] lines = loadStrings(CONFIG_FILE);
  quality = float(lines[0]);
  isNotMuted = boolean(lines[1]);
  LANGUAGE = float(lines[2]);
  fullscreen = boolean(lines[3]);
  theaterMode = boolean(lines[4]);
  timeoutTime = float(lines[5]);
  timeoutEnabled = boolean(lines[6]);

  tempquality = float(lines[0]);
  tempisNotMuted = boolean(lines[1]);
  temptheater = boolean(lines[4]);
  temptimeoutTime = float(lines[5]);
  temptimeoutEnabled = boolean(lines[6]);
}

void draw() {
  frameRate(100);
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
  pRedAlert = RedAlert;
}
