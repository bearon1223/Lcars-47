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
  
  boolean timercalc() {
    if (cts) {
      if (T >= timers * (frameRate / 0.999) || Button(0, 0, width, height)) {
        if (reset) {
          T = 0;
        }
        return true;
      } else {
        T++;
        return false;
      }
    } else {
      if (T >= timers * (frameRate / 0.999)) {
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

  void render() {
    if (cts) {
      text("Click or wait: " + (floor(timers - (T / (frameRate / 0.999))) + 1) + " seconds to " + t, width / x, height / y);
    } else {
      text("Please wait: " + (floor(timers - (T / (frameRate / 0.999)))+1) + " seconds to " + t, width / x, height / y);
    }
  }
}
