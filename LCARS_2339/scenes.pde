float scene = -1, veiwScreen = 0, miniScreen = 0, logoZoomin = width;

timer exit = new timer("exit", 500, 1.1, 5, false);
timer start = new timer("start", 500, 1.1, 5, true);

void scenes() {
  if (scene == -2) {
    background(0);
    if (logoZoomin >= 10) {
      logoZoomin -= width / 1000.0;
    }
    textSize(HYPOTNUCE / 25);
    imageMode(CENTER);
    image(logo, width / 1.3, height / 2, width / (logoZoomin / 3), height / (logoZoomin  / 4));
    imageMode(CORNER);
    fill(235, 178, 67);
    rect(width / 90, height / 40, width - (width / 90) * 2, height / 20, 10);
    rect(width / 90, height / 1.08101111111, width - (width / 90) * 2, height / 20, 10);
    fill(255);
    textAlign(CORNER, CORNER);
    text("Credits\nCreator: Codeing Network\nDesigner: Codeing Network\nInsperation: Lcars47.com\nBased off Star Trek (c)CBS", 2, height / 10, width - 4, height / 1.1 - height / 20);
    if (exit.timercalc()) {
      exit();
    }
    exit.render();
    textAlign(CENTER, CENTER);
  } else if (scene == -1) {
    textSize(HYPOTNUCE / 25);
    background(0);
    textAlign(CORNER, CORNER);
    fill(235, 178, 67);
    rect(width / 90, height / 40, width - (width / 90) * 2, height / 20, 10);
    rect(width / 90, height / 1.08101111111, width - (width / 90) * 2, height / 20, 10);
    fill(0, 150, 255);
    text("Lcars 47 Database Access Codes:\nBase Codes: omega-alpha-nine \nCommand Codes: alpha-delta-tango", width / 500, height / 10, width - width / 500, height - height / 20);

    if (start.timercalc()) {
      scene = 0;
    }
    start.render();

    textAlign(CENTER, CENTER);
  } else if (scene == 0) {
    fill(255);
    //rect(width / 4.5 - 1, height / 4 - 1, width / 1.8 + 2, height / 2 + 2);
    if (quality == 2) {
      imageMode(CENTER);
      image(logo, width / 2, height / 2, width / 3, height / 2);
      imageMode(CORNER);
    } else if (quality != 2) {
      fill(100, 100, 255);
      ellipse(width / 2, height / 2, width / 3, height / 2);
    }

    l.type();
    l.render();
    l.compare();
    fill(0, 150, 255);
    rect(width / 90, height / 40, width - (width / 90) * 2, height / 20, 10);
    rect(width / 90, height / 1.08101111111, width - (width / 90) * 2, height / 20, 10);
    v.updateStarCound();
  } else if (scene == 1) { 
    //image(temp, 0, 0, width, height);
    if (quality != 0) {
      image(imgsur, width / 213, height / 142, width / 5.5, height / 4.1);
      image(logo, width / 56, height / 29, width / 6.4, height / 5.6);
    } else if (quality == 0) {
      fill(100, 100, 255);
      ellipse(width / 213 + ((width / 5.5)/2), height / 142 + ((height / 4.1)/2), width / 6.5, height / 5.1);
    }

    v.x = mSSP.x;
    v.y = sSP.y;
    v.w = mSSP.w - width / 500;
    v.h = sSP.h - height / 250;
    v.multipier = 1;

    if (miniScreen == 1) {
      Time(width / 254, height / 2.0, width / 5.4, height / 5.5, true);
    } else if (miniScreen == 2) {
      textAlign(CENTER, CENTER);
      fill(255);
      textSize(HYPOTNUCE / 25);
      text("FPS: "+floor(frameRate), width / 254, height / 2.0, width / 5.4, height / 5.5);
    }

    if (Button("54-875977", width / 180, height / 3.900, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(20, 120, 200))) {
    }
    if (Button("34-873976", width / 180, height / 3.157, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(16, 8, 179))) {
    }
    if (Button("92-438629", width / 180, height / 2.631, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(15, 179, 232))) {
    }
    if (Button("47-384209", width / 180, height / 2.272, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(72, 139, 239))) {
    }


    if (Button("25-752841", width / 180 + width / 11.25 + width / 450, height / 3.900, width / 11.25, height / 18.75, false, color(96, 137, 168))) {
    }
    if (Button("51-482361", width / 180 + width / 11.25 + width / 450, height / 3.157, width / 11.25, height / 18.75, false, color(252, 221, 12))) {
    }
    if (Button("37-589735", width / 180 + width / 11.25 + width / 450, height / 2.631, width / 11.25, height / 18.75, false, color(0, 238, 235))) {
    }
    if (Button("56-985324", width / 180 + width / 11.25 + width / 450, height / 2.272, width / 11.25, height / 18.75, false, color(9, 42, 243))) {
    }

    if (Button(mainText[18], width / 180, height / 1.142, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(96, 137, 168))) {
      scene = -2;
    }
    if (Button(mainText[17], width / 180, height / 1.229, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(252, 221, 12))) {
      if (miniScreen != 1) {
        miniScreen = 1;
      } else if (miniScreen == 1) {
        miniScreen = 0;
      }
    }
    if (Button(mainText[10], width / 180, height / 1.327, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(0, 238, 235))) {
      scene = 0;
      l.typed = "";
    }
    if (Button(mainText[11], width / 180, height / 1.449, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(9, 42, 243))) {
      veiwScreen = 0;
    }

    if (Button(mainText[12], width / 180 + width / 11.25 + width / 450, height / 1.142, width / 11.25, height / 18.75, false, color(96, 137, 168))) {
      link("http://youtube.com");
    }
    if (Button(mainText[13], width / 180 + width / 11.25 + width / 450, height / 1.229, width / 11.25, height / 18.75, false, color(252, 221, 12))) {
      veiwScreen = 1;
    }
    if (Button(mainText[14], width / 180 + width / 11.25 + width / 450, height / 1.327, width / 11.25, height / 18.75, false, color(0, 238, 235))) {
      if (veiwScreen != 2) {
        veiwScreen = 2;
      } else if (veiwScreen == 2) {
        veiwScreen = 0;
      }
      if (miniScreen != 2) {
        miniScreen = 2;
      } else if (miniScreen == 2) {
        miniScreen = 0;
      }
    }
    viewScreen();
    if (quality == 2) {
      if (Button(mainText[15], width / 180 + width / 11.25 + width / 450, height / 1.449, width / 11.25, height / 18.75, false, color(9, 42, 243))) {
        if (veiwScreen != 10) {
          veiwScreen = 10;
        } else if (veiwScreen == 10) {
          veiwScreen = 0;
        }
      }
    } else if (quality != 2) {
      if (Button(mainText[16], width / 180 + width / 11.25 + width / 450, height / 1.449, width / 11.25, height / 18.75, false, color(9, 42, 243))) {
      }
    }


    stroke(0);
    textAlign(CENTER, CENTER);
    mSP.render();
    mSP.InteractiveV(mSPView);
    sSP.render();
    sSP.InteractiveV(new float[int(sSP.pc)]);
    tSP.render();
    tSP.InteractiveV(new float[int(tSP.pc)]);
  } else if (scene == 2) {
    v.x = 0;
    v.y = 0;
    v.w = width;
    v.h = height;
    v.multipier = 2;
    v.render();
    fill(0, 150, 255);
    rect(width / 90, height / 40, width - (width / 90) * 2, height / 20, 10);
    if (Button(mainText[29], width / 90, height / 1.08101111111, width - (width / 90) * 2, height / 20, true, color(0, 150, 255))) {
      scene = 1;
      v.x = mSSP.x;
      v.y = sSP.y;
      v.w = mSSP.w - width / 500;
      v.h = sSP.h - height / 250;
      v.updateStarCound();
    }
  } else if (scene == 400) {
    background(255);
    d.render();
    d.InteractiveS(PanelDebugfloat);
    sSP.render();
    fill(0);
    textFont(og);
    textSize(15);
    text(frameRate, 10, 15);
    text(width + ", " + height, 10, 30);
    text("debug accessed", 10, 45);
    if (Button("Return to Login", 10, 60, 100, 50, true, color(100))) {
      scene = 0;
      l.typed = "";
    }
  }
}
