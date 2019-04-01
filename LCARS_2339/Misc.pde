void Time(float x, float y, boolean twentyfourhr) {
  String minute = str(minute()), hour = str(hour()), second;
  if(minute() < 10){
    minute = "0"+floor(minute());
  } else {
    minute = str(minute());
  }
  if(second() < 10){
    second = "0"+floor(second());
  } else {
    second = str(second());
  }
  if(hour() < 10){
    hour = "0"+floor(hour());
  } else {
    hour = str(hour());
  }
  if(twentyfourhr){
    text(hour+":"+minute+":"+second, x, y);
  }
}
