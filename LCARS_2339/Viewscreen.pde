void viewScreen() {
  if (veiwScreen == 0) {
    if (quality == 2) {
      image(standby, width / 3.488 + width / 11.25, height / 2.654, width - width / 3.488 - width / 11.25, height - height / 2.654);
    } else if (quality != 2) {
      v.render();
    }
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
      save();
    }
    if (Button("Low Quality", sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250 + (height / 18.75 + height / 250) * 1, width / 10, height / 18.75, true, color(17, 58, 174))) {
      quality = 0;
      save();
    }
    if (Button("Medium Quality", sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250 + (height / 18.75 + height / 250) * 2, width / 10, height / 18.75, true, color(255, 214, 20))) {
      quality = 1;
      save();
    }
    if (Button("High Quality", sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 3, width / 10, height / 18.75, true, color(102, 155, 243))) {
      quality = 2;
      save();
    }

    v.updateStarCound();

    textSize(HYPOTNUCE / 66);
    fill(57, 17, 230);
    if (quality > 0) {
      rect(sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 4, width / (6+(2/3)), height / 18.75, RATIOWH*500);
    } else {
      rect(sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 4, width / (6+(2/3)), height / 18.75, 0);
    }
    fill(0);
    if (quality == 2) {
      text("Current Quality: High", sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 4, width / (6+(2/3)), height / 18.75);
    }
    if (quality == 1) {
      text("Current Quality: Med", sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 4, width / (6+(2/3)), height / 18.75);
    }
    if (quality == 0) {
      text("Current Quality: Low", sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 4, width / (6+(2/3)), height / 18.75);
    }
  }
  if (veiwScreen == 2) {
    mSSP.render();
  }
  if (veiwScreen == 4) {
  }
  if (veiwScreen == 5) {
    mSSP.render();
  }
  if (veiwScreen == 6) {
    // COMMUNICATIONS
    mSSP.render();
    if (Button("Open Hailing Frequencies", mSSP.x, sSP.y, width / 5, height / 15, true, color(255))) {
      if (isNotMuted) {
        HF.play();
      }
    }
  }
  if (veiwScreen == 7) {
  }
  if (veiwScreen == 8) {
  }
  if (veiwScreen == 9) {
  }
  if (veiwScreen == 10) {
    mSSP.render();
    v.render();
  }
}
