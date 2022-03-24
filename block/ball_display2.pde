void ball_display2(float x, float y) { 

  if (x+ball_w >=width) {  //screen right
    dx2=-3;
  } else if (x<0) {  //screen left
    dx2=3;
  }

  if (y+ball_w >=height) {  //screen under
    dy2=-2;
  } else if (y<0) {  //screen over
    dy2=2;
  }
  if (x >=mouseX && x <= mouseX+bar_w && y+ball_w >530 && y>525) {//bar
    dy2=-2;
  }

  ball_x2=x+dx2; //x speed
  ball_y2=y+dy2; //y speed


  rect(x, y, ball_w, ball_w); //ball2

  for (int i=0; i<durable.length; i++) { //durable value
    for (int j=0; j<durable[i].length; j++) {
      if (durable[i][j]>0) {

        chb=checkHitBlock(j, i, ball_x2, ball_y2, 2, dx2, dy2); //green
        chb2=checkHitBlock2(j, i, ball_x2, ball_y2, dx2, dy2); //other
        switch(chb) {
        case 1:
          durable[i][j]=0; //under
          dy2=2;
          score+=100;
          hit+=1;//hitcount
          break;
        case 2:
          durable[i][j]=0; //over
          dy2=-2;
          score+=100;
          hit+=1;//hitcount
          break;
        }
        switch(chb) {
        case 3:
          durable[i][j]=0; //right
          dx2=3;
          score+=100;
          hit+=1;//hitcount
          break;
        case 4:
          durable[i][j]=0; //left
          dx2=-3;
          score+=100;
          hit+=1;//hitcount
          break;
        }
        switch(chb2) {
        case 5://under
          dy2=2;
          break;
        case 6://over
          dy2=-2;
          break;
        case 7://right
          dx2=3;
          break;
        case 8://left
          dx2=-3;
          break;
        }
      }
    }
  }
  if (hit>=k) {//おじゃまブロック
    if (x+ball_w>=block_x && x<=block_x+block_w && y>300 && y<=312) {
      dy2=2;
    }
  }
}
