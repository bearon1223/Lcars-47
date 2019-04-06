class panel {
  float x, y, w, h, pc;
  panel(float xb, float yb, float wb, float hb, float panelcount){
    x = xb;
    y = yb;
    w = wb;
    h = hb;
    pc = panelcount;
  }
  void render(){
    fill(255);
    rect(x, y, w, h);
    fill(255, 0, 0);
    for(int i = 0; i <= pc; i++){
      rect(x, (y + h / pc) * i, w, h / pc - 2);
    }
  }
}
