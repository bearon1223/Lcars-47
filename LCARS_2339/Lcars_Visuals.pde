class panel {
  float x, y, w, h, pc;
  color[] colors = new color[100];
  String[] texts = new String[1000];
  panel(float xb, float yb, float wb, float hb, float panelcount, String[] textsb) {
    x = xb;
    y = yb;
    w = wb;
    h = hb;
    pc = panelcount;
    texts = textsb;
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
    texts = new String[1000];
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
      rect(x, y+((h / pc) * i), w, h / pc - (height / 300));
      fill(0);
      text(texts[i], x, y + (h / pc) * i, w, h / pc - (height / 300));
      textAlign(CORNER, CORNER);
    }
  }

  void InteractiveV(float[] panelScene) {
    for (int i = 0; i <= pc - 1; i++) {
      if (Button(x, y+((h / pc) * i), w, h / pc - (height / 300))) {
        veiwScreen = panelScene[i];
      }
    }
  }

  void InteractiveS(float[] panelScene) {
    for (int i = 0; i <= pc - 1; i++) {
      if (Button(x, y+((h / pc) * i), w, h / pc - (height / 300))) {
        scene = panelScene[i];
      }
    }
  }
}
