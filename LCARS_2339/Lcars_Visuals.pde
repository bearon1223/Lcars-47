class panel {
  float x, y, w, h, pc;
  color[] colors;
  String[] texts;
  panel(float xb, float yb, float wb, float hb, float panelcount, String[] textsb){
    x = xb;
    y = yb;
    w = wb;
    h = hb;
    pc = panelcount;
    texts = textsb;
    for(int i = 0; i <= pc - 1; i++){
      colors[i] = color(random(100, 255), random(100, 255), random(100, 255));
    }
  }
  panel(float xb, float yb, float wb, float hb, float panelcount){
    x = xb;
    y = yb;
    w = wb;
    h = hb;
    pc = panelcount;
    texts = new String[1000];
    for(int i = 0; i <= pc; i++){
      colors[i] = color(random(100, 255), random(100, 255), random(100, 255));
    }
  }
  void render(){
    fill(255);
    rect(x, y, w, h);
    for(int i = 0; i <= pc - 1; i++){
      textAlign(CENTER, CENTER);
      textSize(HYPOTNUCE / 66);
      fill(colors[i]);
      rect(x, (y + h / pc) * i, w, h / pc - 2);
      fill(0);
      text(texts[i], x, (y + h / pc) * i, w, h / pc - 2);
      textAlign(CORNER, CORNER);
    }
  }
  
  void Interactive(){
    
  }
}
