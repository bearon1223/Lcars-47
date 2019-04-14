class timer {
  String t;
  float T = 0, x, y;
  float timers;
  timer(String text, float xb, float yb, float time) {
    t = text;
    timers = time;
    x = xb;
    y = yb;
  }
  /*
  if (timer >= 5*frameRate || Button(0, 0, width, height)) {
   exit();
   }
   text("Click or wait: "+(floor(5-(timer / (frameRate / 0.9999))) + 1)+" seconds to exit", width / 500, height / 1.1);
   */
  boolean timercalc() {
    if (T >= timers * frameRate / 0.9999 || Button(0, 0, width, height)) {
      return true;
    } else {
      T++;
      return false;
    }
  }

  void render() {
    text("Click or wait: " + (floor(5 - (T / (frameRate / 0.9999))) + 1) + " seconds to " + t, width / x, height / y);
  }
}
