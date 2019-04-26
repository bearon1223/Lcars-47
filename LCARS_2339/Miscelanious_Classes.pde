class timer {
  String t;
  float T = 0, x, y;
  float timers;
  boolean cts;
  timer(String text, float xb, float yb, float time, boolean clicktoskip) {
    t = text;
    timers = time;
    x = xb;
    y = yb;
    cts = clicktoskip;
  }
  
  timer(float time) {
    t = "";
    timers = time;
    x = 0;
    y = 0;
    cts = false;
  }
  /*
  if (timer >= 5*frameRate || Button(0, 0, width, height)) {
   exit();
   }
   text("Click or wait: "+(floor(5-(timer / (frameRate / 0.9999))) + 1)+" seconds to exit", width / 500, height / 1.1);
   */
  boolean timercalc() {
    if (cts) {
      if (T >= timers * (frameRate / 0.999) || Button(0, 0, width, height)) {
        T = 0;
        return true;
      } else {
        T++;
        return false;
      }
    } else {
      if (T >= timers * (frameRate / 0.999)) {
        T = 0;
        return true;
      } else {
        T++;
        return false;
      }
    }
  }

  void render() {
    if (cts) {
      text("Click or wait: " + (floor(timers - (T / (frameRate / 0.999))) + 1) + " seconds to " + t, width / x, height / y);
    } else {
      text("Please wait: " + (floor(timers - (T / (frameRate / 0.999)))+1) + " seconds to " + t, width / x, height / y);
    }
  }
}
