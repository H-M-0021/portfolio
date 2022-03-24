void ball_display(float x, float y) { 

  if (x+ball_w >=width) {  //screen right
    dx=-2;
  } else if (x<0) {  //screen left
    dx=2;
  }

  if (y+ball_w >=height) {  //screen under
    dy=-3;
  } else if (y<0) {  //screen over
    dy=3;
  }
  if (x >=mouseX && x <= mouseX+bar_w && y+ball_w >530 && y>525) { //bar
    dy=-3;
  }
  ball_x=x+dx; //x speed
  ball_y=y+dy; //y speed


  rect(x, y, ball_w, ball_w); //ball1

  for (int i=0; i<durable.length; i++) { //durable value
    for (int j=0; j<durable[i].length; j++) {
      if (durable[i][j]>0) {

        chb=checkHitBlock(j, i, ball_x, ball_y, 1, dx, dy); //red
        chb2=checkHitBlock2(j, i, ball_x, ball_y, dx, dy);//other
        switch(chb) {
        case 1: 
          durable[i][j]=0;//under
          dy=3;
          score+=100;
          hit+=1;//hitcount
          break;
        case 2: 
          durable[i][j]=0;//over
          dy=-3;
          score+=100;
          hit+=1;//hitcount
          break;
        }
        switch(chb) {
        case 3:
          durable[i][j]=0;//right
          dx=2;
          score+=100;
          hit+=1;//hitcount
          break;
        case 4:
          durable[i][j]=0;//left
          dx=-2;
          score+=100;
          hit+=1;//hitcount
          break;
        }
        switch(chb2) {
        case 5://under
          dy=3;
          break;
        case 6://over
          dy=-3;
          break;
        case 7://right
          dx=2;
          break;
        case 8://left
          dx=-2;
          break;
        }
      }
    }
  }
  if (hit>=k) {//おじゃまブロック
    if (x+ball_w>=block_x && x<=block_x+block_w && y>300 && y<=312) {
      dy=3;
    }
  }
}
