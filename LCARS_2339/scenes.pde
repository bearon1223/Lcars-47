float scene = 0;
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
    Time(width / 74, height / 1.6, true);
  }
}
