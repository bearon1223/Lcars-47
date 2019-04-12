float scene = 0, veiwScreen = 0, miniScreen = 0;
void scenes() {
  if (scene == 0) {
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

    if (miniScreen == 1) {
      Time(width / 254, height / 2.0, width / 5.4, height / 5.5, true);
    } else if (miniScreen == 2) {
      textAlign(CENTER, CENTER);
      fill(255);
      textSize(HYPOTNUCE / 25);
      text("FPS: "+floor(frameRate), width / 254, height / 2.0, width / 5.4, height / 5.5);
      textAlign(CORNER, CORNER);
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

    if (Button("Deactivate", width / 180, height / 1.142, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(96, 137, 168))) {
      exit();
    }
    if (Button("SYS TIME", width / 180, height / 1.229, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(252, 221, 12))) {
      if (miniScreen != 1) {
        miniScreen = 1;
      } else if (miniScreen == 1) {
        miniScreen = 0;
      }
    }
    if (Button("LOCK", width / 180, height / 1.327, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(0, 238, 235))) {
      scene = 0;
      l.typed = "";
    }
    if (Button("LCARS", width / 180, height / 1.449, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, color(9, 42, 243))) {
      veiwScreen = 0;
    }

    if (Button("ONLINE", width / 180 + width / 11.25 + width / 450, height / 1.142, width / 11.25, height / 18.75, false, color(96, 137, 168))) {
      link("http://youtube.com");
    }
    if (Button("SETTINGS", width / 180 + width / 11.25 + width / 450, height / 1.229, width / 11.25, height / 18.75, false, color(252, 221, 12))) {
      veiwScreen = 1;
    }
    if (Button("SYS INFO", width / 180 + width / 11.25 + width / 450, height / 1.327, width / 11.25, height / 18.75, false, color(0, 238, 235))) {
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
      if (Button("Exteriror", width / 180 + width / 11.25 + width / 450, height / 1.449, width / 11.25, height / 18.75, false, color(9, 42, 243))) {
        if (veiwScreen != 10) {
        veiwScreen = 10;
      } else if (veiwScreen == 10) {
        veiwScreen = 0;
      }
      }
    } else if (quality != 2) {
      if (Button("MODEL SEQ", width / 180 + width / 11.25 + width / 450, height / 1.449, width / 11.25, height / 18.75, false, color(9, 42, 243))) {
        textAlign(CENTER, CENTER);
        fill(255);
        text("Not Available", width / 2, height / 2);
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
