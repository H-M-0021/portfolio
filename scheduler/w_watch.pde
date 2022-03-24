void w_watch() {
  fill(0);
  textSize(60);
  text(now(), width/2, 100);//デジタル時計

  textSize(45);
  text(days(), width/2, 170);//日付

  noFill();
  show_watch();//針の表示

  strokeWeight(4);
  ellipse(x, y, 240, 240);//円

  textSize(10);
  for (int i=1; i<=12; i++) {//時計の時間表示
    float number=TWO_PI*i/12-PI/2.0;
    float xx=x+100*cos(number);//x座標
    float yy=(y+5)+100*sin(number);//y座標
    text(i, xx, yy);
  }

  noStroke();
  for (int i=0; i<3; i++) {//下の四角　別ページにとぶ
    if (mouseX>=i*140+45 && mouseX<=i*140+155 && mouseY>=500 && mouseY<=600) {
      fill(50*i, 200, 255);
      rect(i*140+45, 500, 110, 100, 10);//マウスがあるとき色を濃くする
    } else {
      fill(50*i, 100, 255);
      rect(i*140+45, 500, 110, 100, 10);//マウスがないときは普通
    }
  }

  image(photo, 40, 490);//カレンダー
  image(photo2, 200, 510);//円グラフ
  image(photo3, 340, 505);//タイマー
}
