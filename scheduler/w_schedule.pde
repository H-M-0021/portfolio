void w_schedule() {
  background(255);
  noFill();
  strokeWeight(1);

  String elements[] ={"sleep", "study", "class", "hobby", "other"};//種類

  noStroke();
  ellipse(280, 420, 300, 300);//大きい円
  ellipse(100, 100, 150, 150);//小さい円

  fill(140, 255, 255);
  textSize(35);
  text("-- this week's schedule --", 240, 240);//見出し
  textSize(20);
  text("-- last week's schedule --", 300, 50);//見出し

  for (int i=0; i<5; i++) {
    textSize(25);
    fill(250-i*50, 255, 255);
    text(elements[i], 60, i*50+320);
  } 

  drawGraph(280, 420, 300, a_week, 7);//今週のグラフ
  drawGraph(100, 100, 150, b_week, 7);//先週のグラフ

  fill(180);
  rect(50, 600, 30, 30);//ホームに戻る
}
