float scene = 0, veiwScreen = 0, miniScreen = 0;
void scenes() {
  if (scene == 0) {
    image(logo, width / 4.5, height / 4, width / 1.8, height / 2);
    l.type();
    l.render();
    l.compare();
    fill(0, 150, 255);
    rect(width / 90, height / 40, width - (width / 90) * 2, height / 20, 10);
    rect(width / 90, height / 1.08101111111, width - (width / 90) * 2, height / 20, 10);
  } else if (scene == 1) {
    //image(temp, 0, 0, width, height);
    image(imgsur, width / 213, height / 142, width / 5.5, height / 4.1);
    image(logo, width / 56, height / 29, width / 6.4, height / 5.6);
    if (miniScreen == 1) {
      Time(width / 254, height / 2.0, width / 5.4, height / 5.5, true);
    }

    if (Button("54-875977", width / 180, height / 3.900, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, 1, color(20, 120, 200))) {
    }
    if (Button("34-873976", width / 180, height / 3.157, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, 1, color(16, 8, 179))) {
    }
    if (Button("92-438629", width / 180, height / 2.631, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, 1, color(15, 179, 232))) {
    }
    if (Button("47-384209", width / 180, height / 2.272, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, 1, color(72, 139, 239))) {
    }

    if (Button("Deactivate", width / 180, height / 1.142, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, 1, color(96, 137, 168))) {
      exit();
    }
    if (Button("SYS TIME", width / 180, height / 1.229, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, 1, color(252, 221, 12))) {
      miniScreen = 1;
    }
    if (Button("LOCK", width / 180, height / 1.327, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, 1, color(0, 238, 235))) {
      scene = 0;
      l.typed = "";
    }
    if (Button("LCARS", width / 180, height / 1.449, width / 1232.876, height / 750.000, width / 11.25, height / 18.75, 1, color(9, 42, 243))) {
      miniScreen = 0;
      veiwScreen = 0;
    }
    
    if (Button("ONLINE", width / 180 + width / 11.25 + width / 450, height / 1.142, width / 11.25, height / 18.75, color(96, 137, 168))) {
    }
    if (Button("SETTINGS", width / 180 + width / 11.25 + width / 450, height / 1.229, width / 11.25, height / 18.75, color(252, 221, 12))) {
      veiwScreen = 1;
    }
    if (Button("SYS INFO", width / 180 + width / 11.25 + width / 450, height / 1.327, width / 11.25, height / 18.75, color(0, 238, 235))) {
      veiwScreen = 2;
    }
    if (Button("MODEL SEL", width / 180 + width / 11.25 + width / 450, height / 1.449, width / 11.25, height / 18.75, color(9, 42, 243))) {
    }

    viewScreen();
    stroke(0);
    textAlign(CENTER, CENTER);
    mSP.render();
    mSP.InteractiveV(mSPView);
    sSP.render();
  } else if (scene == 400) {
    background(255);
    d.render();
    d.InteractiveS(PanelDebugfloat);
    fill(0);
    textFont(og);
    textSize(15);
    text(frameRate, 10, 15);
    text(width + ", " + height, 10, 30);
    text("debug accessed", 10, 45);
    if (Button("Return to Login", 10, 60, 100, 50, color(100))) {
      scene = 0;
      l.typed = "";
    }
  }
}
