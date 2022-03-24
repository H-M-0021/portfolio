int checkHitBlock2(int n, int m, float x, float y, float dx, float dy) {//色によらない

  if ((30*n+15) <=x+ball_w && (30*n+35) >=x) {//xの範囲
    if (dy<0 && (30*m+40) >=y && (30*m+30) <=y) {//yの範囲
      return 5;
    } else if (dy>0 && (30*m+20) <=y+ball_w && (30*m+30) >=y+ball_w) {//yの範囲
      return 6;
    }
  }
  if ((30*m+20) <=y+ball_w && (30*m+40) >=y) {//yの範囲
    if (dx<0 && (30*n+35) >=x && (30*n+25) <=X) {//xの範囲
      return 7;
    } else if (dx>0 && (30*n+15) <=x+ball_w && (30*n+25) >=x+ball_w) {//xの範囲
      return 8;
    }
  }

  return 0;//noting
}
