void CornerPeice(float x, float y, float widthb, float heightb) {
  float w = widthb / 4, h = heightb / 4;
  rect(x + (0) * w, y + (0) * h, w * 0, h * 0);
  rect(x + (0) * w, y + (0) * h, w * 0, h * 0);
  rect(x + (0) * w, y + (0) * h, w * 0, h * 0);
  rect(x + (0) * w, y + (0) * h, w * 0, h * 0);
  rect(x + (0) * w, y + (585) * h, w * 315, h * -270);
  rect(x + (0) * w, y + (570) * h, w * 315, h * 30);
  rect(x + (330) * w, y + (60) * h, w * 270, h * 255);
  rect(x + (330) * w, y + (0) * h, w * 270, h * 60);
  rect(x + (315) * w, y + (315) * h, w * 15, h * 90);
  rect(x + (330) * w, y + (315) * h, w * 15, h * 60);
  rect(x + (345) * w, y + (315) * h, w * 15, h * 30);
  rect(x + (360) * w, y + (315) * h, w * 30, h * 15);
  rect(x + (390) * w, y + (315) * h, w * 30, h * 15);
  rect(x + (375) * w, y + (330) * h, w * -15, h * 15);
  rect(x + (375) * w, y + (330) * h, w * 15, h * 15);
  rect(x + (345) * w, y + (345) * h, w * 15, h * 0);
  rect(x + (345) * w, y + (345) * h, w * 15, h * 15);
  rect(x + (330) * w, y + (375) * h, w * 15, h * 15);
  rect(x + (315) * w, y + (405) * h, w * 15, h * 15);
  rect(x + (105) * w, y + (0) * h, w * 225, h * 315);
  rect(x + (0) * w, y + (120) * h, w * 120, h * 195);
  rect(x + (15) * w, y + (90) * h, w * 15, h * 30);
  rect(x + (30) * w, y + (60) * h, w * 15, h * 30);
  rect(x + (45) * w, y + (45) * h, w * 15, h * 15);
  rect(x + (60) * w, y + (30) * h, w * 30, h * 15);
  rect(x + (90) * w, y + (15) * h, w * 15, h * 15);
  rect(x + (60) * w, y + (30) * h, w * 45, h * 90);
  rect(x + (30) * w, y + (60) * h, w * 30, h * 60);
  rect(x + (90) * w, y + (0) * h, w * 15, h * 15);
  rect(x + (75) * w, y + (0) * h, w * 15, h * 15);
  rect(x + (60) * w, y + (15) * h, w * 15, h * 15);
  rect(x + (45) * w, y + (15) * h, w * 15, h * 15);
  rect(x + (30) * w, y + (30) * h, w * 15, h * 15);
  rect(x + (15) * w, y + (45) * h, w * 15, h * 30);
  rect(x + (0) * w, y + (75) * h, w * 15, h * 45);
  rect(x + (15) * w, y + (75) * h, w * 15, h * 15);
  rect(x + (30) * w, y + (45) * h, w * 15, h * 15);
  rect(x + (45) * w, y + (30) * h, w * 15, h * 15);
  rect(x + (75) * w, y + (15) * h, w * 15, h * 15);
}


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
      textAlign(CORNER, CORNER);
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
      textAlign(CORNER, CORNER);
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
  float[] offx = new float[50], offy = new float[50];
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
    generateStars();
  }

  void generateStars() {
    for (int i = 0; i <= starAmount - 1; i++) {
      offx[i] = random(0, w);
      offy[i] = random(0, h);
    }
  }

  void render() {
    if (sT == 0) {
      for (int i = 0; i <= starAmount - 1; i++) {
        fill(255);
        ellipse(x + (offx[i] * (width / 1000.0)), y + (offy[i] * (height / 500.0)), width / 500, height / 250);
      }
    }
  }
}
