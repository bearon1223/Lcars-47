boolean ggfdsakfj = false, ggfdsakfjd = false;

void OneCircleButton(float x, float y, float widthb, float heightb) {
  float w = widthb / 4, h = heightb / 4;
  rect(x + (75) * w, y + (0) * h, w * 360, h * 165);
  ellipse(x + (82) * w, y + (82) * h, w * 165, h * 165);
}

void Time(float x, float y, float w, float h, boolean twentyfourhr) {
  String minute = str(minute()), hour = str(hour()), second;
  if (minute() < 10) {
    minute = "0"+floor(minute());
  } else {
    minute = str(minute());
  }
  if (second() < 10) {
    second = "0"+floor(second());
  } else {
    second = str(second());
  }
  if (hour() < 10) {
    hour = "0"+floor(hour());
  } else {
    hour = str(hour());
  }
  if (twentyfourhr) {
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(HYPOTNUCE / 25);
    text(hour+":"+minute+":"+second, x, y, w, h);
  }
}

boolean Button(String stringtext, float x, float y, float w, float h, boolean isRounded, color c) {
  boolean t = false;
  noStroke();
  fill(c);
  textAlign(CENTER, CENTER);
  textSize(HYPOTNUCE / 66);
  if (quality == 0  || (quality == 2 && !isRounded)) {
    rect(x, y, w, h, 0);
  } else if (isRounded || quality == 1) {
    rect(x, y, w, h, RATIOWH * 500);
  }
  fill(0);
  text(stringtext, x, y, w, h);
  if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && !ggfdsakfj && mousePressed) {
    ggfdsakfj = true;
  } else if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && ggfdsakfj && !mousePressed) {
    ggfdsakfj = false;
    t = true;
    if (isNotMuted)
      click.play();
  }
  stroke(0);
  return t;
}

boolean Button(String stringtext, float x, float y, float wp, float hp, float w, float h, color c) {
  boolean t = false;
  noStroke();
  fill(c);
  textAlign(CENTER, CENTER);
  textSize(HYPOTNUCE / 66);
  if (quality > 1) {
    OneCircleButton(x, y, wp, hp);
  } else if (quality == 0) {
    rect(x, y, w, h);
  } else if (quality == 1) {
    rect(x, y, w, h, RATIOWH*500);
  }
  fill(0);
  text(stringtext, x, y, w, h);
  if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && !ggfdsakfj && mousePressed) {
    ggfdsakfj = true;
  } else if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && ggfdsakfj && !mousePressed) {
    ggfdsakfj = false;
    t = true;
    if (isNotMuted)
      click.play();
  }
  stroke(0);
  return t;
}

boolean Button(float x, float y, float w, float h) {
  boolean t = false;
  if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && !ggfdsakfjd && mousePressed) {
    ggfdsakfjd = true;
  } else if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && ggfdsakfjd && !mousePressed) {
    ggfdsakfjd = false;
    t = true;
    if (isNotMuted)
      click.play();
  }
  return t;
}
