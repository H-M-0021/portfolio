void ball_display4(float x, float y) { 

  if (x+ball_w >=width) {  //screen right
    dx4=-3;
  } else if (x<0) {  //screen left
    dx4=3;
  }

  if (y+ball_w >=height) {  //screen down
    dy4=-3;
  } else if (y<0) {  //screen up
    dy4=3;
  }
  if (x >=mouseX && x <= mouseX+bar_w && y+ball_w >530 && y>525) {//bar
    dy4=-3;
  }

  ball_x4=x+dx4;//x speed
  ball_y4=y+dy4;//y speed   


  rect(x, y, ball_w, ball_w);//ball4

  for (int i=0; i<durable.length; i++) { //durable value
    for (int j=0; j<durable[i].length; j++) {
      if (durable[i][j]>0) {

        chb=checkHitBlock(j, i, ball_x4, ball_y4, 4, dx4, dy4);//yellow
        chb2=checkHitBlock2(j, i, ball_x4, ball_y4, dx4, dy4);//other
        switch(chb) {
        case 1:
          durable[i][j]=0;//under
          dy4=3;
          score+=100;
          hit+=1;//hitcount
          break;
        case 2:
          durable[i][j]=0;//over
          dy4=-3;
          score+=100;
          hit+=1;//hitcount
          break;
        }
        switch(chb) {
        case 3:
          durable[i][j]=0;//right
          dx4=3;
          score+=100;
          hit+=1;//hitcount
          break;
        case 4:
          durable[i][j]=0;//left
          dx4=-3;
          score+=100;
          hit+=1;//hitcount
          break;
        }
        switch(chb2) {
        case 5://under
          dy4=3;
          break;
        case 6://over
          dy4=-3;
          break;
        case 7://right
          dx4=3;
          break;
        case 8://left
          dx4=-3;
          break;
        }
      }
    }
  }
  if (hit>=k) {//おじゃまブロック
    if (x+ball_w>=block_x && x<=block_x+block_w && y>300 && y<=312) {
      dy4=3;
    }
  }
}
