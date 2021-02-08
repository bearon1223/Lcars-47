import processing.sound.*;

PImage logo, icon, temp, imgsur, standby;
PFont f, og;
boolean debugPressed = false;
float RATIOWH = 100, HYPOTNUCE = 100;
String[] mSPText = new String[7];
String[] mNPText = new String[9];
float[] mSPView = {3, 4, 5, 6, 7, 8, 9};
float[] mSPScene = {2, 3, 4, 5, 6, 7, 8};
float[] PanelDebugfloat = {1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1};
boolean isNotMuted = true, inverted = false, theaterMode = false, fullscreen = false, timeoutEnabled = true, load_Debug = false;
float quality = 2, timeoutTime = 60;  
SoundFile click, fail, accept, bSounds, powerDown, dMusic, HFO, warning;
String[] mainText = new String[1000];
boolean RedAlert = false, pRedAlert = false;

boolean sxd = false, syd = false, szd = false;

static final String CONFIG_FILE = "config.dat";
static final String LANG_US = "lang_us", LANG_JP = "lang_jp", LANG_PEW = "lang_pew";
float LANGUAGE = 0;

float warpFactor = 0.05;

float nonDX = 0, nonDY = 0, nonDXM = 0, nonDYM = 0;

Login  l = new Login("omega-alpha-nine", width / 2, height / 2, 1);
panel  mSP = new panel(0, 0, 0, 0, 7, mSPText);
panel  sSP = new panel(0, 0, 0, 0, 8);
panel  tSP = new panel(0, 0, 0, 0, floor(random(2, 3)));
panel  cMP = new panel(0, 0, 0, 0, 4);
panel  mNP = new panel(0, 0, 0, 0, 9, mNPText);

panelS mSSP  = new panelS(0, 0, 0, 0, floor(random(5, 10)));
panelS cMSP  = new panelS(0, 0, 0, 0, 3);
panelS SDSP = new panelS(0, 0, 0, 0, 4);

textAnalisis mTA = new textAnalisis(0, 0, 0, 0, 3);
textAnalisis sTA = new textAnalisis(0, 0, 0, 0, floor(random(3, 5)));

viewScreen v = new viewScreen(0);
starField ViewScreenLarge = new starField();
starField ViewScreenSmall = new starField();

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
  icon = loadImage("starfleet logo.jpg");
  surface.setResizable(true);
  surface.setIcon(icon);
  surface.setTitle("Lcars: "+ (year() + 320));
  background(0);
  textAlign(CENTER, CENTER);
  textSize(50);
  text("Loading...", 0, 0, 1000, 500);
  logo = loadImage("Federation Logo.jpg");
  temp = loadImage("Nav Template.jpg");
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
  warning = new SoundFile(this, "Warning.wav");
  dMusic.amp(0.5);
  HFO = new SoundFile(this, "Deny.wav");
  if (LANGUAGE == 0) {
    loadLang(LANG_US);
  } else if (LANGUAGE == 1) {
    loadLang(LANG_JP);
  }
  if (load_Debug) {
    String[] args = {"Debug?"};
    Debug sa = new Debug();
    PApplet.runSketch(args, sa);
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
  for (int i = 0; i <= 10 - 1; i++) {
    mainText[i + 26] = lines[i + 26];
  }
}

void loadLangtemp(String currentLang) {
  String[] lines = loadStrings(currentLang+".dat");
  for (int i = 0; i <= mNPText.length - 1; i++) {
    mNPText[i] = lines[i];
  }
}

void save() {
  String[] lines = {
    str(quality), str(isNotMuted), str(LANGUAGE), str(fullscreen), str(theaterMode), str(timeoutTime), str(timeoutEnabled), str(load_Debug)
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
  load_Debug = boolean(lines[7]);
}

void draw() {
  loadLangtemp("temp");
  nonDX = width;
  nonDY = height;
  nonDXM = mouseX;
  nonDYM = mouseY;
  textFont(f);
  frameRate(100);
  if (scene != -2 || scene != -1) {
    textAlign(CENTER, CENTER);
  }
  RATIOWH = width / height;
  HYPOTNUCE = sqrt((width * width) + (height * height));
  background(0);
  scenes();
  pRedAlert = RedAlert;

  if (keyDetection('h')) {
    warpFactor = 9;
  }

  if (scene != -1) {

    //if (shipX < targetX - 10) {
    //  shipX += warpFactor;
    //} else if (shipX > targetX + 10) {
    //  shipX -= warpFactor;
    //} else {
    //  sxd = true;
    //}

    //if (shipY <= targetY - 10 && shipY != targetX) {
    //  shipY += warpFactor;
    //} else if (shipY >= targetY + 10 && shipY != targetX) {
    //  shipY -= warpFactor;
    //} else {
    //  syd = true;
    //}

    //if (shipZ <= targetZ - 10 && shipZ != targetX) {
    //  shipZ += warpFactor;
    //} else if (shipZ >= targetZ + 10 && shipZ != targetX) {
    //  shipZ -= warpFactor;
    //} else {
    //  szd = true;
    //}
  }
}
