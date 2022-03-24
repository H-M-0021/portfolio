void w_calendar2() {
  w = (year()+year()/4-year()/100+year()/400+(13*month()+8)/5+day())%7;//今日の曜日

  background(255);
  noStroke();

  textSize(40);
  fill(20, 255, 255);
  text("---- TO DO LIST ----", 240, 70);//見出し

  textSize(25);
  fill(10, 255, 255);
  text("---- "+month() +"/"+day()+" ("+week[w]+")", 360, 560);//今日の日付

  String yotei[]={"コン教課題", "線形代課題", "プロセ課題", "リテラシ課題", 
    "Word engine", "その他課題", "買い物に行く", "掃除をする", "洗濯をする", 
    "人と出かける", "家にいる", "その他"};//予定の選択肢

  textSize(25);
  fill(0);
  noFill();
  for (int i=0; i<6; i++) {
    if (c_click[i]==0) {
      if (mouseX>=45 && mouseX<=215 && mouseY>=i*70+120 && mouseY<=i*70+165) {//左
        fill(i*20+10, 150, 255);//マウスがあるとき色を濃くする
        rect(45, i*70+120, 170, 45, 15);
      } else {
        fill(i*20+10, 50, 255);//ないときは薄く
        rect(45, i*70+120, 170, 45, 15);
      }
    } else if (c_click[i]==1) {
      fill(i*20+10, 255, 255);//選択状態 もっと濃い
      rect(45, i*70+120, 170, 45, 15);
    }
    fill(50);
    text(yotei[i], 130, i*70+150);//予定
  }

  for (int i=6; i<12; i++) {
    if (c_click[i]==0) {
      if (mouseX>=265 && mouseX<=435 && mouseY>=i*70-300 && mouseY<=i*70-255) {//右
        fill(i*20-110, 150, 255);//マウスがあるとき色を濃くする
        rect(265, i*70-300, 170, 45, 15);
      } else {
        fill(i*20-110, 50, 255);//ないときは薄く
        rect(265, i*70-300, 170, 45, 15);
      }
    } else if (c_click[i]==1) {
      fill(i*20-110, 255, 255);//選択状態　もっと濃い
      rect(265, i*70-300, 170, 45, 15);
    }
    fill(50);
    text(yotei[i], 350, i*70-270);//予定
  }

  fill(180);
  rect(50, 600, 30, 30);//ホーム画面に戻る
}
