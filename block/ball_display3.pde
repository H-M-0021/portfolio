void ball_display3(float x, float y) { 

  if (x+ball_w >=width) {  //screen right
    dx3=-2;
  } else if (x<0) {  //screen left
    dx3=2;
  }

  if (y+ball_w >=height) {  //screen under
    dy3=-2;
  } else if (y<0) {  //screen over
    dy3=2;
  }
  if (x >=mouseX && x <= mouseX+bar_w && y+ball_w >530 && y>525) {//bar
    dy3=-2;
  }

  ball_x3=x+dx3;//x speed
  ball_y3=y+dy3;//y speed


  rect(x, y, ball_w, ball_w);//ball3

  for (int i=0; i<durable.length; i++) { //durable value
    for (int j=0; j<durable[i].length; j++) {
      if (durable[i][j]>0) {

        chb=checkHitBlock(j, i, ball_x3, ball_y3, 3, dx3, dy3);//blue
        chb2=checkHitBlock2(j, i, ball_x3, ball_y3, dx3, dy3);//other
        switch(chb) {
        case 1:
          durable[i][j]=0;//under
          dy3=2;
          score+=100;
          hit+=1;//hitcount
          break;
        case 2:
          durable[i][j]=0;//over
          dy3=-2;
          score+=100;
          hit+=1;//hitcount
          break;
        }
        switch(chb) {
        case 3:
          durable[i][j]=0;//right
          dx3=2;
          score+=100;
          hit+=1;//hitcount
          break;
        case 4:
          durable[i][j]=0;//left
          dx3=-2;
          score+=100;
          hit+=1;//hitcount
          break;
        }
        switch(chb2) {
        case 5://under
          dy3=2;
          break;
        case 6://over
          dy3=-2;
          break;
        case 7://right
          dx3=2;
          break;
        case 8://left
          dx3=-2;
          break;
        }
      }
    }
  }
  if (hit>=k) {//おじゃまブロック
    if (x+ball_w>=block_x && x<=block_x+block_w && y>300 && y<=312) {
      dy3=2;
    }
  }
}
