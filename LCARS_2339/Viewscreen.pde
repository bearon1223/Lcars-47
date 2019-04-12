void viewScreen() {
  if (veiwScreen == 0) {
    if (quality == 2) {
      image(standby, width / 3.488 + width / 11.25, height / 2.654, width - width / 3.488 - width / 11.25, height - height / 2.654);
    } else if (quality != 2) {
      v.render();
    }
    mSSP.render();
  } else if (veiwScreen == 1) {
    mSSP.render();
    if (Button(mainText[0]+isNotMuted, sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250, width / 10, height / 18.75, true, color(20, 200, 255))) {
      if (isNotMuted) {
        isNotMuted = false;
      } else {
        isNotMuted = true;
      }
      save();
    }
    if (Button(mainText[1], sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250 + (height / 18.75 + height / 250) * 1, width / 10, height / 18.75, true, color(17, 58, 174))) {
      quality = 0;
      save();
    }
    if (Button(mainText[2], sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250 + (height / 18.75 + height / 250) * 2, width / 10, height / 18.75, true, color(255, 214, 20))) {
      quality = 1;
      save();
    }
    if (Button(mainText[3], sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 3, width / 10, height / 18.75, true, color(102, 155, 243))) {
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
      text(mainText[4], sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 4, width / (6+(2/3)), height / 18.75);
    }
    if (quality == 1) {
      text(mainText[5], sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 4, width / (6+(2/3)), height / 18.75);
    }
    if (quality == 0) {
      text(mainText[6], sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 4, width / (6+(2/3)), height / 18.75);
    }

    if (Button(mainText[7], sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 5, width / 10, height / 18.75, true, color(18, 97, 196))) {
      veiwScreen = 11;
    }
  } else if (veiwScreen == 2) {
    mSSP.render();
  } else if (veiwScreen == 4) {
  } else if (veiwScreen == 5) {
    mSSP.render();
  } else if (veiwScreen == 6) {
    // COMMUNICATIONS
    mSSP.render();
    if (Button(mainText[8], mSSP.x, sSP.y, width / 5, height / 15, true, color(255))) {
      if (isNotMuted) {
        HF.play();
      }
    }
  } else if (veiwScreen == 7) {
  } else if (veiwScreen == 8) {
  } else if (veiwScreen == 9) {
  } else if (veiwScreen == 10) {
    mSSP.render();
    v.render();
  } else if (veiwScreen == 11) {
    mSSP.render();
    if (Button("English", sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 1, width / 10, height / 18.75, true, color(18, 97, 196))) {
      loadLang(LANG_US);
      LANGUAGE = 0;
    }
    if (Button("Japanese", sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 2, width / 10, height / 18.75, true, color(18, 97, 196))) {
      LANGUAGE = 1;
      loadLang(LANG_JP);
    }
    if (Button(mainText[9], sSP.x + sSP.w + width / 500, height - height / 18.75 - height / 250, width / 10, height / 18.75, true, color(18, 97, 196))) {
      veiwScreen = 1;
    }
  }
}
