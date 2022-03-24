#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

#define k 3  //クラスタ数
#define test 100  //テストデータ数

int count[k] = {}; //クラスタ所属データの数
double point[k][2]; //代表点
int i = 0, j = 0;

/*テストデータ*/
double data[test][2] = {{85.84,12.91}, {32.57,73.26}, {80.42,5.91},  {40.43,19.88}, {74.96,43.44}, 
			{58.59,28.58}, {48.58,7.17},  {65.38,75.26}, {31.95,94.63}, {38.29,30.27}, 
			{12.60,82.52}, {54.48,27.64}, {90.59,45.54}, {36.61,22.89}, {26.35,18.94}, 
			{0.98,63.00},  {19.20,36.25}, {16.78,11.61}, {84.07,13.44}, {40.81,71.49}, 
			{51.25,40.47}, {19.89,8.65},  {15.63,86.00}, {74.85,92.83}, {30.41,38.10}, 
			{7.65,68.16},  {34.51,63.22}, {23.69,95.40}, {37.15,45.32}, {30.57,26.99}, 
			{15.01,89.76}, {58.91,55.35}, {22.15,94.40}, {67.49,37.17}, {41.49,72.24}, 
			{70.23,33.04}, {49.06,70.57}, {98.05,5.35},  {82.02,16.05}, {40.75,41.70},
			{17.68,37.25}, {81.58,90.64}, {24.33,39.94}, {12.21,9.69},  {53.01,20.00}, 
		  {18.19,31.24}, {56.05,64.44}, {79.07,96.30}, {37.54,76.33}, {51.35,19.73},
		  {19.18,97.68}, {67.91,53.34}, {45.46,13.89}, {32.07,54.54}, {59.60,41.32}, 
			{6.01,98.78},  {51.48,15.10}, {53.13,12.92}, {55.04,73.87}, {50.33,42.90}, 
			{94.64,73.42}, {49.62,98.37}, {2.87,1.90},   {47.19,21.45}, {79.27,58.23}, 
		  {15.72,43.90}, {65.88,6.83},  {71.45,21.23}, {30.47,70.86}, {49.27,81.88}, 
			{2.36,32.09},  {53.54,88.04}, {52.08,62.40}, {1.64,88.26},  {96.13,94.89}, 
		  {92.99,76.67}, {46.02,3.74},  {57.28,97.95}, {26.15,96.80}, {15.75,72.13}, 
			{61.51,62.02}, {70.52,90.12}, {32.02,54.71}, {74.22,1.16},  {79.51,87.82}, 
		  {23.70,88.40}, {32.40,57.36}, {45.23,29.76}, {17.24,67.29}, {39.54,52.77}, 
			{48.79,80.63}, {52.59,64.94}, {15.60,26.57}, {6.43,17.53},  {24.17,40.36}, 
		  {21.40,76.35}, {92.75,61.89}, {9.83,11.50},  {87.22,48.24},  {90.42,16.46}}; 

int data_cluster[test]; //テストデータがどのクラスタに所属するか

/*距離を測る関数*/
double dis(double px, double py, double dx, double dy){
  double distance;
  double x, y;

  x = dx - px;
  y = dy - py;
  x = x*x;
  y = y*y;
  distance = sqrt( x + y );

  return distance;
}

/*メイン関数*/
void cluster_function(){
  double point2[k][2] = {}; //新規代表点
  double distance[test][k]; // テストデータの距離、代表点分
  int OK = 0; //ループを止めていいならk*2

  /*各点と代表点の距離を測る*/
  for(i=0; i<test; i++){
    for(j=0; j<k; j++){
      distance[i][j] = dis(point[j][0], point[j][1], data[i][0], data[i][1]);
    }
    /*所属クラスタ*/
    if(distance[i][0] <= distance[i][1] && distance[i][0] <= distance[i][2])
      data_cluster[i] = 0;
    else if(distance[i][1] <= distance[i][0] && distance[i][1] <= distance[i][2])
      data_cluster[i] = 1;
    else
      data_cluster[i] = 2;

    /*距離の計算、クラスタ計算ができているかチェック
    printf("距離%.2f %.2f %.2f\n", distance[i][0], distance[i][1], distance[i][2]);
    printf("クラスタ%d\n", data_cluster[i]);
    */
  }


  /*所属クラスタごとに重心を算出*/
  for(i=0; i<test; i++){
    for(j=0; j<k; j++){
      if(data_cluster[i] == j){
        count[j]++;
        point2[j][0] = point2[j][0] + data[i][0]; //x座標
        point2[j][1] = point2[j][1] + data[i][1]; //y座標
      }
    }
  }
  
  /*クラスタ分類ができているかチェック
  printf("クラスタ数%d %d %d\n", count[0], count[1], count[2]);
  */

  /*重心*/
  for(i=0; i<k; i++){
    point2[i][0] = point2[i][0] / count[i]; //x座標
    point2[i][1] = point2[i][1] / count[i]; //y座標
  }

  /*重心の計算ができているかチェック
  printf("重心x %.2f %.2f %.2f\n", point2[0][0], point2[1][0], point2[2][0]); 
  printf("重心y %.2f %.2f %.2f\n", point2[0][1], point2[1][1], point2[2][1]); 
  */

  /*移動はあったか*/
  for(i=0; i<k; i++){
    for(j=0; j<2; j++){
      if(point[i][j] != point2[i][j]){
	point[i][j] = point2[i][j];
        point2[i][j] = 0;
	return 0;
      }else{
	OK++;
      }
    }
  }

  /*ループ可否*/
  if(OK == k*2){
    for(i=0; i<k; i++){
      for(j=0; j<2; i++){
	point[i][j] = point2[i][j];
        point2[i][j] = 0;
      }
    }
  }else{
    for(j=0; j<k; j++)
      count[j] = 0;
    cluster_function();
  }

}

int main(void){
  int cluster[k]; //代表点の添字

  //テストデータ表示
  printf("テストデータ\n");
  for(i=0; i<test; i++){
    printf("(%.2f, %.2f) ", data[i][0], data[i][1]);
  }
  printf("\n");

  /*rand()の初期化*/
  unsigned int now = (unsigned int)time(0);
  srand(now);
  rand(); rand(); rand(); rand(); rand(); //空実行
  
  /*k個の点を選ぶ*/
  for(i=0; i<k; i++){
    cluster[i] = rand() % test;
    if(i==1){ //重複回避
      while(cluster[i] == cluster[i-1])
        cluster[i] = rand() % test;
    }else if(i==2){ //重複回避
      while(cluster[i] == cluster[i-1] || cluster[i] == cluster[i-2])
	cluster[i] = rand() % test;
    }

    for(j=0; j<2; j++){ //代表点を代入
      point[i][j] = data[ cluster[i] ][j];
    }
  }

  /*ランダムの初期代表点チェック
  printf("%d, %d, %d\n", cluster[0], cluster[1], cluster[2]);
  for(i=0; i<3; i++){
    for(j=0; j<1; j++){
      printf("(%.2f, %.2f)\n", point[i][j], point[i][j+1]);
    }
  }
  */

  cluster_function();

  /*クラスタ分類の結果*/
  printf("クラスタ分類 結果\n");
  for(i=0; i<k; i++){
    printf("クラスタ%d 代表点 (%.2f, %.2f)\n", i, point[i][0], point[i][1]);
    for(j=0; j<test; j++){
      if(data_cluster[j] == i){
        printf("(%.2f, %.2f)\n", data[j][0], data[j][1]);
      }
    }
  }

  return 0;
}


