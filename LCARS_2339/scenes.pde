float scene = 0, veiwScreen = 0;
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
    image(temp, 0, 0, width, height);
    image(imgsur, width / 213, height / 142, width / 5.5, height / 4.1);
    image(logo, width / 56, height / 29, width / 6.4, height / 5.6);
    Time(width / 254, height / 2.0, width / 5.4, height / 5.5, true);
    fill(153, 57, 255);
    noStroke();
    OneCircleButton(width / 150, height / 3.9, 0.73, 0.8);
    stroke(0);
    println(height / 3.846153846153846);
    mSP.render();
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
    if (Button("Return to Login", 10, 60, 100, 50)) {
      scene = 0;
      l.typed = "";
    }
  }
}
