void w_calendar() {
  background(255);
  strokeWeight(1);

  int d = 1; // 日付

  fill(180);
  noStroke();
  rect(50, 600, 30, 30);//ホーム画面へ戻る

  for (int i=0; i<2; i++) {
    if (mouseX>=i*145+155 && mouseX<=i*145+175 && mouseY>=25 && mouseY<=45) {
      fill(100);//マウスをかざすと色が濃くなる
      stroke(100);
      rect(i*145+155, 25, 20, 20);//クリックすると月が+1される
    } else {
      fill(180);
      stroke(180);
      rect(i*145+155, 25, 20, 20);//クリックすると月が+1される
    }
  }


  fill(255, 255, 210);
  textSize(50);
  text(month, width / 2, 55);  // 月

  fill(255, 255, 210);
  textSize(25);
  text(year, 80, 50);//年

  w = first_d_w(year, month);//曜日へ代入


  // 曜日
  textSize(20);
  for (int i = 0; i < 7; i++) {
    fill(i * 50 * 255 / width, 255, 210);//色変更
    text(week[i], i*60+60, 110);
  }

  //日付表示
  textSize(15);
  fill(0);
  for (int i = 0; i < 6; i++) {    
    for (int j = 0; j < 7; j++) {      
      if (d > daynumber(year, month)) { 
        break;//止める
      }
      // 朔日を曜日の分だけ移動
      if (w < 7) { 
        j = w;
        text(str(d), j*60+60, i * 70+145);
        w=w+1;
      } else {
        text(str(d), j*60+60, i * 70+145);
      }
      d=d+1;//日付に足す
    }
    stroke(180);
    line(35, i*70+122, width-35, i*70+122);//カレンダーの横線
  }
  d=0;//初期化
}
