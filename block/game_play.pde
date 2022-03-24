void game_play() {
  background(255);
  int bar_x=mouseX; //bar
  if (bar_x+100>=width) {  //screen right
    bar_x=width-100;
  }
  fill(100, 1, 37); //black
  rect(bar_x, 530, bar_w, 8);  //bar size


  fill(255, 99, 71); //red
  ball_display(ball_x, ball_y); //ball1

  fill(34, 139, 34); //green
  ball_display2(ball_x2, ball_y2); //ball2

  fill(65, 105, 225); //brue
  ball_display3(ball_x3, ball_y3); //ball3

  fill(255, 255, 0); //yellow
  ball_display4(ball_x4, ball_y4); //ball4


  if (ball_y+ball_w>=height || ball_y2+ball_w>=height  //score-
    || ball_y3+ball_w>=height || ball_y4+ball_w>=height) {
    score=score-30;//ミスすると-30
  }

  fill(108, 53, 36);  //score chocolate color
  textSize(30);
  text("score:"+score, 25, 225); //score:0

  obstruction_block(); //obstruction
}
