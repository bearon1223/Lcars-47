class Login {
  float x, y, wc;
  String p;
  String typed = "";
  boolean pressedT = false;
  timer t = new timer(1, false);

  Login (String password, float xb, float yb, float wantedScene) {
    p = password;
    x = xb;
    y = yb;
    wc = wantedScene;
  }

  void compare() {
    if (!theaterMode) {
      if (((typed.equals(p) == true) || (typed.equals("cfopi") || typed.equals("command function override pi"))) && keyDetection(ENTER)) {
        scene = wc;
        bSounds.loop();
        println(wc);
        v.x = mSSP.x;
        v.y = sSP.y;
        v.w = mSSP.w - width / 500;
        v.h = sSP.h - height / 250;
        v.updateStarCount();
        len = 0;
        if (isNotMuted) {
          accept.play();
        }
      } else if (typed.equals("debug") && keyDetection(ENTER)) {
        scene = 400;
        len = 0;
        if (isNotMuted) {
          accept.play();
        }
        println("debug");
      } else if (typed.equals("exit") && keyDetection(ENTER)) {
        scene = -2;
      } else if (typed.equals("settings") && keyDetection(ENTER)) {
        scene = 1;
        veiwScreen = 1;
        len = 0;
        if (isNotMuted) {
          accept.play();
        }
      } else if (keyDetection(ENTER)) {
        if (isNotMuted) {
          fail.play();
        }
      }
    } else {
      if (t.timercalc()) {
        if (typed.equals("exit") && keyDetection(ENTER)) {
          scene = -2;
          powerDown.play();
        } else if (typed.equals("settings") && keyDetection(ENTER)) {
          scene = 1;
          veiwScreen = 1;
          len = 0;
          if (isNotMuted) {
            accept.play();
          }
        } else if (keyDetection(ENTER) || Button(0, 0, width, height)) {
          len = 0;
          if (isNotMuted) {
            accept.play();
          }
          scene = wc;
        } else if (mouseX != pmouseX || mouseY != pmouseY) {
          if (isNotMuted) {
            accept.play();
          }
          len = 0;
          scene = wc;
          bSounds.loop();
          t.T = 0;
        }
      }
    }
  }
  int len = typed.length();
  void type() {
    if (keyPressed && !pressedT) {
      if (key != BACKSPACE && key != ENTER && key != SHIFT) {
        typed += key;
        len = typed.length();
      } else if (key == BACKSPACE) {
        typed = typed.substring(0, max(0, len - 1));
        len = typed.length();
      }
      pressedT = true;
    } else if (!keyPressed && pressedT) {
      pressedT = false;
    }
  }

  void render() {
    fill(255);
    textSize(15);
    textSize(HYPOTNUCE / 25);
    textAlign(CENTER, CENTER);
    text(typed, x, y);
  }
}
