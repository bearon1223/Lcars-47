void exteriorViewPort() {
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
    if (sxd && syd && szd) {
      if (warpFactor > 0.11) {
        warpFactor -= 0.25;
      } else {
        warpFactor = 0.05;
      }
    }
  } else {
    //v.x = mSSP.x;
    //v.y = mSSP.y + mSSP.h + height / 200;
    //v.w = mSSP.w - width / 500;
    //v.h = height - mSSP.y;
    //v.render();

    ViewScreenLarge.w = mSSP.w - width / 500;
    ViewScreenLarge.h = (height - mSSP.y - height / 250);

    translate(mSSP.x + (mSSP.w - width / 500)/2, sSP.y + (height - mSSP.y - height / 250)/2);
    ViewScreenLarge.update();
    translate(-(mSSP.x + (mSSP.w - width / 500)/2), -(sSP.y + (height - mSSP.y - height / 250)/2));

    if (sxd && syd && szd) {
      fill(0, 100, 255);
      ellipse(mSSP.x, mSSP.y + (height - (mSSP.y+mSSP.h)) / 2, width / 10, height / 1.25);
    }

    fill(0);
    rect(0, 0, width, mSSP.y);
    rect(0, mSSP.y, mSSP.x, height - mSSP.y);
  }
}

float Location = 0;

void navigation() {
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

  fill(100, 100, 255);
  ellipse(width / 1.333, height / 1.416, width / 4.0, height / 2.0);
  fill(0);
  ellipse(width / 1.333, height / 1.416, 160, 160);
  fill(100, 10, 255);
  ellipse(width / 1.333, height / 1.416, width / 6.66, height / 3.33);
}
