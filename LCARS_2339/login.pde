class Login {
  float x, y, wc;
  String p;
  String typed = "";
  boolean pressedT = false;
  timer t = new timer(1, false);
  
  Login (float authority, float xb, float yb, float wantedScene) {
    if (authority == 0) {
      p = "omega-alpha-nine";
    } else if (authority == 1) {
      p = "omega-beta-two";
    } else if (authority == 50) {
      p = "debug";
    }
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
        v.updateStarCound();
        if (isNotMuted) {
          accept.play();
        }
      } else if (typed.equals("debug") && keyDetection(ENTER)) {
        scene = 400;
        if (isNotMuted) {
          accept.play();
        }
        println("debug");
      } else if (typed.equals("exit") && keyDetection(ENTER)) {
        scene = -2;
        powerDown.play();
      } else if (typed.equals("settings") && keyDetection(ENTER)) {
        scene = 1;
        veiwScreen = 1;
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
          if (isNotMuted) {
            accept.play();
          }
        } else if (keyDetection(ENTER) || Button(0, 0, width, height)) {
          if (isNotMuted) {
            accept.play();
          }
          scene = wc;
        } else if (mouseX != pmouseX || mouseY != pmouseY) {
          if (isNotMuted) {
            accept.play();
          }
          scene = wc;
          bSounds.loop();
          t.T = 0;
        }
      }
    }
  }

  void type() {
    if (keyPressed && !pressedT) {
      if (key != BACKSPACE && key != ENTER) {
        typed += key;
      } else if (key == BACKSPACE) {
        typed = "";
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
