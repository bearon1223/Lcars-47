class Login {
  float x, y, wc;
  String p;
  String typed = "";
  boolean pressedT = false;
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
    if (((typed.equals(p) == true) || (typed.equals("cfopi") || typed.equals("command function override pi"))) && key == ENTER && keyPressed) {
      scene = wc;
      println(wc);
      v.x = mSSP.x;
      v.y = sSP.y;
      v.w = mSSP.w - width / 500;
      v.h = sSP.h - height / 250;
      v.updateStarCound();
      if (isNotMuted) {
        click.play();
      }
    } else if (typed.equals("debug") && key == ENTER && keyPressed) {
      scene = 400;
      click.play();
      println("debug");
    } else if (typed.equals("exit") && key == ENTER && keyPressed) {
      exit();
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
    textAlign(CORNER, CORNER);
  }
}
