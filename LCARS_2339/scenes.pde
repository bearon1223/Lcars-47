float scene = -1, viewScreen = 12, miniScreen = 0, logoZoomin = 100, fade = 250;

timer exit = new timer("exit", 100, 1.1, 5, false);
timer start = new timer("start", 100, 1.1, 5, true);

void scenes() {
  if (scene != -2 && scene != -1 && scene != 0 && timeoutEnabled) {
    if (timeout.timercalc()) {
      scene = 0;
      l.typed = "";
    }
    if (keyPressed || mouseX != pmouseX || mouseY != pmouseY || mousePressed) {
      timeout.T = 0;
    }
  }
  if (scene == -2) {
    background(0);
    if (logoZoomin == 100 && isNotMuted) {
      powerDown.play();
    }
    if (logoZoomin >= 10) {
      logoZoomin -= width / 1000.0;
    }
    textSize(HYPOTNUCE / 25);
    if (quality == 2) {
      imageMode(CENTER);
      image(logo, width / 1.3, height / 2, width / (logoZoomin / 3), height / (logoZoomin / 4));
      imageMode(CORNER);
    } else {
      FederationSymbol(width / 1.3, height / 2, width / (logoZoomin / 3) / 1.5, height / (logoZoomin / 4));
    }
    fill(235, 178, 67);
    rect(width / 90, height / 40, width - (width / 90) * 2, height / 20, 10);
    rect(width / 90, height / 1.08101111111, width - (width / 90) * 2, height / 20, 10);
    fill(255);
    textAlign(CORNER, CORNER);
    text("Credits:\nCreator: Coding Network\nSounds Provided by:\ntrekcore.com, lcarscom.net,\nBensound.com\nBased off Star Trek (c)CBS", width / 100, height / 10, width - 4, height / 1.1 - height / 20);

    if (exit.timercalc()) {
      exit();
    }
    exit.render();


    textAlign(CENTER, CENTER);
  } else if (scene == -1) {
    
    background(0);
    if (logoZoomin >= 10) {
      logoZoomin -= width / 1000.0;
    }
    textSize(HYPOTNUCE / 25);
    if (quality == 2) {
      imageMode(CENTER);
      image(logo, width / 1.3, height / 2, width / (logoZoomin / 3), height / (logoZoomin / 4));
      imageMode(CORNER);
    } else {
      FederationSymbol(width / 1.3, height / 2, width / (logoZoomin / 3) / 1.5, height / (logoZoomin / 4));
    }
    textAlign(CORNER, CORNER);
    fill(235, 178, 67);
    rect(width / 90, height / 40, width - (width / 90) * 2, height / 20, 10);
    rect(width / 90, height / 1.08101111111, width - (width / 90) * 2, height / 20, 10);
    fill(0, 150, 255);
    text("Lcars 47 Database Access Codes:\nLogin Codes: omega-alpha-nine", width / 100, height / 10, width - width / 500, height - height / 20);

    if (start.timercalc()) {
      scene = 0;
    }
    start.render();
    textAlign(CENTER, CENTER);
  } else if (scene == 0) {
    logoZoomin = 100;
    l.x = width / 2;
    l.y = height / 1.25;
    fade = 250;
    fill(255);

    if (quality == 2) {
      imageMode(CENTER);
      image(logo, width / 2, height / 2, width / 3, height / 2);
      imageMode(CORNER);
    } else if (quality != 2) {
      fill(100, 100, 255);
      FederationSymbol(width / 2, height / 2, width / 5, height / 2.5);
    }
    l.type();
    l.render();
    l.compare();
    fill(0, 150, 255);
    rect(width / 90, height / 40, width - (width / 90) * 2, height / 20, 10);
    rect(width / 90, height / 1.08101111111, width - (width / 90) * 2, height / 20, 10);
    v.updateStarCount();
  } else if (scene == 1) { 
    mSP.x = width / 5.2;
    mSP.h = height;
    mSP.w = width / 11.4;

    sSP.x = width / 3.488372093023256;
    sSP.y = height / 2.2641509243396226;
    sSP.h = height - sSP.y;
    sSP.w = width / 11.25;

    tSP.x = width / 3.488372093023256;
    //tSP.h = height / 4;
    tSP.h = sSP.y;
    tSP.w = width / 11.25;

    mTA.x = mSSP.x;
    mTA.y = tSP.y;
    mTA.w = mSSP.w / 1.5;
    mTA.h = mSSP.y;

    mSSP.x = sSP.x + sSP.w + width / 500;
    mSSP.y = sSP.y - mSSP.h - height / 15;
    mSSP.w = width - mSSP.x;
    mSSP.h = height / 50;
    viewScreen();

    if (quality == 2) {
      image(imgsur, width / 213, height / 142, width / 5.5, height / 4.1);
      image(logo, width / 56, height / 29, width / 6.4, height / 5.6);
    } else if (quality == 1) {
      fill(100, 150, 255);
      rect(width / 213, height / 142, width / 5.5, height / 4.1, HYPOTNUCE / 50);
      fill(0);
      rect(width / 100, height / 142, width / 5.9, height / 4.1, HYPOTNUCE / 50);

      FederationSymbol(width / 213 + ((width / 5.5)/2), height / 142 + ((height / 4.1)/2), width / 8.0, height / 4.5);
    } else if (quality == 0) {
      FederationSymbol(width / 213 + ((width / 5.5)/2), height / 142 + ((height / 4.1)/2), width / 8.0, height / 4.5);
    }

    v.x = mSSP.x;
    v.y = mSSP.y + mSSP.h + height / 250;
    v.w = mSSP.w - width / 500;
    v.h = height - mSSP.y - height / 250;

    if (miniScreen == 0) {
      sTA.x = width / 254.0 + (width / 250);
      sTA.y = height / 2.0;
      sTA.w = (width / 5.4);
      sTA.h = height / 5.5 - (width / (250 / 2));

      sTA.render();
    } else if (miniScreen == 1) {
      Time(width / 254.0 + (width / 250), height / 2.0, width / 5.4, height / 5.5 - (width / (250/2)), true);
    } else if (miniScreen == 2) {
      textAlign(CENTER, CENTER);
      fill(255);
      textSize(HYPOTNUCE / 25);
      text("FPS: "+round(frameRate), width / 254.0, height / 2.0, width / 5.4, height / 5.5);
    }
    if (RedAlert) {
      viewScreen = 0;
      if (Button("54-875977", width / 180, height / 3.900, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(255, 10, 2))) {
      }
      if (Button("34-873976", width / 180, height / 3.157, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(214, 8, 32))) {
      }
      if (Button("92-438629", width / 180, height / 2.631, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(255, 21, 39))) {
      }
      if (Button("47-384209", width / 180, height / 2.272, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(255))) {
      }


      if (Button("25-752841", width / 180 + width / 11.25 + width / 450, height / 3.900, width / 11.25, height / 18.75, false, color(216, 8, 28))) {
      }
      if (Button("51-482361", width / 180 + width / 11.25 + width / 450, height / 3.157, width / 11.25, height / 18.75, false, color(252, 2, 12))) {
        RedAlert = true;
      }
      if (Button("37-589735", width / 180 + width / 11.25 + width / 450, height / 2.631, width / 11.25, height / 18.75, false, color(255, 238, 235))) {
      }
      if (Button("56-985324", width / 180 + width / 11.25 + width / 450, height / 2.272, width / 11.25, height / 18.75, false, color(219, 42, 32))) {
        RedAlert = false;
      }
      if (!theaterMode) {
        if (Button(mainText[18], width / 180, height / 1.142, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(255, 32, 15))) {
          bSounds.stop();
          scene = -2;
        }
      } else {
        if (Button("98-348362", width / 180, height / 1.142, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(231, 3, 5))) {
        }
      }
      if (Button(mainText[17], width / 180, height / 1.229, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(255, 33, 100))) {
        if (miniScreen != 1) {
          miniScreen = 1;
        } else if (miniScreen == 1) {
          miniScreen = 0;
        }
      }
      if (Button(mainText[10], width / 180, height / 1.327, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(255, 31, 23))) {
        scene = 0;
        bSounds.stop();
        l.typed = "";
      }
      if (Button(mainText[11], width / 180, height / 1.449, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(255, 42, 13))) {
        viewScreen = 0;
        miniScreen = 0;
      }
      if (!theaterMode) {
        if (Button(mainText[12], width / 180 + width / 11.25 + width / 450, height / 1.142, width / 11.25, height / 18.75, false, color(132, 1, 3))) {
          link("http://youtube.com");
        }
      } else {
        if (Button("45-213456", width / 180 + width / 11.25 + width / 450, height / 1.142, width / 11.25, height / 18.75, false, color(255, 0, 3))) {
        }
      }
      if (!theaterMode) {
        if (Button(mainText[13], width / 180 + width / 11.25 + width / 450, height / 1.229, width / 11.25, height / 18.75, false, color(252, 23, 12))) {
          viewScreen = 1;
        }
      } else {
        if (Button(mainText[16], width / 180 + width / 11.25 + width / 450, height / 1.229, width / 11.25, height / 18.75, false, color(252, 2, 12))) {
        }
      }
      if (Button(mainText[14], width / 180 + width / 11.25 + width / 450, height / 1.327, width / 11.25, height / 18.75, false, color(231, 1, 3))) {
        if (viewScreen != 2) {
          viewScreen = 2;
        } else if (viewScreen == 2) {
          viewScreen = 0;
        }
        if (miniScreen != 2) {
          miniScreen = 2;
        } else if (miniScreen == 2) {
          miniScreen = 0;
        }
      }

      //if (quality == 2) {
      if (Button(mainText[15], width / 180 + width / 11.25 + width / 450, height / 1.449, width / 11.25, height / 18.75, false, color(255, 42, 12))) {
        if (viewScreen != 10) {
          viewScreen = 9.9;
        } else if (viewScreen == 10) {
          viewScreen = 0;
        }
      }
      //} else if (quality != 2) {
      //if (Button(mainText[16], width / 180 + width / 11.25 + width / 450, height / 1.449, width / 11.25, height / 18.75, false, color(255, 42, 19))) {
      //fail.play();
      //}
      //}
    } else {
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
        RedAlert = false;
      }
      if (Button("37-589735", width / 180 + width / 11.25 + width / 450, height / 2.631, width / 11.25, height / 18.75, false, color(0, 238, 235))) {
      }
      if (Button("56-985324", width / 180 + width / 11.25 + width / 450, height / 2.272, width / 11.25, height / 18.75, false, color(9, 42, 243))) {
        RedAlert = true;
      }
      if (!theaterMode) {
        if (Button(mainText[18], width / 180, height / 1.142, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(96, 137, 168))) {
          scene = -2;
          bSounds.stop();
        }
      } else {
        if (Button("98-348362", width / 180, height / 1.142, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(96, 137, 168))) {
        }
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
        viewScreen = 0;
        miniScreen = 0;
      }
      if (!theaterMode) {
        if (Button(mainText[12], width / 180 + width / 11.25 + width / 450, height / 1.142, width / 11.25, height / 18.75, false, color(96, 137, 168))) {
          link("http://youtube.com");
        }
      } else {
        if (Button("45-213456", width / 180 + width / 11.25 + width / 450, height / 1.142, width / 11.25, height / 18.75, false, color(96, 137, 168))) {
        }
      }
      if (!theaterMode) {
        if (Button(mainText[13], width / 180 + width / 11.25 + width / 450, height / 1.229, width / 11.25, height / 18.75, false, color(252, 221, 12))) {
          viewScreen = 1;
        }
      } else {
        if (Button(mainText[16], width / 180 + width / 11.25 + width / 450, height / 1.229, width / 11.25, height / 18.75, false, color(252, 221, 12))) {
        }
      }
      if (Button(mainText[14], width / 180 + width / 11.25 + width / 450, height / 1.327, width / 11.25, height / 18.75, false, color(0, 238, 235))) {
        if (viewScreen != 2) {
          viewScreen = 2;
        } else if (viewScreen == 2) {
          viewScreen = 0;
        }
        if (miniScreen != 2) {
          miniScreen = 2;
        } else if (miniScreen == 2) {
          miniScreen = 0;
        }
      }

      //if (quality == 2) {
      if (Button(mainText[15], width / 180 + width / 11.25 + width / 450, height / 1.449, width / 11.25, height / 18.75, false, color(9, 42, 243))) {
        if (viewScreen != 10) {
          viewScreen = 9.9;
          v.updateStarCount();
        } else if (viewScreen == 10) {
          viewScreen = 0;
        }
      }
      //} else if (quality != 2) {
      //if (Button(mainText[16], width / 180 + width / 11.25 + width / 450, height / 1.449, width / 11.25, height / 18.75, false, color(9, 42, 243))) {
      //}
      //}
    }

    stroke(0);
    textAlign(CENTER, CENTER);
    mSP.render();
    mSP.InteractiveV(mSPView);
    sSP.render();
    sSP.InteractiveV(new float[int(sSP.pc)]);
    tSP.render();
    tSP.InteractiveV(new float[int(tSP.pc)]);
    mTA.render();
    mSSP.render();
    if (fade > 0) {
      fill(0, 0, 0, fade);
      rect(0, 0, width, height);
      if (frameRate > 30) {
        fade -= 15;
      } else if (frameRate < 30) {
        fade -= 30;
      }
    }
  } else if (scene == 2) {
    if (warpFactor > 0.11) {
      ViewScreenLarge.w = width;
      ViewScreenLarge.h = height;
      translate(width / 2, height / 2);
      ViewScreenLarge.update();
      translate(-(width / 2), -(height / 2));
    } else {
      v.x = 0;
      v.y = 0;
      v.w = width;
      v.h = height;
      v.render();

      ViewScreenLarge.w = width;
      ViewScreenLarge.h = height;
      translate(width / 2, height / 2);
      ViewScreenLarge.update();
      translate(-(width / 2), -(height / 2));
    }

    fill(0, 150, 255);
    rect(width / 90, height / 40, width - (width / 90) * 2, height / 20, HYPOTNUCE*500);
    if (Button(mainText[29], width / 90, height / 1.08101111111, width - (width / 90) * 2, height / 20, true, color(0, 150, 255))) {
      scene = 1;
      viewScreen = 3;
      v.x = mSSP.x;
      v.y = sSP.y;
      v.w = mSSP.w - width / 500;
      v.h = height - mSSP.y - height / 250;
      v.updateStarCount();
    }
  }
}
