void setup() {
  size(480, 640);
  colorMode(HSB);
  textAlign(CENTER);
  PFont myFont = createFont("Yu Gothic", 25, true);
  textFont(myFont);

  for (int i=0; i<c_click.length; i++) {
    c_click[i]=0;//今日の予定で使う配列
  }

  loadData();//メモからデータロード

  photo=loadImage("calendar.png");//カレンダー
  photo2=loadImage("graph.png");//グラフ
  photo3=loadImage("todolist.png");//タイマー
}

PImage photo;
PImage photo2;
PImage photo3;

int window=0; //画面切り替え
int x=240; //アナログ時計の真ん中
int y=330;//同じく

int year  = year(); // 年
int month= month(); //月
int day=day();//日
int w; // 曜日

String []week = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};//曜日

int []c_click=new int[12];//今日の予定ボタンに対応
int[][] b_week, a_week;//before と after

void draw() {
  background(255);
  if (window ==0) {
    w_watch();//ホーム画面
  } else if (window ==1) {
    w_calendar();//カレンダー
  } else if (window ==2) {
    w_schedule();//スケジュール
  } else if (window==3) {
    w_calendar2();//今日の予定
  }
}


void mousePressed() {
  //画面遷移
  if (window==0 &&mouseY>=500 && mouseY<=600) {//ホーム画面から
    if ( mouseX>=45 && mouseX<=155 ) {//カレンダーにとぶ
      window=1;
    } else if (mouseX>=185 && mouseX<=295) {//スケジューラーにとぶ
      window=2;
    } else if (mouseX>=325 && mouseX<=435) {//今日の予定にとぶ
      window=3;
    }
  } else if (window==1) {
    if (mouseX>=50 && mouseX <=80 && mouseY >=600 && mouseY <=630) {
      //カレンダーからホーム画面へ
      window=0;
    }
  } else if (window==2) {
    if (mouseX>=50 && mouseX <=80 && mouseY >=600 && mouseY <=630) {    
      //スケジューラーからホーム画面へ
      window=0;
    }
  } else if (window==3) {
    if (mouseX>=50 && mouseX <=80 && mouseY >=600 && mouseY <=630) {
      //今日の予定からホーム画面へ
      window=0;
    }
  } 



  //それぞれの画面について
  if (window==1) {//カレンダー
    if (mouseX>=155 && mouseX<=175 && mouseY>=25 && mouseY<=45) {//カレンダー月マイナス
      month=month-1;
      if (month==0) {
        year=year-1;
        month=12;
      }
    } else if (mouseX>=300 && mouseX<=320 && mouseY>=25 && mouseY<=45) {//カレンダー月プラス
      month=month+1;
      if (month==13) {
        year=year+1;
        month=1;
      }
    }
  } else if (window==3) {//今日の予定
    for (int i=0; i<6; i++) {
      if (mouseX>=45 && mouseX<=215 && mouseY>=i*70+120 && mouseY<=i*70+165) {
        if (c_click[i]==0) {
          c_click[i]=1;//選択状態にする
        } else {
          c_click[i]=0;//解除
        }
      }
    }
    for (int i=6; i<12; i++) {//上に同じく
      if (mouseX>=265 && mouseX<=435 && mouseY>=i*70-300 && mouseY<=i*70-255) {
        if (c_click[i]==0) {
          c_click[i]=1;//選択状態にする
        } else {
          c_click[i]=0;
        }
      }
    }
  }
}
