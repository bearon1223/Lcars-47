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
    fill(255);
    //rect(x, y, w, h);
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
    fill(255);
    //rect(x, y, w, h);
    for (int i = 0; i <= pc - 1; i++) {
      textAlign(CENTER, CENTER);
      textSize(HYPOTNUCE / 170);
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
  float x, y, w, h, sT, starAmount, multipier;
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

  void updateStarCound() {
    if (quality == 0) {
      starAmount = 100;
    }
    if (quality == 1) {
      starAmount = 500;
    }
    if (quality == 2) {
      starAmount = 1000;
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
      offs[i] = random(0.75, 3);
    }
  }

  void render() {
    if (sT == 0) {
      for (int i = 0; i <= starAmount - 1; i++) {
        fill(255);
        ellipse(x + (offx[i] * (width / 1000.0)), y + (offy[i] * (height / 500.0)), offs[i] * multipier, offs[i] * multipier);
      }
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
      t[i] = floor(random(100000, 999999))+"-"+floor(random(100000, 999999))+""+floor(random(100000, 999999))+""+floor(random(100000, 999999))
        +""+floor(random(100000, 999999))+"-"+floor(random(100000, 999999))+""+floor(random(100000, 999999))+""+floor(random(100000, 999999))
        +""+floor(random(100000, 999999))+"-"+floor(random(100000, 999999))+"-"+floor(random(100000, 999999))+""+floor(random(100000, 999999))
        +""+floor(random(100000, 999999));
    }
  }

  void render() {
    textSize(sqrt(square(w) + square(h)) / 36);
    textAlign(CORNER, CENTER);
    if (ti.timercalc()) {
      for (int i = 0; i <= tL - 1; i++) {
        t[i] = floor(random(100000, 999999))+"-"+floor(random(100000, 999999))+""+floor(random(100000, 999999))+""+floor(random(100000, 999999))
          +""+floor(random(100000, 999999))+"-"+floor(random(100000, 999999))+""+floor(random(100000, 999999))+""+floor(random(100000, 999999))
          +""+floor(random(100000, 999999))+"-"+floor(random(100000, 999999))+"-"+floor(random(100000, 999999))+""+floor(random(100000, 999999))
          +""+floor(random(100000, 999999));
      }
    }
    for (int i = 0; i <= tL - 1; i++) {
      if (floor(ti.T / (frameRate / 0.999)) != i) {
        fill(222, 10, 255);
      } else if (floor(ti.T / (frameRate / 0.999)) == i) {
        fill(50, 54, 247);
      }
      text(t[i], x, y + (h / tL) * i, w, h / tL - (height / 250));
    }
    textAlign(CENTER, CENTER);
  }
}
