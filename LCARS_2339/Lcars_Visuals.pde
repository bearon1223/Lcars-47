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
      z = random(HYPOTNUCE * 1.5, HYPOTNUCE * 2);
      stroke = random(1, 3);
    } else {
      z = random(HYPOTNUCE / 40, HYPOTNUCE * 1.5);
      stroke = random(1, 3);
    }
    pz = z;
  }

  void update() {
    z = z - warpFactor * 2;

    if (z < random(1, 5)) {
      if (random(0, 100) > 90) {
        z = random(HYPOTNUCE * 1.5, HYPOTNUCE * 2);
        stroke = random(1, 3);
      } else {
        z = random(HYPOTNUCE / 40, HYPOTNUCE * 1.5);
        stroke = random(1, 3);
      }
      x = random(-w, w);
      y = random(-h, h);
      pz = z;
    }
  }

  void show() {
    fill(255);
    noStroke();

    float sx = map(x / z, 0, 1, 0, w/2);
    float sy = map(y / z, 0, 1, 0, h/2);

    float px = map(x / pz, 0, 1, 0, w/2);
    float py = map(y / pz, 0, 1, 0, h/2);

    pz = z;

    stroke(255);
    strokeWeight(stroke * (HYPOTNUCE / 1118.03));
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

  void update() {
    for (int i = 0; i < stars.length; i++) {
      stars[i].w = w * 2;
      stars[i].h = h * 2;
      stars[i].update();
      stars[i].show();
    }
  }
}
