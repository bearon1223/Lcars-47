class panel {
  float x, y, w, h, pc;
  color[] colors;
  String[] texts;
  panel(float xb, float yb, float wb, float hb, float panelcount, String[] textsb) {
    x = xb;
    y = yb;
    w = wb;
    h = hb;
    pc = panelcount;
    texts = textsb;
    colors = new color[int(panelcount)];
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
    texts = new String[int(panelcount)];
    colors = new color[int(panelcount)];
    for (int i = 0; i <= panelcount - 1; i++) {
      texts[i] = floor(random(50, 99)) + "-" + floor(random(200000, 999999));
    }
    for (int i = 0; i <= panelcount - 1; i++) {
      colors[i] = color(random(20, 70), random(100, 200), random(200, 255));
    }
  }

  void render() {
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

  void InteractiveV(float[] panelScene) {
    for (int i = 0; i <= pc - 1; i++) {
      if (Button(x, y+((h / pc) * i), w, h / pc - (height / 250))) {
        veiwScreen = panelScene[i];
      }
    }
  }

  void InteractiveS(float[] panelScene) {
    for (int i = 0; i <= pc - 1; i++) {
      if (Button(x, y+((h / pc) * i), w, h / pc - (height / 250))) {
        scene = panelScene[i];
      }
    }
  }
}

class panelS {
  float x, y, w, h, pc;
  color[] colors;
  String[] texts;
  float TextSize = HYPOTNUCE / 130;
  panelS(float xb, float yb, float wb, float hb, float panelcount, String[] textsb) {
    x = xb;
    y = yb;
    w = wb;
    h = hb;
    pc = panelcount;
    texts = textsb;
    colors = new color[int(panelcount)];
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
    colors = new color[int(panelcount)];
    texts = new String[int(panelcount)];
    for (int i = 0; i <= panelcount - 1; i++) {
      texts[i] = floor(random(50, 99)) + "-" + floor(random(200000, 999999));
    }
    for (int i = 0; i <= panelcount - 1; i++) {
      colors[i] = color(random(20, 70), random(100, 200), random(200, 255));
    }
  }

  void render() {
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

  void InteractiveV(float[] panelScene) {
    for (int i = 0; i <= pc - 1; i++) {
      if (Button(x + ((w / pc) * i), y, w / pc - (width / 500), h)) {
        veiwScreen = panelScene[i];
      }
    }
  }

  void InteractiveS(float[] panelScene) {
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
    if (quality == 0) {
      starAmount = 50;
    }
    if (quality == 1) {
      starAmount = 100;
    }
    if (quality == 2) {
      starAmount = 500;
    }
  }

  void updateStarCount() {
    if (quality == 0) {
      starAmount = 100 * starMult;
    }
    if (quality == 1) {
      starAmount = 500 * starMult;
    }
    if (quality == 2) {
      starAmount = 1000 * starMult;
    }
    offx = new float[int(starAmount)];
    offy = new float[int(starAmount)];
    offs = new float[int(starAmount)];
    generateStars();
  }

  void generateStars() {
    for (int i = 0; i <= starAmount - 1; i++) {
      offx[i] = random(0, w);
      offy[i] = random(0, h);
      offs[i] = random(0.75, 2);
    }
  }

  void render() {
    if (sT == 0) {
      noStroke();
      for (int i = 0; i <= starAmount - 1; i++) {
        fill(255);
        ellipse(x + (offx[i] * (width / 1000.0)), y + (offy[i] * (height / 500.0)), offs[i] * (w / 500), offs[i] * (h / 250));
      }
      stroke(0);
    }
  }
}

void FederationSymbol(float x, float y, float d) {
  float r = d/2;

  fill(255);
  ellipse(x, y + r / 6, d*1.25, d*0.85);

  fill(100, 100, 255);
  ellipse(x, y, d, d);
}

void FederationSymbol(float x, float y, float d, float d2) {
  float r = d/2;

  fill(255);
  ellipse(x, y + r / 6, d*1.25, d2*0.85);

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
    t = new String[int(textLines)];
    for (int i = 0; i <= textLines - 1; i++) {
      t[i] = floor(random(500, 99999))+"-"+floor(random(100, 999999))+""+floor(random(1000, 9999999))+""+floor(random(10000, 999999))
        +""+floor(random(1000, 999999))+"-"+floor(random(10000, 999999))+""+floor(random(10000, 99999))+""+floor(random(1000, 9999))
        +""+floor(random(1000, 999999));
    }
  }

  void render() {
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
  // I create variables to specify the x and y of each star.
  float x;
  float y;
  // I create "z", a variable I'll use in a formula to modify the stars position.
  float z;

  // I create an other variable to store the previous value of the z variable.
  // (the value of the z variable at the previous frame).
  float pz;
  
  float w, h;

  Star(float wb, float hb) {
    w = wb;
    h = hb;
    // I place values in the variables
    x = random(-w, w);
    // note: height and width are the same: the canvas is a square.
    y = random(-h*2, h*2);
    // note: the z value can't exceed the width/2 (and height/2) value,
    // beacuse I'll use "z" as divisor of the "x" and "y",
    // whose values are also between "0" and "width/2".
    z = random(HYPOTNUCE/2.5);
    // I set the previous position of "z" in the same position of "z",
    // which it's like to say that the stars are not moving during the first frame.
    pz = z;
  }

  void update() {
    // In the formula to set the new stars coordinates
    // I'll divide a value for the "z" value and the outcome will be
    // the new x-coordinate and y-coordinate of the star.
    // Which means if I decrease the value of "z" (which is a divisor),
    // the outcome will be bigger.
    // Wich means the more the speed value is bigger, the more the "z" decrease,
    // and the more the x and y coordinates increase.
    // Note: the "z" value is the first value I updated for the new frame.
    z = z - (warpFactor)*2;
    // when the "z" value equals to 1, I'm sure the star have passed the
    // borders of the canvas( probably it's already far away from the borders),
    // so i can place it on more time in the canvas, with new x, y and z values.
    // Note: in this way I also avoid a potential division by 0.
    if (z < random(1, 5)) {
      z = random(HYPOTNUCE/4, HYPOTNUCE);
      x = random(-w, w);
      y = random(-h, h);
      pz = z;
    }
  }

  void show() {
    fill(255);
    noStroke();

    // with theese "map", I get the new star positions
    //the division x / z get a number between 0 and a very high number,
    // we map this number (proportionally to a range of 0 - 1), inside a range of 0 - width/2.
    // In this way we are sure the new coordinates "sx" and "sy" move faster at each frame
    // and which they finish their travel outside of the canvas (they finish when "z" is less than a).

    float sx = map(x / z, 0, 1, 0, w/2);
    float sy = map(y / z, 0, 1, 0, h/2);

    // I use the z value to increase the star size between a range from 0 to 16.
    //float r = map(z, 0, HYPOTNUCE, 16, 0);
    //ellipse(sx, sy, r, r);

    // Here i use the "pz" valute to get the previous position of the stars,
    // so I can draw a line from the previous position to the new (current) one.
    float px = map(x / pz, 0, 1, 0, w/2);
    float py = map(y / pz, 0, 1, 0, h/2);

    // Placing here this line of code, I'm sure the "pz" value are updated after the
    // coordinates are already calculated; in this way the "pz" value is always equals
    // to the "z" value of the previous frame.
    pz = z;

    stroke(255);
    strokeWeight(2);
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
    }
  }

  void update() {
    for (int i = 0; i < stars.length; i++) {
      stars[i].w = w;
      stars[i].h = h;
      stars[i].update();
      stars[i].show();
    }
  }
}
