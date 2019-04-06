boolean ggfdsakfj = false, ggfdsakfjd = false;

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
    textAlign(CORNER, CORNER);
  }
}

boolean Button(String stringtext, float x, float y, float w, float h) {
  boolean t = false;
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(HYPOTNUCE / 50);
  rect(x, y, w, h, 5);
  fill(0);
  text(stringtext, x, y, w, h);
  if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && !ggfdsakfj && mousePressed) {
    ggfdsakfj = true;
  } else if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && ggfdsakfj && !mousePressed) {
    ggfdsakfj = false;
    t = true;
  }
  return t;
}

boolean Button(float x, float y, float w, float h) {
  boolean t = false;
  if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && !ggfdsakfjd && mousePressed) {
    ggfdsakfjd = true;
  } else if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && ggfdsakfjd && !mousePressed) {
    ggfdsakfjd = false;
    t = true;
  }
  return t;
}
