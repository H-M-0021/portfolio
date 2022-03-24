String t_n(int n) {//time_number

  String s1=String.valueOf(n/10);//nが一桁の時頭に0をつける
  String s2=String.valueOf(n%10);

  return s1+s2;
}

String now() {
  int m=minute(); //values from 0-59　分
  int h=hour(); //values from 0-23　時

  return(t_n(h)+":"+t_n(m));
}

String days() {
  int d=day();//日付
  int mon=month();//日
  int y=year();//年

  return(y+"/"+t_n(mon)+"/"+t_n(d));//y/m/d
}
