void p_graph(float x, float y, float r, float v1, float v2) {
  arc(x, y, r, r, TWO_PI*v1-PI*1/2, TWO_PI*v2-PI*1/2);//円グラフを書く
}

void drawGraph(float x, float y, float r, int[][] v, int j) {
  float sum=0.0;
  float crnt=0.0;//始点と終点

  for (int i=1; i<v[j].length; i++) {
    sum=sum+v[j][i];
  }

  for (int i=1; i<v[j].length; i++) {
    fill(300-i*50, 200, 255);
    p_graph(x, y, r, crnt, crnt=crnt+v[j][i]/sum);
  }
}
