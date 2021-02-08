public class Debug extends PApplet {

  void settings() {
    size(600, 250);
  }

  boolean ggfdsakfj = false, ggfdsakfjd = false, KPRESSED = false;

  String input1 = "", input2 = "";

  float currentInput = 1, output = 0;

  boolean Button(float x, float y, float w, float h) {
    boolean t = false;
    if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && !ggfdsakfjd && mousePressed) {
      ggfdsakfjd = true;
    } else if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && ggfdsakfjd && !mousePressed) {
      ggfdsakfjd = false;
      t = true;
    }
    return t;
  }

  boolean keyDetection(char k) {
    if (keyPressed && key == k && !KPRESSED) {
      KPRESSED = true;
      return false;
    } else if (!keyPressed && key == k && KPRESSED) {
      KPRESSED = false;
      return true;
    } else {
      return false;
    }
  }

  boolean Button(String stringtext, float x, float y, float w, float h, boolean isRounded, color c) {
    boolean t = false;
    fill(c);
    textAlign(CENTER, CENTER);
    textSize(15);
    if (!isRounded) {
      rect(x, y, w, h, 0);
    } else if (isRounded) {
      rect(x, y, w, h, 1118.034);
    }
    fill(0);
    text(stringtext, x, y, w, h);
    if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && !ggfdsakfj && mousePressed) {
      ggfdsakfj = true;
    } else if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && ggfdsakfj && !mousePressed) {
      ggfdsakfj = false;
      t = true;
    }
    stroke(0);
    return t;
  }

  void buttons() {
    textAlign(CENTER, CENTER);
    if (currentInput == 1) {
      for (int i = 0; i <= 2; i++) {
        for (int j = 0; j<= 2; j++) {
          fill(255);
          rect(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
          fill(0);
          switch(i) {
          case 0:
            text("" + (j + 1), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input1 += (j + 1);
            }
            break;
          case 1:
            text("" + (j + 4), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input1 += (j + 4);
            }
            break;
          case 2:
            if (j <= 2) {
              text("" + (j + 7), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
              if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
                input1 += (j + 7);
              }
            }
            break;
          }
        }
      }
      float j = 3, i = 2;
      if (Button("0", 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50, false, color(255))) {
        input1 += "0";
      }
    } else if (currentInput == 2) {
      for (int i = 0; i <= 2; i++) {
        for (int j = 0; j<= 2; j++) {
          fill(255);
          rect(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
          fill(0);
          switch(i) {
          case 0:
            text("" + (j + 1), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input2 += (j + 1);
            }
            break;
          case 1:
            text("" + (j + 4), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input2 += (j + 4);
            }
            break;
          case 2:
            text("" + (j + 7), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input2 += (j + 7);
            }
            break;
          }
        }
      }
      float j = 3, i = 2;
      if (Button("0", 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50, false, color(255))) {
        input2 += "0";
      }
    } else if (currentInput == 3) {
      for (int i = 0; i <= 2; i++) {
        for (int j = 0; j<= 2; j++) {
          fill(255);
          rect(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
          fill(0);
          switch(i) {
          case 0:
            text("" + (j + 1), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input1 = "";
              input2 = "";
              input1 += (j + 1);
              currentInput = 1;
            }
            break;
          case 1:
            text("" + (j + 4), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input1 = "";
              input2 = "";
              input1 += (j + 4);
              currentInput = 1;
            }
            break;
          case 2:
            text("" + (j + 7), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input1 = "";
              input2 = "";
              input1 += (j + 7);
              currentInput = 1;
            }
            break;
          }
        }
      }
      float j = 3, i = 2;
      if (Button("0", 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50, false, color(255))) {
        input1 = "";
        input2 = "";
        input1 += "0";
        currentInput = 1;
      }
    } else if (currentInput == 4) {
      for (int i = 0; i <= 2; i++) {
        for (int j = 0; j<= 2; j++) {
          fill(255);
          rect(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
          fill(0);
          switch(i) {
          case 0:
            text("" + (j + 1), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input2 += (j + 1);
            }
            break;
          case 1:
            text("" + (j + 4), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input2 += (j + 4);
            }
            break;
          case 2:
            text("" + (j + 7), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input2 += (j + 7);
            }
            break;
          }
        }
      }
      float j = 3, i = 2;
      if (Button("0", 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50, false, color(255))) {
        input2 += "0";
      }
    } else if (currentInput == 5) {
      for (int i = 0; i <= 2; i++) {
        for (int j = 0; j<= 2; j++) {
          fill(255);
          rect(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
          fill(0);
          switch(i) {
          case 0:
            text("" + (j + 1), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input1 = "";
              input2 = "";
              input1 += (j + 1);
              currentInput = 1;
            }
            break;
          case 1:
            text("" + (j + 4), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input1 = "";
              input2 = "";
              input1 += (j + 4);
              currentInput = 1;
            }
            break;
          case 2:
            text("" + (j + 7), 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50);
            if (Button(230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50)) {
              input1 = "";
              input2 = "";
              input1 += (j + 7);
              currentInput = 1;
            }
            break;
          }
        }
      }
      float j = 3, i = 2;
      if (Button("0", 230 + j * 50 + j * 10, 70 + i * 50 + i * 10, 50, 50, false, color(255))) {
        input1 = "";
        input2 = "";
        input1 += "0";
        currentInput = 1;
      }
    }

    textAlign(CORNER, CORNER);
  }

  void draw() {
    textSize(15);
    textAlign(CORNER, CORNER);
    background(255);

    textSize(15);
    text(HYPOTNUCE, 1, 5);

    textSize(15);
    text(warpFactor, 1, 20);

    textSize(15);
    text(scene, 1, 35);

    textSize(15);
    text("width / ? = MouseX: "+nonDX / nonDXM, 1, 50);

    textSize(15);
    text("height / ? = MouseY: "+nonDY / nonDYM, 1, 65);

    textSize(15);
    text(veiwScreen, 1, 80);
    
    textSize(15);
    text(targetX - shipX, 1, 95);
    
    textSize(15);
    text(targetY - shipY, 1, 110);
    
    textSize(15);
    text(targetZ - shipZ, 1, 125);

    fill(255);
    rect(200, 0, 399, 248);
    rect(210, 10, 200, 50);

    textAlign(CORNER, CENTER);
    fill(0);
    if (currentInput == 1) {
      text(input1, 220, 10, 190, 50);
    } else if (currentInput == 2) {
      text(input1 +" + "+input2, 220, 10, 190, 50);
    } else if (currentInput == 3) {
      text(input1 +" + "+input2 + " = "  + str(floor(output)), 220, 10, 190, 50);
    } else if (currentInput == 4) {
      text(input1 +" ÷ "+input2, 220, 10, 190, 50);
    } else if (currentInput == 5) {
      text(input1 +" ÷ "+input2 + " = "  + output, 220, 10, 190, 50);
    }

    fill(100, 0, 0);
    rect(420, 10, 70, 50);
    buttons();
    if (Button("=", 410, 130, 50, 50, false, color(255))) {
      if (currentInput == 2) {
        output = int(input1) + int(input2);
        currentInput = 3;
      } else if (currentInput == 4) {
        output = int(input1) / int(input2);
        currentInput = 5;
      }
    }
    if (Button("+", 410, 70, 50, 50, false, color(255))) {
      currentInput = 2;
    }
    if (Button("÷", 470, 70, 50, 50, false, color(255))) {
      currentInput = 4;
    }
  }
}
