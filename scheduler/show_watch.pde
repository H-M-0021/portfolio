void show_watch() {//rat向き　r針の長さ
  float x1, y1;
  float x2, y2;
  float x3, y3;
  float ss, mm, hh;//角度

  int as=second(); //values from 0-59
  int am=minute(); //values from 0-59
  int ah=hour(); //values from 0-23

  ss =TWO_PI*as/60.0-PI/2.0; //秒針
  x1=x+95*cos(ss);//一番長い
  y1=y+95*sin(ss);
  strokeWeight(1);
  stroke(255, 255, 255);
  line(x, y, x1, y1);

  mm =TWO_PI*am/60.0+as*PI/1800-PI/2.0; //分針　長針
  x2=x+85*cos(mm);//短い
  y2=y+85*sin(mm);
  strokeWeight(2);
  stroke(0);
  line(x, y, x2, y2);

  hh=TWO_PI*ah/12.0+PI*am/360.0-PI/2.0; //時針　短針
  x3=x+65*cos(hh);//長い
  y3=y+65*sin(hh);
  strokeWeight(4);
  line(x, y, x3, y3);
}
