void sports_puyo() {
  if (k1>=2) {
    noFill();
    stroke(200, 200, 200, f);
    strokeWeight(3);
    ellipse(1366, 980, 500, 800);
    ellipse(0, 980, 500, 800);
    ellipse(width/2, 950, 500, 500);
    line(width/2, height*2/3+10, width/2, height);
    line(100, 560, width-100, 560);
    line(100, 560, 0, height);
    line(width-100, 560, width, height);

    stroke(50, 50, 50, f);
    strokeWeight(2);
    fill(50, 50, 50, f);
    rect(1210, 325, 20, 400);
    noFill();
    rect(1200, 100, 40, 225);
    line(1050, 200, 1200, 200);
    line(1050, 150, 1075, 300);
    line(1125, 150, 1125, 300);
    line(1200, 150, 1175, 300);

    stroke(255, 0, 0);//red
    fill(255, 0, 0);
    ellipse(bax, bay, 40, 35);
    ellipse(bbx, bby, 40, 35);
  }
}
