void chain_puyo() {
  strokeWeight(10);

  /*ぷよ表示の仕組み*/
  if (r<1) {
    d_p(0, 3, 4);//yellow
    d_p(1, 3, 4);//1連鎖目に消える
    d_p(1, 4, 4);
    ellipse(242, y1, 40, 35);
  }
  if (r<2) {
    d_p(0, 4, 3);//blue 
    d_p(0, 5, 3);//2
    d_p(1, 5, 3);
    ellipse(190, y2, 40, 35);
  }
  if (r<3) {
    d_p(0, 6, 4);//yellow
    d_p(0, 7, 4);//3
    d_p(1, 7, 4);
    ellipse(190, y23, 40, 35);
  }
  if (r<4) {
    d_p(0, 9, 1);//red
    d_p(1, 8, 1); //4
    d_p(1, 9, 1); 
    ellipse(242, y4, 40, 35);
  }
  if (r<5) {
    d_p(0, 10, 2); //green
    d_p(0, 11, 2); //5
    d_p(1, 11, 2);
    ellipse(190, y5, 40, 35);
  }
  if (r<6) {
    d_p(2, 11, 3); //blue
    d_p(3, 10, 3); //6
    d_p(3, 11, 3);
    ellipse(242, y6, 40, 35);
  }
  if (r<7) {
    d_p(4, 10, 4);//yellow
    d_p(4, 11, 4);//7
    ellipse(294, y71, 40, 35);
    ellipse(346, y72, 40, 35);
  }
  if(r<8) {
    stroke(0, 255, 0);//green
    fill(0, 255, 0);
    ellipse(294, y781, 40, 35);
    ellipse(346, y782, 40, 35);
    ellipse(346, y783, 40, 35);
    ellipse(398, y8, 40, 35);
  }
  if (r<9) {
    stroke(0, 0, 255);//blue
    fill(0, 0, 255);
    ellipse(346, y79, 40, 35);
    ellipse(398, y891, 40, 35);
    ellipse(398, y892, 40, 35);
    d_p(5, 10, 3);
  }
  if (r<10) {
    stroke(255, 0, 0);//red
    fill(255, 0, 0);
    ellipse(398, y8101, 40, 35);
    ellipse(398, y8102, 40, 35);
    ellipse(450, y101, 40, 35);
    ellipse(450, y102, 40, 35);
  }
  if (r<11) {
    stroke(0, 255, 0);//green
    fill(0, 255, 0);
    ellipse(398, y8111, 40, 35);
    ellipse(398, y8112, 40, 35);
    ellipse(450, y1011, 40, 35);
    d_p(5, 11, 2);
  }
  if (r<12) {
    stroke(255, 255, 0);//yellow
    fill(255, 255, 0);
    ellipse(346, y712, 40, 35);
    ellipse(398, y812, 40, 35);
    ellipse(450, y1121, 40, 35);
    ellipse(450, y1122, 40, 35);
  }
  /*あまりもの赤ぷよ*/
  if (r<13) {
    stroke(255, 0, 0);//red
    fill(255, 0, 0);
    ellipse(398, ba_y, 40, 35);
    ellipse(450, bb_y, 40, 35);
  }
}


void d_p(int s, float t, int c) {//drow puyo
  if (c==1) {
    stroke(255, 0, 0);//red
    fill(255, 0, 0);
  } else if (c==2) {
    stroke(0, 255, 0);//green
    fill(0, 255, 0);
  } else if (c==3) {
    stroke(0, 0, 255);//blue
    fill(0, 0, 255);
  } else if (c==4) {
    stroke(255, 255, 0);//yellow
    fill(255, 255, 0);
  }
  strokeWeight(10);

  ellipse(190+s*52, 155+t*45, 40, 35);
}
