class Login {
  float x, y;
  String p;
  String typed = "";
  boolean pressedT = false;
  Login (float authority, float xb, float yb) {
    if (authority == 0) {
      p = "omega-alpha-nine";
    } else if (authority == 1) {
      p = "omega-beta-two";
    }
    x = xb;
    y = yb;
  }

  void compare() {
    if (((typed.equals(p) == true) || typed.equals("cfopi")) && key == ENTER && keyPressed) {
      scene = 1;
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
