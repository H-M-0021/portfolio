//閏年の判定
boolean leapYear(int y) {//y=yearの意味
  return (y % 4 == 0 && y % 100 != 0) || (y % 400 == 0);
}


// y年m月の日数の判定
int daynumber(int y, int m) {//y=year m=month
  if (m == 2) { 
    if (leapYear(y)) { 
      return 29;//閏年の二月
    }
    return 28;//二月
  }
  if (8 <= m) { //8月以前は偶数奇数で分けられる
    m++;
  }
  return 30 + (m % 2);//通常の月
}


// y年m月1日の曜日判定
int first_d_w(int y, int m) {//first day of the week
  int f = y + (y - 1) / 4 - (y - 1) / 100 + (y - 1) / 400;//曜日判定
  for (int i = 1; i < m; i++) {
    f=f+daynumber(y, i);
  }
  return f % 7;
}
