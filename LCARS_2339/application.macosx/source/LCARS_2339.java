import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class LCARS_2339 extends PApplet {



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

float warpFactor = 0.05f;

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

public void settings() {
  load();
  if (!fullscreen) {
    size(1000, 500);
  } else {
    fullScreen();
  }
  timeout = new timer(timeoutTime);
}

public void setup() {
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
  click.amp(0.25f);
  fail = new SoundFile(this, "Deny.wav");
  fail.amp(0.5f);
  accept = new SoundFile(this, "Allow.wav");
  accept.amp(0.5f);
  bSounds = new SoundFile(this, "tng_bridge_2.mp3");
  powerDown = new SoundFile(this, "power_down.mp3");
  dMusic = new SoundFile(this, "Extra Music.mp3");
  warning = new SoundFile(this, "Warning.wav");
  dMusic.amp(0.5f);
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

public void loadLang(String currentLang) {
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

public void loadLangtemp(String currentLang) {
  String[] lines = loadStrings(currentLang+".dat");
  for (int i = 0; i <= mNPText.length - 1; i++) {
    mNPText[i] = lines[i];
  }
}

public void save() {
  String[] lines = {
    str(quality), str(isNotMuted), str(LANGUAGE), str(fullscreen), str(theaterMode), str(timeoutTime), str(timeoutEnabled), str(load_Debug)
  };
  saveStrings(dataFile(CONFIG_FILE), lines);
}


public void load() {
  String[] lines = loadStrings(CONFIG_FILE);
  quality = PApplet.parseFloat(lines[0]);
  isNotMuted = PApplet.parseBoolean(lines[1]);
  LANGUAGE = PApplet.parseFloat(lines[2]);
  fullscreen = PApplet.parseBoolean(lines[3]);
  theaterMode = PApplet.parseBoolean(lines[4]);
  timeoutTime = PApplet.parseFloat(lines[5]);
  timeoutEnabled = PApplet.parseBoolean(lines[6]);

  tempquality = PApplet.parseFloat(lines[0]);
  tempisNotMuted = PApplet.parseBoolean(lines[1]);
  temptheater = PApplet.parseBoolean(lines[4]);
  temptimeoutTime = PApplet.parseFloat(lines[5]);
  temptimeoutEnabled = PApplet.parseBoolean(lines[6]);
  load_Debug = PApplet.parseBoolean(lines[7]);
}

public void draw() {
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
public class Debug extends PApplet {

  public void settings() {
    size(600, 250);
  }

  boolean ggfdsakfj = false, ggfdsakfjd = false, KPRESSED = false;

  String input1 = "", input2 = "";

  float currentInput = 1, output = 0;

  public boolean Button(float x, float y, float w, float h) {
    boolean t = false;
    if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && !ggfdsakfjd && mousePressed) {
      ggfdsakfjd = true;
    } else if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && ggfdsakfjd && !mousePressed) {
      ggfdsakfjd = false;
      t = true;
    }
    return t;
  }

  public boolean keyDetection(char k) {
    if (keyPressed && key == k && !KPRESSED) {
      KPRESSED = true;
      return false;
    } else if (!keyPressed && key == k && KPRESSED) {
      KPRESSED = false;
      return true;
    } else {
      return false;
    }
  }

  public boolean Button(String stringtext, float x, float y, float w, float h, boolean isRounded, int c) {
    boolean t = false;
    fill(c);
    textAlign(CENTER, CENTER);
    textSize(15);
    if (!isRounded) {
      rect(x, y, w, h, 0);
    } else if (isRounded) {
      rect(x, y, w, h, 1118.034f);
    }
    fill(0);
    text(stringtext, x, y, w, h);
    if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && !ggfdsakfj && mousePressed) {
      ggfdsakfj = true;
    } else if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && ggfdsakfj && !mousePressed) {
      ggfdsakfj = false;
      t = true;
    }
    stroke(0);
    return t;
  }

  public void buttons() {
    textAlign(CENTER, CENTER);
    if (currentInput == 1) {
      for (int i = 0; i <= 2; i++) {
        for (int j = 0; j<= 2; j++) {
          fill(255);
          rect(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
          fill(0);
          switch(i) {
          case 0:
            text("" + (j + 1), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input1 += (j + 1);
            }
            break;
          case 1:
            text("" + (j + 4), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input1 += (j + 4);
            }
            break;
          case 2:
            if (j <= 2) {
              text("" + (j + 7), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
              if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
                input1 += (j + 7);
              }
            }
            break;
          }
        }
      }
      float j = 3, i = 2;
      if (Button("0", 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50, false, color(255))) {
        input1 += "0";
      }
    } else if (currentInput == 2) {
      for (int i = 0; i <= 2; i++) {
        for (int j = 0; j<= 2; j++) {
          fill(255);
          rect(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
          fill(0);
          switch(i) {
          case 0:
            text("" + (j + 1), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input2 += (j + 1);
            }
            break;
          case 1:
            text("" + (j + 4), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input2 += (j + 4);
            }
            break;
          case 2:
            text("" + (j + 7), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input2 += (j + 7);
            }
            break;
          }
        }
      }
      float j = 3, i = 2;
      if (Button("0", 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50, false, color(255))) {
        input2 += "0";
      }
    } else if (currentInput == 3) {
      for (int i = 0; i <= 2; i++) {
        for (int j = 0; j<= 2; j++) {
          fill(255);
          rect(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
          fill(0);
          switch(i) {
          case 0:
            text("" + (j + 1), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input1 = "";
              input2 = "";
              input1 += (j + 1);
              currentInput = 1;
            }
            break;
          case 1:
            text("" + (j + 4), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input1 = "";
              input2 = "";
              input1 += (j + 4);
              currentInput = 1;
            }
            break;
          case 2:
            text("" + (j + 7), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input1 = "";
              input2 = "";
              input1 += (j + 7);
              currentInput = 1;
            }
            break;
          }
        }
      }
      float j = 3, i = 2;
      if (Button("0", 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50, false, color(255))) {
        input1 = "";
        input2 = "";
        input1 += "0";
        currentInput = 1;
      }
    } else if (currentInput == 4) {
      for (int i = 0; i <= 2; i++) {
        for (int j = 0; j<= 2; j++) {
          fill(255);
          rect(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
          fill(0);
          switch(i) {
          case 0:
            text("" + (j + 1), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input2 += (j + 1);
            }
            break;
          case 1:
            text("" + (j + 4), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input2 += (j + 4);
            }
            break;
          case 2:
            text("" + (j + 7), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input2 += (j + 7);
            }
            break;
          }
        }
      }
      float j = 3, i = 2;
      if (Button("0", 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50, false, color(255))) {
        input2 += "0";
      }
    } else if (currentInput == 5) {
      for (int i = 0; i <= 2; i++) {
        for (int j = 0; j<= 2; j++) {
          fill(255);
          rect(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
          fill(0);
          switch(i) {
          case 0:
            text("" + (j + 1), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input1 = "";
              input2 = "";
              input1 += (j + 1);
              currentInput = 1;
            }
            break;
          case 1:
            text("" + (j + 4), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input1 = "";
              input2 = "";
              input1 += (j + 4);
              currentInput = 1;
            }
            break;
          case 2:
            text("" + (j + 7), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input1 = "";
              input2 = "";
              input1 += (j + 7);
              currentInput = 1;
            }
            break;
          }
        }
      }
      float j = 3, i = 2;
      if (Button("0", 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50, false, color(255))) {
        input1 = "";
        input2 = "";
        input1 += "0";
        currentInput = 1;
      }
    }

    textAlign(CORNER, CORNER);
  }

  public void draw() {
    textSize(15);
    textAlign(CORNER, CORNER);
    background(255);

    textSize(15);
    text(HYPOTNUCE, 1, 5);

    textSize(15);
    text(warpFactor, 1, 20);

    textSize(15);
    text(scene, 1, 35);

    textSize(15);
    text("width / ? = MouseX: "+nonDX / nonDXM, 1, 50);

    textSize(15);
    text("height / ? = MouseY: "+nonDY / nonDYM, 1, 65);

    textSize(15);
    text(veiwScreen, 1, 80);
    
    textSize(15);
    text(targetX - shipX, 1, 95);
    
    textSize(15);
    text(targetY - shipY, 1, 110);
    
    textSize(15);
    text(targetZ - shipZ, 1, 125);

    fill(255);
    rect(200, 0, 399, 248);
    rect(210, 10, 200, 50);

    textAlign(CORNER, CENTER);
    fill(0);
    if (currentInput == 1) {
      text(input1, 220, 10, 190, 50);
    } else if (currentInput == 2) {
      text(input1 +" + "+input2, 220, 10, 190, 50);
    } else if (currentInput == 3) {
      text(input1 +" + "+input2 + " = "  + str(floor(output)), 220, 10, 190, 50);
    } else if (currentInput == 4) {
      text(input1 +" ÷ "+input2, 220, 10, 190, 50);
    } else if (currentInput == 5) {
      text(input1 +" ÷ "+input2 + " = "  + output, 220, 10, 190, 50);
    }

    fill(100, 0, 0);
    rect(420, 10, 70, 50);
    buttons();
    if (Button("=", 410, 130, 50, 50, false, color(255))) {
      if (currentInput == 2) {
        output = PApplet.parseInt(input1) + PApplet.parseInt(input2);
        currentInput = 3;
      } else if (currentInput == 4) {
        output = PApplet.parseInt(input1) / PApplet.parseInt(input2);
        currentInput = 5;
      }
    }
    if (Button("+", 410, 70, 50, 50, false, color(255))) {
      currentInput = 2;
    }
    if (Button("÷", 470, 70, 50, 50, false, color(255))) {
      currentInput = 4;
    }
  }
}
public void exteriorViewPort() {
  // Exterior viewport not viewScreen
  if (warpFactor > 0.11f) {
    ViewScreenLarge.w = mSSP.w - width / 500;
    ViewScreenLarge.h = (height - mSSP.y - height / 250);

    translate(mSSP.x + (mSSP.w - width / 500)/2, sSP.y + (height - mSSP.y - height / 250)/2);
    ViewScreenLarge.update();
    translate(-(mSSP.x + (mSSP.w - width / 500)/2), -(sSP.y + (height - mSSP.y - height / 250)/2));

    fill(0);
    rect(0, 0, width, mSSP.y);
    rect(0, mSSP.y, mSSP.x, height - mSSP.y);
    if (sxd && syd && szd) {
      if (warpFactor > 0.11f) {
        warpFactor -= 0.25f;
      } else {
        warpFactor = 0.05f;
      }
    }
  } else {

    ViewScreenLarge.w = mSSP.w - width / 500;
    ViewScreenLarge.h = (height - mSSP.y - height / 250);

    translate(mSSP.x + (mSSP.w - width / 500)/2, sSP.y + (height - mSSP.y - height / 250)/2);
    ViewScreenLarge.update();
    translate(-(mSSP.x + (mSSP.w - width / 500)/2), -(sSP.y + (height - mSSP.y - height / 250)/2));

    if (sxd && syd && szd) {
      fill(0, 100, 255);
      ellipse(mSSP.x, mSSP.y + (height - (mSSP.y+mSSP.h)) / 2, width / 10, height / 1.25f);
    }

    fill(0);
    rect(0, 0, width, mSSP.y);
    rect(0, mSSP.y, mSSP.x, height - mSSP.y);
  }
}

float Location = 0;

public void navigation() {
  // Navigation
  mNP.x = mSSP.x;
  mNP.y = mSSP.y + mSSP.h + height / 250;
  mNP.w = (width / 5.0f)/2;
  mNP.h = height - mNP.y;

  image(temp, mSSP.x, mSSP.y + mSSP.h + height / 250, mSSP.w - width / 500, height - mSSP.y);
  fill(255);
  mNP.render();

  if (Button(mNP.x, mNP.y + (mNP.h / mNP.pc * 0), mNP.w, mNP.h/mNP.pc)) {
    warpFactor = 8;
    shipX = -100;
    shipY = -100;
    shipZ = -100;
  }
  if (Button(mNP.x, mNP.y + (mNP.h / mNP.pc * 1), mNP.w, mNP.h/mNP.pc)) {
    warpFactor = 7;
  }
  if (Button(mNP.x, mNP.y + (mNP.h / mNP.pc * 2), mNP.w, mNP.h/mNP.pc)) {
    warpFactor = 6;
  }
  if (Button(mNP.x, mNP.y + (mNP.h / mNP.pc * 3), mNP.w, mNP.h/mNP.pc)) {
    warpFactor = 5;
  }
  if (Button(mNP.x, mNP.y + (mNP.h / mNP.pc * 4), mNP.w, mNP.h/mNP.pc)) {
    warpFactor = 4;
  }
  if (Button(mNP.x, mNP.y + (mNP.h / mNP.pc * 5), mNP.w, mNP.h/mNP.pc)) {
    warpFactor = 3;
  }
  if (Button(mNP.x, mNP.y + (mNP.h / mNP.pc * 6), mNP.w, mNP.h/mNP.pc)) {
    warpFactor = 2;
  }
  if (Button(mNP.x, mNP.y + (mNP.h / mNP.pc * 7), mNP.w, mNP.h/mNP.pc)) {
    warpFactor = 1;
  }
  if (Button(mNP.x, mNP.y + (mNP.h / mNP.pc * 8), mNP.w, mNP.h/mNP.pc)) {
    warpFactor = 0.05f;
  }

  fill(100, 100, 255);
  ellipse(width / 1.333f, height / 1.416f, width / 4.0f, height / 2.0f);
  fill(0);
  ellipse(width / 1.333f, height / 1.416f, 160, 160);
  fill(100, 10, 255);
  ellipse(width / 1.333f, height / 1.416f, width / 6.66f, height / 3.33f);
}
class panel {
  float x, y, w, h, pc;
  int[] colors;
  String[] texts;
  panel(float xb, float yb, float wb, float hb, float panelcount, String[] textsb) {
    x = xb;
    y = yb;
    w = wb;
    h = hb;
    pc = panelcount;
    texts = textsb;
    colors = new int[PApplet.parseInt(panelcount)];
    for (int i = 0; i <= panelcount - 1; i++) {
      colors[i] = color(random(20, 70), random(100, 200), random(200, 255));
    }
  }
  panel(float xb, float yb, float wb, float hb, float panelcount) {
    x = xb;
    y = yb;
    w = wb;
    h = hb;
    pc = panelcount;
    texts = new String[PApplet.parseInt(panelcount)];
    colors = new int[PApplet.parseInt(panelcount)];
    for (int i = 0; i <= panelcount - 1; i++) {
      texts[i] = floor(random(50, 99)) + "-" + floor(random(200000, 999999));
    }
    for (int i = 0; i <= panelcount - 1; i++) {
      colors[i] = color(random(20, 70), random(100, 200), random(200, 255));
    }
  }

  public void render() {
    if (RedAlert == true && pRedAlert == false) {
      for (int i = 0; i <= pc - 1; i++) {
        colors[i] = color(random(100, 255), random(10, 20), random(20, 30));
      }
    } else if (RedAlert == false && pRedAlert == true) {
      for (int i = 0; i <= pc - 1; i++) {
        colors[i] = color(random(20, 70), random(100, 200), random(200, 255));
      }
    }
    for (int i = 0; i <= pc - 1; i++) {
      textAlign(CENTER, CENTER);
      textSize(HYPOTNUCE / 66);
      fill(colors[i]);
      rect(x, y+((h / pc) * i), w, h / pc - (height / 250));
      fill(0);
      text(texts[i], x, y + (h / pc) * i, w, h / pc - (height / 250));
    }
  }

  public void InteractiveV(float[] panelScene) {
    for (int i = 0; i <= pc - 1; i++) {
      if (Button(x, y+((h / pc) * i), w, h / pc - (height / 250))) {
        veiwScreen = panelScene[i];
      }
    }
  }

  public void InteractiveS(float[] panelScene) {
    for (int i = 0; i <= pc - 1; i++) {
      if (Button(x, y+((h / pc) * i), w, h / pc - (height / 250))) {
        scene = panelScene[i];
      }
    }
  }
}

class panelS {
  float x, y, w, h, pc;
  int[] colors;
  String[] texts;
  float TextSize = HYPOTNUCE / 130;
  panelS(float xb, float yb, float wb, float hb, float panelcount, String[] textsb) {
    x = xb;
    y = yb;
    w = wb;
    h = hb;
    pc = panelcount;
    texts = textsb;
    colors = new int[PApplet.parseInt(panelcount)];
    for (int i = 0; i <= panelcount - 1; i++) {
      colors[i] = color(random(20, 70), random(100, 200), random(200, 255));
    }
  }
  panelS(float xb, float yb, float wb, float hb, float panelcount) {
    x = xb;
    y = yb;
    w = wb;
    h = hb;
    pc = panelcount;
    colors = new int[PApplet.parseInt(panelcount)];
    texts = new String[PApplet.parseInt(panelcount)];
    for (int i = 0; i <= panelcount - 1; i++) {
      texts[i] = floor(random(50, 99)) + "-" + floor(random(200000, 999999));
    }
    for (int i = 0; i <= panelcount - 1; i++) {
      colors[i] = color(random(20, 70), random(100, 200), random(200, 255));
    }
  }

  public void render() {
    if (RedAlert == true && pRedAlert == false) {
      for (int i = 0; i <= pc - 1; i++) {
        colors[i] = color(random(100, 255), random(10, 20), random(20, 30));
      }
    } else if (RedAlert == false && pRedAlert == true) {
      for (int i = 0; i <= pc - 1; i++) {
        colors[i] = color(random(20, 70), random(100, 200), random(200, 255));
      }
    }
    textSize(TextSize);
    TextSize = HYPOTNUCE / 130;
    for (int i = 0; i <= pc - 1; i++) {
      textAlign(CENTER, CENTER);
      fill(colors[i]);
      rect(x + ((w / pc) * i), y, w / pc - (width / 500), h);
      fill(0);
      text(texts[i], x + ((w / pc) * i), y, w / pc - (width / 500), h);
    }
  }

  public void InteractiveV(float[] panelScene) {
    for (int i = 0; i <= pc - 1; i++) {
      if (Button(x + ((w / pc) * i), y, w / pc - (width / 500), h)) {
        veiwScreen = panelScene[i];
      }
    }
  }

  public void InteractiveS(float[] panelScene) {
    for (int i = 0; i <= pc - 1; i++) {
      if (Button(x + ((w / pc) * i), y, w / pc - (width / 500), h)) {
        scene = panelScene[i];
      }
    }
  }
}

class viewScreen {
  float x, y, w, h, sT, starAmount;
  float starMult = 1;
  float[] offx = new float[50], offy = new float[50], offs = new float[50];
  viewScreen(float screenType) {
    sT = screenType;

    starAmount = 500;
  }

  public void updateStarCount() {

    starAmount = 1000 * starMult;

    offx = new float[PApplet.parseInt(starAmount)];
    offy = new float[PApplet.parseInt(starAmount)];
    offs = new float[PApplet.parseInt(starAmount)];
    generateStars();
  }

  public void generateStars() {
    for (int i = 0; i <= starAmount - 1; i++) {
      offx[i] = random(0, w);
      offy[i] = random(0, h);
      offs[i] = random(0.75f, 2);
    }
  }

  public void render() {
    if (sT == 0) {
      noStroke();
      for (int i = 0; i <= starAmount - 1; i++) {
        fill(255);
        ellipse(x + (offx[i] * (width / 1000.0f)), y + (offy[i] * (height / 500.0f)), offs[i] * (w / 500), offs[i] * (h / 250));
      }
      stroke(0);
    }
  }
}

public void FederationSymbol(float x, float y, float d) {
  float r = d/2;

  fill(255);
  ellipse(x, y + r / 6, d*1.25f, d*0.85f);

  fill(100, 100, 255);
  ellipse(x, y, d, d);
}

public void FederationSymbol(float x, float y, float d, float d2) {
  float r = d/2;

  fill(255);
  ellipse(x, y + r / 6, d*1.25f, d2*0.85f);

  fill(100, 100, 255);
  ellipse(x, y, d, d2);
}

class textAnalisis {
  float x, y, w, h, tL;
  String[] t;
  timer ti;
  textAnalisis(float xb, float yb, float wb, float hb, float textLines) {
    x = xb;
    y = yb;
    w = wb;
    h = hb;
    tL = textLines;
    ti = new timer(textLines);
    t = new String[PApplet.parseInt(textLines)];
    for (int i = 0; i <= textLines - 1; i++) {
      t[i] = floor(random(500, 99999))+"-"+floor(random(100, 999999))+""+floor(random(1000, 9999999))+""+floor(random(10000, 999999))
        +""+floor(random(1000, 999999))+"-"+floor(random(10000, 999999))+""+floor(random(10000, 99999))+""+floor(random(1000, 9999))
        +""+floor(random(1000, 999999));
    }
  }

  public void render() {
    textSize(sqrt(square(w) + square(h)) / 20);
    textAlign(CORNER, CENTER);
    if (ti.timercalc()) {
      for (int i = 0; i <= tL - 1; i++) {
        t[i] = floor(random(500, 99999))+"-"+floor(random(100, 999999))+""+floor(random(1000, 9999999))+""+floor(random(10000, 999999))
          +""+floor(random(1000, 999999))+"-"+floor(random(10000, 999999))+""+floor(random(10000, 99999))+""+floor(random(1000, 9999))
          +""+floor(random(1000, 999999));
      }
    }
    for (int i = 0; i <= tL - 1; i++) {
      if (RedAlert) {
        if (floor(ti.T / frameRate) != i) {
          fill(255, 0, 0);
        } else if (floor(ti.T / frameRate) == i) {
          fill(255, 255, 255);
        }
      } else {
        if (floor(ti.T / frameRate) != i) {
          fill(43, 16, 225);
        } else if (floor(ti.T / frameRate) == i) {
          fill(255, 124, 16);
        }
      }
      text(t[i], x, y + (h / tL) * i, w, h / tL - (height / 250));
    }
    textAlign(CENTER, CENTER);
  }
}

class Star {
  float x;
  float y;
  float z;

  float pz;

  float w, h, stroke = 2;

  Star(float wb, float hb) {
    w = wb;
    h = hb;
    x = random(-w, w);
    y = random(-h*2, h*2);
    if (random(0, 100) > 90) {
      z = random(HYPOTNUCE * 1.5f, HYPOTNUCE * 2);
      stroke = random(1, 3);
    } else {
      z = random(HYPOTNUCE / 40, HYPOTNUCE * 1.5f);
      stroke = random(1, 3);
    }
    pz = z;
  }

  public void update() {
    if (warpFactor > 4) {
      z = z - warpFactor * (warpFactor / 2);
    } else {
      z = z - warpFactor * 2;
    }

    if (z < 3) {
      if (random(0, 100) > 90) {
        z = random(HYPOTNUCE * 1.7f, HYPOTNUCE * 3);
        stroke = random(1, 3);
      } else {
        z = random(HYPOTNUCE / 40, HYPOTNUCE * 1.5f);
        stroke = random(1, 3);
      }
      x = random(-w, w);
      y = random(-h, h);
      pz = z;
    }
  }

  public void show() {
    fill(255);
    noStroke();

    float sx = map(x / z, 0, 1, 0, w/2);
    float sy = map(y / z, 0, 1, 0, h/2);

    float px = map(x / pz, 0, 1, 0, w/2);
    float py = map(y / pz, 0, 1, 0, h/2);

    pz = z;

    stroke(255);
    strokeWeight(stroke * (HYPOTNUCE / 1118.03f));
    line(px, py, sx, sy);
    strokeWeight(1);
    stroke(0);
  }
}

class starField {
  Star[] stars = new Star[800];
  float w, h;
  starField() {
    for (int i = 0; i < stars.length; i++) {
      stars[i] = new Star(w, h);
      stars[i].stroke = random(1, 3);
    }
  }

  public void update() {
    for (int i = 0; i < stars.length; i++) {
      stars[i].w = w * 2;
      stars[i].h = h * 2;
      stars[i].update();
      stars[i].show();
    }
  }
}
boolean ggfdsakfj = false, ggfdsakfjd = false, KPRESSED = false;

public void OneCircleButton(float x, float y, float widthb, float heightb) {
  float w = widthb / 4, h = heightb / 4;
  rect(x + (75) * w, y + (0) * h, w * 360, h * 165);
  ellipse(x + (82) * w, y + (82) * h, w * 165, h * 165);
}

public float square(float i) {
  return i*i;
}

public void playSound(SoundFile s) {
  if (isNotMuted) {
    s.play();
  }
}

public void Time(float x, float y, float w, float h, boolean twentyfourhr) {
  String minute = str(minute()), hour = str(hour()), second;
  if (minute() < 10) {
    minute = "0"+floor(minute());
  } else {
    minute = str(minute());
  }
  if (second() < 10) {
    second = "0"+floor(second());
  } else {
    second = str(second());
  }
  if (hour() < 10) {
    hour = "0"+floor(hour());
  } else {
    hour = str(hour());
  }
  if (twentyfourhr) {
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(HYPOTNUCE / 25);
    text(hour+":"+minute+":"+second, x, y, w, h);
  }
}

public boolean keyDetection(char k) {
  if (keyPressed && key == k && !KPRESSED) {
    KPRESSED = true;
    return false;
  } else if (!keyPressed && key == k && KPRESSED) {
    KPRESSED = false;
    return true;
  } else {
    return false;
  }
}

public boolean Button(String stringtext, float x, float y, float w, float h, boolean isRounded, int c) {
  boolean t = false;
  noStroke();
  fill(c);
  textAlign(CENTER, CENTER);
  textSize(HYPOTNUCE / 66);
  if (!isRounded) {
    rect(x, y, w, h, 0);
  } else if (isRounded) {
    rect(x, y, w, h, HYPOTNUCE);
  }
  fill(0);
  text(stringtext, x, y, w, h);
  if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && !ggfdsakfj && mousePressed) {
    ggfdsakfj = true;
    t = true;
  } else if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && ggfdsakfj && !mousePressed) {
    ggfdsakfj = false;
    t = false;
    if (isNotMuted)
      click.play();
  }
  stroke(0);
  return t;
}

public boolean Button(String stringtext, float x, float y, float w, float h, boolean isRounded, int c, SoundFile s) {
  boolean t = false;
  noStroke();
  fill(c);
  textAlign(CENTER, CENTER);
  textSize(HYPOTNUCE / 66);
  if (!isRounded) {
    rect(x, y, w, h, 0);
  } else if (isRounded) {
    rect(x, y, w, h, HYPOTNUCE);
  }
  fill(0);
  text(stringtext, x, y, w, h);
  if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && !ggfdsakfj && mousePressed) {
    ggfdsakfj = true;
    t = true;
  } else if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && ggfdsakfj && !mousePressed) {
    ggfdsakfj = false;
    t = false;
    if (isNotMuted)
      s.play();
  }
  stroke(0);
  return t;
}

public boolean Button(String stringtext, float x, float y, float wp, float hp, float w, float h, int c) {
  boolean t = false;
  noStroke();
  fill(c);
  textAlign(CENTER, CENTER);
  textSize(HYPOTNUCE / 66);
  if (quality > 0) {
    OneCircleButton(x, y, wp, hp);
  } else if (quality == 0) {
    rect(x, y, w, h);
  } 
  //rect(x, y, w, h, RATIOWH*500);
  //}
  fill(0);
  text(stringtext, x, y, w, h);
  if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && !ggfdsakfj && mousePressed) {
    ggfdsakfj = true;
    t = true;
  } else if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && ggfdsakfj && !mousePressed) {
    ggfdsakfj = false;
    t = false;
    if (isNotMuted)
      click.play();
  }
  stroke(0);
  return t;
}

public boolean ButtonM(String stringtext, float x, float y, float wp, float hp, float w, float h, int c) {
  boolean t = false;
  noStroke();
  fill(c);
  textAlign(CENTER, CENTER);
  textSize(HYPOTNUCE / 66);
  if (quality > 0) {
    OneCircleButton(x, y, wp, hp);
  } else if (quality == 0) {
    rect(x, y, w, h);
  }
  //} else if (quality == 1) {
  //rect(x, y, w, h, RATIOWH*500);
  //}
  fill(0);
  text(stringtext, x, y, w, h);
  if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && !ggfdsakfj && mousePressed) {
    ggfdsakfj = true;
    t = true;
  } else if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && ggfdsakfj && !mousePressed) {
    ggfdsakfj = false;
    t = false;
  }
  stroke(0);
  return t;
}

public boolean Button(float x, float y, float w, float h) {
  boolean t = false;
  if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && !ggfdsakfjd && mousePressed) {
    ggfdsakfjd = true;
    t = true;
  } else if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && ggfdsakfjd && !mousePressed) {
    ggfdsakfjd = false;
    t = false;
    if (isNotMuted)
      click.play();
  }
  return t;
}
class miniDisplay {
  float x, y, w, h;
  boolean Enabled = true;
  miniDisplay(float xb, float yb, float wb, float hb) {
    x = xb;
    y = yb;
    w = wb;
    h = hb;
  }

  public void contents() {
  }

  public void render() {
  }
}

class timer {
  String t;
  float T = 0, x, y;
  float timers;
  boolean cts, reset;
  timer(String text, float xb, float yb, float time, boolean clicktoskip) {
    t = text;
    timers = time;
    reset = false;
    x = xb;
    y = yb;
    cts = clicktoskip;
  }

  timer(String text, float xb, float yb, float time, boolean clicktoskip, boolean Reset) {
    t = text;
    timers = time;
    reset = Reset;
    x = xb;
    y = yb;
    cts = clicktoskip;
  }

  timer(float time, boolean Reset) {
    t = "";
    timers = time;
    reset = Reset;
    x = 0;
    y = 0;
    cts = false;
  }

  timer(float time) {
    t = "";
    timers = time;
    reset = true;
    x = 0;
    y = 0;
    cts = false;
  }

  public boolean timercalc() {
    if (cts) {
      if (T >= timers * frameRate|| Button(0, 0, width, height)) {
        if (reset) {
          T = 0;
        }
        return true;
      } else {
        T++;
        return false;
      }
    } else {
      if (T >= timers * frameRate) {
        if (reset) {
          T = 0;
        }
        return true;
      } else {
        T++;
        return false;
      }
    }
  }

  public void render() {
    if (cts) {
      text("Click or wait: " + (round(timers - (T / frameRate)) + 1) + " seconds to " + t, width / x, height / y);
    } else {
      text("Please wait: " + (round(timers - (T / frameRate)) + 1) + " seconds to " + t, width / x, height / y);
    }
  }
}
float tempquality = 0, temptimeoutTime = 0;
float shipX = 0, shipY = 0, shipZ = 0;
float targetX = 500, targetY = 425, targetZ = 940;
boolean tempisNotMuted = false, temptheater = false, temptimeoutEnabled = false, dMplaying = false;

public void viewScreen() {
  if (veiwScreen == 0) {
    if (quality == 2) {
      image(standby, mSSP.x, mSSP.y+mSSP.h, mSSP.w, height - (mSSP.y+mSSP.h));
    } else {
      textSize(HYPOTNUCE / 74.5353333333f);
      FederationSymbol(mSSP.x +mSSP.w / 2, mSSP.y + (height - (mSSP.y+mSSP.h)) / 2 - (height / 50), mSSP.w / 6.0f * 2, (height - (mSSP.y+mSSP.h))/3.5f * 2);
      fill(255);
      text("United Federation of Planets", mSSP.x + mSSP.w/2, (mSSP.y + (height - (mSSP.y+mSSP.h)) / 2 ) + ((height - (mSSP.y+mSSP.h))/3.5f)+height/250);
    }
    v.updateStarCount();
  } else if (veiwScreen == 1) {
    if (Button(mainText[0]+tempisNotMuted, sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250, width / 10, height / 18.75f, true, color(20, 200, 255))) {
      if (tempisNotMuted) {
        tempisNotMuted = false;
      } else {
        tempisNotMuted = true;
      }
    }
    if (Button(mainText[1], sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250 + (height / 18.75f + height / 250) * 1, width / 10, height / 18.75f, true, color(32, 177, 219))) {
      tempquality = 0;
    }
    if (Button(mainText[2], sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250 + (height / 18.75f + height / 250) * 2, width / 10, height / 18.75f, true, color(255, 214, 20))) {
      tempquality = 1;
    }
    if (Button(mainText[3], sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75f + height / 250) * 3, width / 10, height / 18.75f, true, color(102, 155, 243))) {
      tempquality = 2;
    }

    v.updateStarCount();

    textSize(HYPOTNUCE / 66);
    fill(color(57, 17, 230));
    if (quality > 0) {
      rect(sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75f + height / 250) * 4, width / (6+(2/3)), height / 18.75f, RATIOWH*500);
    } else {
      rect(sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75f + height / 250) * 4, width / (6+(2/3)), height / 18.75f, 0);
    }
    fill(0);
    if (tempquality == 2) {
      text(mainText[4], sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75f + height / 250) * 4, width / (6+(2/3)), height / 18.75f);
    }
    if (tempquality == 1) {
      text(mainText[5], sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75f + height / 250) * 4, width / (6+(2/3)), height / 18.75f);
    }
    if (tempquality == 0) {
      text(mainText[6], sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75f + height / 250) * 4, width / (6+(2/3)), height / 18.75f);
    }

    if (Button(mainText[7], sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75f + height / 250) * 5, width / 10.0f, height / 18.75f, true, color(52, 124, 212))) {
      veiwScreen = 11;
    }
    if (Button(mainText[27]+fullscreen, sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75f + height / 250) * 6, width / 5.0f, height / 18.75f, true, color(52, 124, 212))) {
      if (!fullscreen) {
        fullscreen = true;
      } else {
        fullscreen = false;
      }
    }
    if (Button(mainText[30]+temptheater, sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75f + height / 250) * 7, width / 5.0f, height / 18.75f, true, color(52, 124, 212))) {
      if (!temptheater) {
        temptheater = true;
      } else {
        temptheater = false;
      }
    }
    if (Button(mainText[31] + floor(temptimeoutTime), sSP.x + sSP.w + width / 500 + (width / 5.0f + width / 500) * 1.25f, mSSP.y + mSSP.h + height / 250  + (height / 18.75f + height / 250) * 0, width / 5.0f, height / 18.75f, true, color(52, 124, 212))) {
    }
    if (Button("<", sSP.x + sSP.w + width / 500 + (width / 5.0f + width / 500) * 1.25f + (width / 20.0f + width / 500) * 0, mSSP.y + mSSP.h + height / 250  + (height / 18.75f + height / 250) * 1, width / 20.0f, height / 18.75f, true, color(52, 124, 212))) {
      temptimeoutTime -= 10;
    }
    if (Button(">", sSP.x + sSP.w + width / 500 + (width / 5.0f + width / 500) * 1.25f + (width / 20.0f + width / 500) * 1, mSSP.y + mSSP.h + height / 250  + (height / 18.75f + height / 250) * 1, width / 20.0f, height / 18.75f, true, color(52, 124, 212))) {
      temptimeoutTime += 10;
    }
    if (Button(mainText[32] + temptimeoutEnabled, sSP.x + sSP.w + width / 500 + (width / 5.0f + width / 500) * 1.25f, mSSP.y + mSSP.h + height / 250  + (height / 18.75f + height / 250) * 2, width / 5.0f, height / 18.75f, true, color(52, 124, 212))) {
      if (!temptimeoutEnabled) {
        temptimeoutEnabled = true;
      } else {
        temptimeoutEnabled = false;
      }
    }

    if (Button(mainText[35]+load_Debug, sSP.x + sSP.w + width / 500 + (width / 5.0f + width / 500) * 1.25f, mSSP.y + mSSP.h + height / 250  + (height / 18.75f + height / 250) * 3, width / 4.0f, height / 18.75f, true, color(52, 124, 212))) {
      if (!load_Debug) {
        load_Debug = true;
      } else {
        load_Debug = false;
      }
    }

    if (Button(mainText[28], sSP.x + sSP.w + width / 500, height - height / 18.75f - height / 250, width / 10, height / 18.75f, true, color(18, 97, 196))) {
      quality = tempquality;
      isNotMuted = tempisNotMuted;
      theaterMode = temptheater;
      timeoutTime = temptimeoutTime;
      timeout.timers = timeoutTime;
      timeout.T = 0;
      timeoutEnabled = temptimeoutEnabled;
      save();
    }
  } else if (veiwScreen == 2) {
    textAlign(CORNER, CORNER);
    fill(255);
    textSize(HYPOTNUCE / 74.5353333333f);
    text("Build b1.07.07\nThis is a recreation of the Lcars47 OS found on Star Trek. This is also a blend of all of the versions we see on the screen. Most of the Insperation for this project comes from the program Lcars47 from Lcars47.com", mSSP.x, mSSP.y + mSSP.h + width / 250, mSSP.w, sSP.h);
    textAlign(CENTER, CENTER);
  } else if (veiwScreen == 3) {
    // SYS DIRECTORY
    if (Button(mainText[26], width - width / 10 - width / 500, sSP.y, width / 10, height / 15, false, color(70, 200, 255), accept)) {
      scene = 2;
      v.x = 0;
      v.y = 0;
      v.w = width;
      v.h = height;
      if (warpFactor == 0) {
        v.starMult = 1;
      } else {
        v.starMult = 0.1f;
      }
      v.updateStarCount();
    }
    if (Button(mainText[34], width - width / 10 - width / 500, sSP.y + height / 15 + height / 250, width / 10, height / 15, false, color(70, 100, 255), accept)) {
      veiwScreen = 12;
    }

    SDSP.x = mSSP.x;
    SDSP.y = mSSP.y + mSSP.h + height / 250;
    SDSP.w = mSSP.w;
    SDSP.h = tSP.h - SDSP.y - height / 250;
    SDSP.TextSize = HYPOTNUCE / 66;
    SDSP.render();
  } else if (veiwScreen == 5) {
  } else if (veiwScreen == 6) {
    // COMMUNICATIONS
    cMP.x = mSSP.x + sSP.w;
    cMP.y = mSSP.y + height / 8;
    cMP.w = sSP.w;
    cMP.h = sSP.h / 2;

    cMSP.x = cMP.x + cMP.w + width/500;
    cMSP.y = cMP.y;
    cMSP.w = width / 5;
    cMSP.h = width / 100;

    if (Button(mainText[8], cMSP.x, cMSP.y + cMSP.h + height / 250, cMSP.w, cMP.h / cMP.pc, false, color(50, 130, 255))) {
      HFO.play();
    }
    if (Button(mainText[33], cMSP.x, (cMSP.y + cMSP.h + height / 250) + cMP.h/cMP.pc + height / 250, cMSP.w, cMP.h/cMP.pc, false, color(50, 100, 255))) {
    }

    cMP.render();
    cMSP.render();
  } else if (veiwScreen == 7) {
  } else if (veiwScreen == 8) {
  } else if (veiwScreen == 9) {
    if (Button("92-48416", sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250, width / 10, height / 18.75f, true, color(20, 200, 255))) {
      if (dMplaying) {
        dMusic.stop();
        bSounds.loop();
        dMplaying = false;
      } else {
        dMusic.loop();
        bSounds.stop();
        dMplaying = true;
      }
    }
  } else if (veiwScreen == 9.9f) {
    v.starMult = 1;
    if (warpFactor != 0) {
      v.starMult = 0.1f;
      v.updateStarCount();
      v.x = mSSP.x;
      v.y = mSSP.y + mSSP.h + height / 200;
      v.w = mSSP.w - width / 500;
      v.h = height - mSSP.y;
    } else {
      v.starMult = 1;
    }
    veiwScreen = 10;
  } else if (veiwScreen == 10) {
    exteriorViewPort();
  } else if (veiwScreen == 11) {
    if (Button("English", sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75f + height / 250) * 1, width / 10, height / 18.75f, true, color(18, 97, 196))) {
      loadLang(LANG_US);
      LANGUAGE = 0;
    }
    if (Button("日本語", sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75f + height / 250) * 2, width / 10, height / 18.75f, true, color(235, 178, 67))) {
      LANGUAGE = 1;
      loadLang(LANG_JP);
    }
    if (keyDetection('p')) {
      LANGUAGE = 0;
      loadLang(LANG_PEW);
    }
    if (Button(mainText[9], sSP.x + sSP.w + width / 500, height - height / 18.75f - height / 250, width / 10, height / 18.75f, true, color(18, 97, 196))) {
      veiwScreen = 1;
    }
  } else if (veiwScreen == 12) {
    navigation();
  }
}
class Login {
  float x, y, wc;
  String p;
  String typed = "";
  boolean pressedT = false;
  timer t = new timer(1, false);

  Login (String password, float xb, float yb, float wantedScene) {
    p = password;
    x = xb;
    y = yb;
    wc = wantedScene;
  }

  public void compare() {
    if (!theaterMode) {
      if (((typed.equals(p) == true) || (typed.equals("cfopi") || typed.equals("command function override pi"))) && keyDetection(ENTER)) {
        scene = wc;
        bSounds.loop();
        println(wc);
        v.x = mSSP.x;
        v.y = sSP.y;
        v.w = mSSP.w - width / 500;
        v.h = sSP.h - height / 250;
        v.updateStarCount();
        len = 0;
        if (isNotMuted) {
          accept.play();
        }
      } else if (typed.equals("debug") && keyDetection(ENTER)) {
        scene = 400;
        len = 0;
        if (isNotMuted) {
          accept.play();
        }
        println("debug");
      } else if (typed.equals("exit") && keyDetection(ENTER)) {
        scene = -2;
      } else if (typed.equals("settings") && keyDetection(ENTER)) {
        scene = 1;
        veiwScreen = 1;
        len = 0;
        if (isNotMuted) {
          accept.play();
        }
      } else if (keyDetection(ENTER)) {
        if (isNotMuted) {
          fail.play();
        }
      }
    } else {
      if (t.timercalc()) {
        if (typed.equals("exit") && keyDetection(ENTER)) {
          scene = -2;
          powerDown.play();
        } else if (typed.equals("settings") && keyDetection(ENTER)) {
          scene = 1;
          veiwScreen = 1;
          len = 0;
          if (isNotMuted) {
            accept.play();
          }
        } else if (keyDetection(ENTER) || Button(0, 0, width, height)) {
          len = 0;
          if (isNotMuted) {
            accept.play();
          }
          scene = wc;
        } else if (mouseX != pmouseX || mouseY != pmouseY) {
          if (isNotMuted) {
            accept.play();
          }
          len = 0;
          scene = wc;
          bSounds.loop();
          t.T = 0;
        }
      }
    }
  }
  int len = typed.length();
  public void type() {
    if (keyPressed && !pressedT) {
      if (key != BACKSPACE && key != ENTER && key != SHIFT) {
        typed += key;
        len = typed.length();
      } else if (key == BACKSPACE) {
        typed = typed.substring(0, max(0, len - 1));
        len = typed.length();
      }
      pressedT = true;
    } else if (!keyPressed && pressedT) {
      pressedT = false;
    }
  }

  public void render() {
    fill(255);
    textSize(15);
    textSize(HYPOTNUCE / 25);
    textAlign(CENTER, CENTER);
    text(typed, x, y);
  }
}
float scene = -1, veiwScreen = 0, miniScreen = 0, logoZoomin = 100, fade = 250;

timer exit = new timer("exit", 100, 1.1f, 5, false);
timer start = new timer("start", 100, 1.1f, 5, true);

public void scenes() {
  if (scene != -2 && scene != -1 && scene != 0 && timeoutEnabled) {
    if (timeout.timercalc()) {
      scene = 0;
      l.typed = "";
    }
    if (keyPressed || mouseX != pmouseX || mouseY != pmouseY || mousePressed) {
      timeout.T = 0;
    }
  }
  if (scene == -2) {
    background(0);
    if (logoZoomin == 100 && isNotMuted) {
      powerDown.play();
    }
    if (logoZoomin >= 10) {
      logoZoomin -= width / 1000.0f;
    }
    textSize(HYPOTNUCE / 25);
    if (quality == 2) {
      imageMode(CENTER);
      image(logo, width / 1.3f, height / 2, width / (logoZoomin / 3), height / (logoZoomin / 4));
      imageMode(CORNER);
    } else {
      FederationSymbol(width / 1.3f, height / 2, width / (logoZoomin / 3) / 1.5f, height / (logoZoomin / 4));
    }
    fill(235, 178, 67);
    rect(width / 90, height / 40, width - (width / 90) * 2, height / 20, 10);
    rect(width / 90, height / 1.08101111111f, width - (width / 90) * 2, height / 20, 10);
    fill(255);
    textAlign(CORNER, CORNER);
    text("Credits:\nCreator: Codeing Network\nSounds Provided by:\ntrekcore.com, lcarscom.net,\nBensound.com\nBased off Star Trek (c)CBS", width / 100, height / 10, width - 4, height / 1.1f - height / 20);

    if (exit.timercalc()) {
      exit();
    }
    exit.render();


    textAlign(CENTER, CENTER);
  } else if (scene == -1) {
    
    background(0);
    if (logoZoomin >= 10) {
      logoZoomin -= width / 1000.0f;
    }
    textSize(HYPOTNUCE / 25);
    if (quality == 2) {
      imageMode(CENTER);
      image(logo, width / 1.3f, height / 2, width / (logoZoomin / 3), height / (logoZoomin / 4));
      imageMode(CORNER);
    } else {
      FederationSymbol(width / 1.3f, height / 2, width / (logoZoomin / 3) / 1.5f, height / (logoZoomin / 4));
    }
    textAlign(CORNER, CORNER);
    fill(235, 178, 67);
    rect(width / 90, height / 40, width - (width / 90) * 2, height / 20, 10);
    rect(width / 90, height / 1.08101111111f, width - (width / 90) * 2, height / 20, 10);
    fill(0, 150, 255);
    text("Lcars 47 Database Access Codes:\nLogin Codes: omega-alpha-nine", width / 100, height / 10, width - width / 500, height - height / 20);

    if (start.timercalc()) {
      scene = 0;
    }
    start.render();
    textAlign(CENTER, CENTER);
  } else if (scene == 0) {
    logoZoomin = 100;
    l.x = width / 2;
    l.y = height / 1.25f;
    fade = 250;
    fill(255);

    if (quality == 2) {
      imageMode(CENTER);
      image(logo, width / 2, height / 2, width / 3, height / 2);
      imageMode(CORNER);
    } else if (quality != 2) {
      fill(100, 100, 255);
      FederationSymbol(width / 2, height / 2, width / 5, height / 2.5f);
    }
    l.type();
    l.render();
    l.compare();
    fill(0, 150, 255);
    rect(width / 90, height / 40, width - (width / 90) * 2, height / 20, 10);
    rect(width / 90, height / 1.08101111111f, width - (width / 90) * 2, height / 20, 10);
    v.updateStarCount();
  } else if (scene == 1) { 
    mSP.x = width / 5.2f;
    mSP.h = height;
    mSP.w = width / 11.4f;

    sSP.x = width / 3.488372093023256f;
    sSP.y = height / 2.2641509243396226f;
    sSP.h = height - sSP.y;
    sSP.w = width / 11.25f;

    tSP.x = width / 3.488372093023256f;
    //tSP.h = height / 4;
    tSP.h = sSP.y;
    tSP.w = width / 11.25f;

    mTA.x = mSSP.x;
    mTA.y = tSP.y;
    mTA.w = mSSP.w / 1.5f;
    mTA.h = mSSP.y;

    mSSP.x = sSP.x + sSP.w + width / 500;
    mSSP.y = sSP.y - mSSP.h - height / 15;
    mSSP.w = width - mSSP.x;
    mSSP.h = height / 50;
    viewScreen();

    if (quality == 2) {
      image(imgsur, width / 213, height / 142, width / 5.5f, height / 4.1f);
      image(logo, width / 56, height / 29, width / 6.4f, height / 5.6f);
    } else if (quality == 1) {
      fill(100, 150, 255);
      rect(width / 213, height / 142, width / 5.5f, height / 4.1f, HYPOTNUCE / 50);
      fill(0);
      rect(width / 100, height / 142, width / 5.9f, height / 4.1f, HYPOTNUCE / 50);

      FederationSymbol(width / 213 + ((width / 5.5f)/2), height / 142 + ((height / 4.1f)/2), width / 8.0f, height / 4.5f);
    } else if (quality == 0) {
      FederationSymbol(width / 213 + ((width / 5.5f)/2), height / 142 + ((height / 4.1f)/2), width / 8.0f, height / 4.5f);
    }

    v.x = mSSP.x;
    v.y = mSSP.y + mSSP.h + height / 250;
    v.w = mSSP.w - width / 500;
    v.h = height - mSSP.y - height / 250;

    if (miniScreen == 0) {
      sTA.x = width / 254.0f + (width / 250);
      sTA.y = height / 2.0f;
      sTA.w = (width / 5.4f);
      sTA.h = height / 5.5f - (width / (250 / 2));

      sTA.render();
    } else if (miniScreen == 1) {
      Time(width / 254.0f + (width / 250), height / 2.0f, width / 5.4f, height / 5.5f - (width / (250/2)), true);
    } else if (miniScreen == 2) {
      textAlign(CENTER, CENTER);
      fill(255);
      textSize(HYPOTNUCE / 25);
      text("FPS: "+round(frameRate), width / 254.0f, height / 2.0f, width / 5.4f, height / 5.5f);
    }
    if (RedAlert) {
      veiwScreen = 0;
      if (Button("54-875977", width / 180, height / 3.900f, width / 1232.876f, height / 750.000f, width / 11.25f, height / 18.75f, color(255, 10, 2))) {
      }
      if (Button("34-873976", width / 180, height / 3.157f, width / 1232.876f, height / 750.000f, width / 11.25f, height / 18.75f, color(214, 8, 32))) {
      }
      if (Button("92-438629", width / 180, height / 2.631f, width / 1232.876f, height / 750.000f, width / 11.25f, height / 18.75f, color(255, 21, 39))) {
      }
      if (Button("47-384209", width / 180, height / 2.272f, width / 1232.876f, height / 750.000f, width / 11.25f, height / 18.75f, color(255))) {
      }


      if (Button("25-752841", width / 180 + width / 11.25f + width / 450, height / 3.900f, width / 11.25f, height / 18.75f, false, color(216, 8, 28))) {
      }
      if (Button("51-482361", width / 180 + width / 11.25f + width / 450, height / 3.157f, width / 11.25f, height / 18.75f, false, color(252, 2, 12))) {
        RedAlert = true;
      }
      if (Button("37-589735", width / 180 + width / 11.25f + width / 450, height / 2.631f, width / 11.25f, height / 18.75f, false, color(255, 238, 235))) {
      }
      if (Button("56-985324", width / 180 + width / 11.25f + width / 450, height / 2.272f, width / 11.25f, height / 18.75f, false, color(219, 42, 32))) {
        RedAlert = false;
      }
      if (!theaterMode) {
        if (Button(mainText[18], width / 180, height / 1.142f, width / 1232.876f, height / 750.000f, width / 11.25f, height / 18.75f, color(255, 32, 15))) {
          bSounds.stop();
          scene = -2;
        }
      } else {
        if (Button("98-348362", width / 180, height / 1.142f, width / 1232.876f, height / 750.000f, width / 11.25f, height / 18.75f, color(231, 3, 5))) {
        }
      }
      if (Button(mainText[17], width / 180, height / 1.229f, width / 1232.876f, height / 750.000f, width / 11.25f, height / 18.75f, color(255, 33, 100))) {
        if (miniScreen != 1) {
          miniScreen = 1;
        } else if (miniScreen == 1) {
          miniScreen = 0;
        }
      }
      if (Button(mainText[10], width / 180, height / 1.327f, width / 1232.876f, height / 750.000f, width / 11.25f, height / 18.75f, color(255, 31, 23))) {
        scene = 0;
        bSounds.stop();
        l.typed = "";
      }
      if (Button(mainText[11], width / 180, height / 1.449f, width / 1232.876f, height / 750.000f, width / 11.25f, height / 18.75f, color(255, 42, 13))) {
        veiwScreen = 0;
        miniScreen = 0;
      }
      if (!theaterMode) {
        if (Button(mainText[12], width / 180 + width / 11.25f + width / 450, height / 1.142f, width / 11.25f, height / 18.75f, false, color(132, 1, 3))) {
          link("http://youtube.com");
        }
      } else {
        if (Button("45-213456", width / 180 + width / 11.25f + width / 450, height / 1.142f, width / 11.25f, height / 18.75f, false, color(255, 0, 3))) {
        }
      }
      if (!theaterMode) {
        if (Button(mainText[13], width / 180 + width / 11.25f + width / 450, height / 1.229f, width / 11.25f, height / 18.75f, false, color(252, 23, 12))) {
          veiwScreen = 1;
        }
      } else {
        if (Button(mainText[16], width / 180 + width / 11.25f + width / 450, height / 1.229f, width / 11.25f, height / 18.75f, false, color(252, 2, 12))) {
        }
      }
      if (Button(mainText[14], width / 180 + width / 11.25f + width / 450, height / 1.327f, width / 11.25f, height / 18.75f, false, color(231, 1, 3))) {
        if (veiwScreen != 2) {
          veiwScreen = 2;
        } else if (veiwScreen == 2) {
          veiwScreen = 0;
        }
        if (miniScreen != 2) {
          miniScreen = 2;
        } else if (miniScreen == 2) {
          miniScreen = 0;
        }
      }

      //if (quality == 2) {
      if (Button(mainText[15], width / 180 + width / 11.25f + width / 450, height / 1.449f, width / 11.25f, height / 18.75f, false, color(255, 42, 12))) {
        if (veiwScreen != 10) {
          veiwScreen = 9.9f;
        } else if (veiwScreen == 10) {
          veiwScreen = 0;
        }
      }
      //} else if (quality != 2) {
      //if (Button(mainText[16], width / 180 + width / 11.25 + width / 450, height / 1.449, width / 11.25, height / 18.75, false, color(255, 42, 19))) {
      //fail.play();
      //}
      //}
    } else {
      if (Button("54-875977", width / 180, height / 3.900f, width / 1232.876f, height / 750.000f, width / 11.25f, height / 18.75f, color(20, 120, 200))) {
      }
      if (Button("34-873976", width / 180, height / 3.157f, width / 1232.876f, height / 750.000f, width / 11.25f, height / 18.75f, color(16, 8, 179))) {
      }
      if (Button("92-438629", width / 180, height / 2.631f, width / 1232.876f, height / 750.000f, width / 11.25f, height / 18.75f, color(15, 179, 232))) {
      }
      if (Button("47-384209", width / 180, height / 2.272f, width / 1232.876f, height / 750.000f, width / 11.25f, height / 18.75f, color(72, 139, 239))) {
      }


      if (Button("25-752841", width / 180 + width / 11.25f + width / 450, height / 3.900f, width / 11.25f, height / 18.75f, false, color(96, 137, 168))) {
      }
      if (Button("51-482361", width / 180 + width / 11.25f + width / 450, height / 3.157f, width / 11.25f, height / 18.75f, false, color(252, 221, 12))) {
        RedAlert = false;
      }
      if (Button("37-589735", width / 180 + width / 11.25f + width / 450, height / 2.631f, width / 11.25f, height / 18.75f, false, color(0, 238, 235))) {
      }
      if (Button("56-985324", width / 180 + width / 11.25f + width / 450, height / 2.272f, width / 11.25f, height / 18.75f, false, color(9, 42, 243))) {
        RedAlert = true;
      }
      if (!theaterMode) {
        if (Button(mainText[18], width / 180, height / 1.142f, width / 1232.876f, height / 750.000f, width / 11.25f, height / 18.75f, color(96, 137, 168))) {
          scene = -2;
          bSounds.stop();
        }
      } else {
        if (Button("98-348362", width / 180, height / 1.142f, width / 1232.876f, height / 750.000f, width / 11.25f, height / 18.75f, color(96, 137, 168))) {
        }
      }
      if (Button(mainText[17], width / 180, height / 1.229f, width / 1232.876f, height / 750.000f, width / 11.25f, height / 18.75f, color(252, 221, 12))) {
        if (miniScreen != 1) {
          miniScreen = 1;
        } else if (miniScreen == 1) {
          miniScreen = 0;
        }
      }
      if (Button(mainText[10], width / 180, height / 1.327f, width / 1232.876f, height / 750.000f, width / 11.25f, height / 18.75f, color(0, 238, 235))) {
        scene = 0;
        l.typed = "";
      }
      if (Button(mainText[11], width / 180, height / 1.449f, width / 1232.876f, height / 750.000f, width / 11.25f, height / 18.75f, color(9, 42, 243))) {
        veiwScreen = 0;
        miniScreen = 0;
      }
      if (!theaterMode) {
        if (Button(mainText[12], width / 180 + width / 11.25f + width / 450, height / 1.142f, width / 11.25f, height / 18.75f, false, color(96, 137, 168))) {
          link("http://youtube.com");
        }
      } else {
        if (Button("45-213456", width / 180 + width / 11.25f + width / 450, height / 1.142f, width / 11.25f, height / 18.75f, false, color(96, 137, 168))) {
        }
      }
      if (!theaterMode) {
        if (Button(mainText[13], width / 180 + width / 11.25f + width / 450, height / 1.229f, width / 11.25f, height / 18.75f, false, color(252, 221, 12))) {
          veiwScreen = 1;
        }
      } else {
        if (Button(mainText[16], width / 180 + width / 11.25f + width / 450, height / 1.229f, width / 11.25f, height / 18.75f, false, color(252, 221, 12))) {
        }
      }
      if (Button(mainText[14], width / 180 + width / 11.25f + width / 450, height / 1.327f, width / 11.25f, height / 18.75f, false, color(0, 238, 235))) {
        if (veiwScreen != 2) {
          veiwScreen = 2;
        } else if (veiwScreen == 2) {
          veiwScreen = 0;
        }
        if (miniScreen != 2) {
          miniScreen = 2;
        } else if (miniScreen == 2) {
          miniScreen = 0;
        }
      }

      //if (quality == 2) {
      if (Button(mainText[15], width / 180 + width / 11.25f + width / 450, height / 1.449f, width / 11.25f, height / 18.75f, false, color(9, 42, 243))) {
        if (veiwScreen != 10) {
          veiwScreen = 9.9f;
          v.updateStarCount();
        } else if (veiwScreen == 10) {
          veiwScreen = 0;
        }
      }
      //} else if (quality != 2) {
      //if (Button(mainText[16], width / 180 + width / 11.25 + width / 450, height / 1.449, width / 11.25, height / 18.75, false, color(9, 42, 243))) {
      //}
      //}
    }

    stroke(0);
    textAlign(CENTER, CENTER);
    mSP.render();
    mSP.InteractiveV(mSPView);
    sSP.render();
    sSP.InteractiveV(new float[PApplet.parseInt(sSP.pc)]);
    tSP.render();
    tSP.InteractiveV(new float[PApplet.parseInt(tSP.pc)]);
    mTA.render();
    mSSP.render();
    if (fade > 0) {
      fill(0, 0, 0, fade);
      rect(0, 0, width, height);
      if (frameRate > 30) {
        fade -= 15;
      } else if (frameRate < 30) {
        fade -= 30;
      }
    }
  } else if (scene == 2) {
    if (warpFactor > 0.11f) {
      ViewScreenLarge.w = width;
      ViewScreenLarge.h = height;
      translate(width / 2, height / 2);
      ViewScreenLarge.update();
      translate(-(width / 2), -(height / 2));
    } else {
      v.x = 0;
      v.y = 0;
      v.w = width;
      v.h = height;
      v.render();

      ViewScreenLarge.w = width;
      ViewScreenLarge.h = height;
      translate(width / 2, height / 2);
      ViewScreenLarge.update();
      translate(-(width / 2), -(height / 2));
    }

    fill(0, 150, 255);
    rect(width / 90, height / 40, width - (width / 90) * 2, height / 20, HYPOTNUCE*500);
    if (Button(mainText[29], width / 90, height / 1.08101111111f, width - (width / 90) * 2, height / 20, true, color(0, 150, 255))) {
      scene = 1;
      v.x = mSSP.x;
      v.y = sSP.y;
      v.w = mSSP.w - width / 500;
      v.h = height - mSSP.y - height / 250;
      v.updateStarCount();
    }
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "LCARS_2339" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
