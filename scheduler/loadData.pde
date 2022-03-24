void loadData() {
  String [] lines = loadStrings("week1_1019225.txt");//先週のスケジュール
  String [] datas = loadStrings("week2_1019225.txt");//今週のスケジュール

  b_week=new int[lines.length][];//配列に代入
  a_week=new int[datas.length][];

  for (int i=0; i<8; i++) {
    //d=int(split(lines[i],","));
    b_week[i]=int(lines[i].split(","));//縦/横
    a_week[i]=int(datas[i].split(","));
  }
}
