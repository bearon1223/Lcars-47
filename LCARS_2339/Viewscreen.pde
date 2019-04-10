void viewScreen() {
  if (veiwScreen == 0) {
    image(standby, width / 3.488 + width / 11.25, height / 2.654, width - width / 3.488 - width / 11.25, height - height / 2.654);
    mSSP.render();
  }
  if (veiwScreen == 1) {
    mSSP.render();
    if (Button("Sound: "+isNotMuted, sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250, width / 10, height / 18.75, true, color(20, 200, 255))) {
      if (isNotMuted) {
        isNotMuted = false;
      } else {
        isNotMuted = true;
      }
    }
  }
  if (veiwScreen == 2) {
    mSSP.render();
  }
  if (veiwScreen == 4) {
  }
  if (veiwScreen == 5) {
  }
  if (veiwScreen == 6) {
    // COMMUNICATIONS
    mSSP.render();
    if (Button("Open Hailing Frequencies", mSSP.x, sSP.y, width / 5, height / 15, true, color(255))) {
    }
  }
  if (veiwScreen == 7) {
  }
  if (veiwScreen == 8) {
  }
  if (veiwScreen == 9) {
  }
}
