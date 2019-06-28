float tempquality = 0, temptimeoutTime = 0;
boolean tempisNotMuted = false, temptheater = false, temptimeoutEnabled = false, dMplaying = false;

void viewScreen() {
  if (veiwScreen == 0) {
    if (quality == 2) {
      image(standby, mSSP.x, mSSP.y+mSSP.h, mSSP.w, height - (mSSP.y+mSSP.h));

      v.updateStarCount();
    } else if (quality != 2) {
      v.render();
    }
  } else if (veiwScreen == 1) {
    if (Button(mainText[0]+tempisNotMuted, sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250, width / 10, height / 18.75, true, color(20, 200, 255))) {
      if (tempisNotMuted) {
        tempisNotMuted = false;
      } else {
        tempisNotMuted = true;
      }
    }
    if (Button(mainText[1], sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250 + (height / 18.75 + height / 250) * 1, width / 10, height / 18.75, true, color(32, 177, 219))) {
      tempquality = 0;
    }
    if (Button(mainText[2], sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250 + (height / 18.75 + height / 250) * 2, width / 10, height / 18.75, true, color(255, 214, 20))) {
      tempquality = 1;
    }
    if (Button(mainText[3], sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 3, width / 10, height / 18.75, true, color(102, 155, 243))) {
      tempquality = 2;
    }

    v.updateStarCount();

    textSize(HYPOTNUCE / 66);
    fill(color(57, 17, 230));
    if (quality > 0) {
      rect(sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 4, width / (6+(2/3)), height / 18.75, RATIOWH*500);
    } else {
      rect(sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 4, width / (6+(2/3)), height / 18.75, 0);
    }
    fill(0);
    if (tempquality == 2) {
      text(mainText[4], sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 4, width / (6+(2/3)), height / 18.75);
    }
    if (tempquality == 1) {
      text(mainText[5], sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 4, width / (6+(2/3)), height / 18.75);
    }
    if (tempquality == 0) {
      text(mainText[6], sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 4, width / (6+(2/3)), height / 18.75);
    }

    if (Button(mainText[7], sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 5, width / 10.0, height / 18.75, true, color(52, 124, 212))) {
      veiwScreen = 11;
    }
    if (Button(mainText[27]+fullscreen, sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 6, width / 5.0, height / 18.75, true, color(52, 124, 212))) {
      if (!fullscreen) {
        fullscreen = true;
      } else {
        fullscreen = false;
      }
    }
    if (Button(mainText[30]+temptheater, sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 7, width / 5.0, height / 18.75, true, color(52, 124, 212))) {
      if (!temptheater) {
        temptheater = true;
      } else {
        temptheater = false;
      }
    }
    if (Button(mainText[31] + floor(temptimeoutTime), sSP.x + sSP.w + width / 500 + (width / 5.0 + width / 500) * 1.25, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 0, width / 5.0, height / 18.75, true, color(52, 124, 212))) {
    }
    if (Button("<", sSP.x + sSP.w + width / 500 + (width / 5.0 + width / 500) * 1.25 + (width / 20.0 + width / 500) * 0, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 1, width / 20.0, height / 18.75, true, color(52, 124, 212))) {
      temptimeoutTime -= 10;
    }
    if (Button(">", sSP.x + sSP.w + width / 500 + (width / 5.0 + width / 500) * 1.25 + (width / 20.0 + width / 500) * 1, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 1, width / 20.0, height / 18.75, true, color(52, 124, 212))) {
      temptimeoutTime += 10;
    }
    if (Button(mainText[32] + temptimeoutEnabled, sSP.x + sSP.w + width / 500 + (width / 5.0 + width / 500) * 1.25, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 2, width / 5.0, height / 18.75, true, color(52, 124, 212))) {
      if (!temptimeoutEnabled) {
        temptimeoutEnabled = true;
      } else {
        temptimeoutEnabled = false;
      }
    }

    if (Button(mainText[28], sSP.x + sSP.w + width / 500, height - height / 18.75 - height / 250, width / 10, height / 18.75, true, color(18, 97, 196))) {
      quality = tempquality;
      isNotMuted = tempisNotMuted;
      theaterMode = temptheater;
      timeoutTime = temptimeoutTime;
      timeout.timers = timeoutTime;
      timeout.T = 0;
      timeoutEnabled = temptimeoutEnabled;
      save();
    }
  } else if (veiwScreen == 2) {
    textAlign(CORNER, CORNER);
    fill(255);
    textSize(15);
    text("Build b1.07.02\nThis is a recreation of the Lcars47 OS found on Star Trek. This is also a blend of all of the versions we see on the screen. Most of the Insperation for this project comes from the program Lcars47 from Lcars47.com", mSSP.x, mSSP.y + mSSP.h + width / 250, mSSP.w, sSP.h);
    textAlign(CENTER, CENTER);
  } else if (veiwScreen == 3) {
    // SYS DIRECTORY
    if (Button(mainText[26], width - width / 10 - width / 500, sSP.y, width / 10, height / 15, false, color(70, 200, 255), accept)) {
      scene = 2;
      v.x = 0;
      v.y = 0;
      v.w = width;
      v.h = height;
      if (warpFactor == 0) {
        v.starMult = 1;
      } else {
        v.starMult = 0.1;
      }
      v.updateStarCount();
    }
    if (Button(mainText[34], width - width / 10 - width / 500, sSP.y + height / 15 + height / 250, width / 10, height / 15, false, color(70, 100, 255), accept)) {
      veiwScreen = 12;
    }

    SDSP.x = mSSP.x;
    SDSP.y = mSSP.y + mSSP.h + height / 250;
    SDSP.w = mSSP.w;
    SDSP.h = tSP.h - SDSP.y - height / 250;
    SDSP.TextSize = HYPOTNUCE / 66;
    SDSP.render();
  } else if (veiwScreen == 5) {
  } else if (veiwScreen == 6) {
    // COMMUNICATIONS
    cMP.x = mSSP.x + sSP.w;
    cMP.y = mSSP.y + height / 8;
    cMP.w = sSP.w;
    cMP.h = sSP.h / 2;

    cMSP.x = cMP.x + cMP.w + width/500;
    cMSP.y = cMP.y;
    cMSP.w = width / 5;
    cMSP.h = width / 100;

    if (Button(mainText[8], cMSP.x, cMSP.y + cMSP.h + height / 250, cMSP.w, cMP.h / cMP.pc, false, color(50, 130, 255))) {
      HFO.play();
    }
    if (Button(mainText[33], cMSP.x, (cMSP.y + cMSP.h + height / 250) + cMP.h/cMP.pc + height / 250, cMSP.w, cMP.h/cMP.pc, false, color(50, 100, 255))) {
    }

    cMP.render();
    cMSP.render();
  } else if (veiwScreen == 7) {
  } else if (veiwScreen == 8) {
  } else if (veiwScreen == 9) {
    if (Button("92-48416", sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250, width / 10, height / 18.75, true, color(20, 200, 255))) {
      if (dMplaying) {
        dMusic.stop();
        bSounds.loop();
        dMplaying = false;
      } else {
        dMusic.loop();
        bSounds.stop();
        dMplaying = true;
      }
    }
  } else if (veiwScreen == 9.9) {
    v.starMult = 1;
    if (warpFactor != 0) {
      v.starMult = 0.1;
      v.updateStarCount();
      v.x = mSSP.x;
      v.y = mSSP.y + mSSP.h + height / 200;
      v.w = mSSP.w - width / 500;
      v.h = height - mSSP.y;
    } else {
      v.starMult = 1;
    }
    veiwScreen = 10;
  } else if (veiwScreen == 10) {
    // Exterior viewport not viewScreen
    if (warpFactor > 0.11) {
      ViewScreenLarge.w = mSSP.w - width / 500;
      ViewScreenLarge.h = (height - mSSP.y - height / 250);
      translate(mSSP.x + (mSSP.w - width / 500)/2, sSP.y + (height - mSSP.y - height / 250)/2);
      ViewScreenLarge.update();
      translate(-(mSSP.x + (mSSP.w - width / 500)/2), -(sSP.y + (height - mSSP.y - height / 250)/2));
      fill(0);
      rect(0, 0, width, mSSP.y);
      rect(0, mSSP.y, mSSP.x, height - mSSP.y);
    } else {
      v.x = mSSP.x;
      v.y = mSSP.y + mSSP.h + height / 200;
      v.w = mSSP.w - width / 500;
      v.h = height - mSSP.y;
      v.render();
      
      ViewScreenLarge.w = mSSP.w - width / 500;
      ViewScreenLarge.h = (height - mSSP.y - height / 250);
      translate(mSSP.x + (mSSP.w - width / 500)/2, sSP.y + (height - mSSP.y - height / 250)/2);
      ViewScreenLarge.update();
      translate(-(mSSP.x + (mSSP.w - width / 500)/2), -(sSP.y + (height - mSSP.y - height / 250)/2));
      fill(0);
      rect(0, 0, width, mSSP.y);
      rect(0, mSSP.y, mSSP.x, height - mSSP.y);
    }
  } else if (veiwScreen == 11) {
    if (Button("English", sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 1, width / 10, height / 18.75, true, color(18, 97, 196))) {
      loadLang(LANG_US);
      LANGUAGE = 0;
    }
    if (Button("日本語", sSP.x + sSP.w + width / 500, mSSP.y + mSSP.h + height / 250  + (height / 18.75 + height / 250) * 2, width / 10, height / 18.75, true, color(235, 178, 67))) {
      LANGUAGE = 1;
      loadLang(LANG_JP);
    }
    if (keyDetection('p')) {
      LANGUAGE = 0;
      loadLang(LANG_PEW);
    }
    if (Button(mainText[9], sSP.x + sSP.w + width / 500, height - height / 18.75 - height / 250, width / 10, height / 18.75, true, color(18, 97, 196))) {
      veiwScreen = 1;
    }
  } else if (veiwScreen == 12) {
    // Navigation
    mNP.x = mSSP.x;
    mNP.y = mSSP.y + mSSP.h + height / 250;
    mNP.w = (width / 5.0)/2;
    mNP.h = height - mNP.y;

    image(temp, mSSP.x, mSSP.y + mSSP.h + height / 250, mSSP.w - width / 500, height - mSSP.y);
    fill(255);
    mNP.render();
    if (Button(mNP.x, mNP.y + (mNP.h / mNP.pc * 0), mNP.w, mNP.h/mNP.pc)) {
      warpFactor = 8;
    }
    if (Button(mNP.x, mNP.y + (mNP.h / mNP.pc * 1), mNP.w, mNP.h/mNP.pc)) {
      warpFactor = 7;
    }
    if (Button(mNP.x, mNP.y + (mNP.h / mNP.pc * 2), mNP.w, mNP.h/mNP.pc)) {
      warpFactor = 6;
    }
    if (Button(mNP.x, mNP.y + (mNP.h / mNP.pc * 3), mNP.w, mNP.h/mNP.pc)) {
      warpFactor = 5;
    }
    if (Button(mNP.x, mNP.y + (mNP.h / mNP.pc * 4), mNP.w, mNP.h/mNP.pc)) {
      warpFactor = 4;
    }
    if (Button(mNP.x, mNP.y + (mNP.h / mNP.pc * 5), mNP.w, mNP.h/mNP.pc)) {
      warpFactor = 3;
    }
    if (Button(mNP.x, mNP.y + (mNP.h / mNP.pc * 6), mNP.w, mNP.h/mNP.pc)) {
      warpFactor = 2;
    }
    if (Button(mNP.x, mNP.y + (mNP.h / mNP.pc * 7), mNP.w, mNP.h/mNP.pc)) {
      warpFactor = 1;
    }
    if (Button(mNP.x, mNP.y + (mNP.h / mNP.pc * 8), mNP.w, mNP.h/mNP.pc)) {
      warpFactor = 0.05;
    }
  }
}
