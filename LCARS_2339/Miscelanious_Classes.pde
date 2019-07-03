class miniDisplay {
  float x, y, w, h;
  boolean Enabled = true;
  miniDisplay(float xb, float yb, float wb, float hb) {
    x = xb;
    y = yb;
    w = wb;
    h = hb;
  }

  void contents() {
  }

  void render() {
  }
}

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

  timer(String text, float xb, float yb, float time, boolean clicktoskip, boolean Reset) {
    t = text;
    timers = time;
    reset = Reset;
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
      if (T >= timers * frameRate|| Button(0, 0, width, height)) {
        if (reset) {
          T = 0;
        }
        return true;
      } else {
        T++;
        return false;
      }
    } else {
      if (T >= timers * frameRate) {
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
      text("Click or wait: " + (round(timers - (T / frameRate)) + 1) + " seconds to " + t, width / x, height / y);
    } else {
      text("Please wait: " + (round(timers - (T / frameRate)) + 1) + " seconds to " + t, width / x, height / y);
    }
  }
}
