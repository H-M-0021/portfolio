import processing.serial.*;
import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer player;

AniSequence seq;

void setup() {
  initServo();
  fullScreen();
  smooth();
  textAlign(CENTER);
  background(166, 255, 94);

  if (arduinoOn) {
    printArray(Serial.list()); // 使用可能なシリアルポート一覧の出力。デバッグ用
    String portName = Serial.list()[0]; // 使用するシリアルポート名
    serialPort = new Serial(this, portName, 9600);
    serialPort.buffer(inByte.length); // 読み込むバッファの長さをの指定
    initServo();
  }

  Ani.init(this);

  seq=new AniSequence(this);

  seq.beginSequence();
  /*ぷよ連鎖*/
  seq.add(Ani.to(this, 1.5, "y1:245", Ani.BOUNCE_OUT, "onEnd:functionA"));

  seq.beginStep();
  seq.add(Ani.to(this, s, "y2:290", Ani.BOUNCE_OUT));
  seq.add(Ani.to(this, s, "y23:245", Ani.BOUNCE_OUT, "onEnd:functionA"));
  seq.endStep();

  seq.add(Ani.to(this, s, "y23:380", Ani.BOUNCE_OUT, "onEnd:functionA"));

  seq.add(Ani.to(this, s, "y4:470", Ani.BOUNCE_OUT, "onEnd:functionA"));

  seq.add(Ani.to(this, s, "y5:560", Ani.BOUNCE_OUT, "onEnd:functionA"));

  seq.add(Ani.to(this, s, "y6:650", Ani.BOUNCE_OUT, "onEnd:functionA"));

  seq.beginStep();
  seq.add(Ani.to(this, s, "y71:650", Ani.BOUNCE_OUT, "onEnd:functionA"));
  seq.add(Ani.to(this, s, "y72:650, y781:605, y782:560, y783:605", Ani.BOUNCE_OUT));
  seq.add(Ani.to(this, s, "y79:515, y712:470", Ani.BOUNCE_OUT));
  seq.endStep();

  seq.beginStep();
  seq.add(Ani.to(this, s, "y781:650", Ani.BOUNCE_OUT, "onEnd:functionA"));
  seq.add(Ani.to(this, s, "y79:560, y712:515, y782:605, y783:650", Ani.BOUNCE_OUT));
  seq.add(Ani.to(this, s, "y8:605, y891:560, y892:650", Ani.BOUNCE_OUT));
  seq.add(Ani.to(this, s, "y8101:380, y8102:425, y8111:470, y8112:515", Ani.BOUNCE_OUT));
  seq.add(Ani.to(this, s, "y812:335, ba_y:290", Ani.BOUNCE_OUT));
  seq.endStep();

  seq.beginStep();
  seq.add(Ani.to(this, s, "y891:605", Ani.BOUNCE_OUT, "onEnd:functionA"));
  seq.add(Ani.to(this, s, "y79:650, y712:605, y8101:425, y8102:470, y8111:515, y8112:560 ", Ani.BOUNCE_OUT));
  seq.add(Ani.to(this, s, "y812:380, ba_y:335", Ani.BOUNCE_OUT));
  seq.endStep();

  seq.beginStep();
  seq.add(Ani.to(this, s, "y101:560", Ani.BOUNCE_OUT, "onEnd:functionA"));
  seq.add(Ani.to(this, s, "y712:650, y102:605, y8101:515, y8102:560, y8111:605, y8112:650 ", Ani.BOUNCE_OUT));
  seq.add(Ani.to(this, s, "y812:470, ba_y:425", Ani.BOUNCE_OUT));
  seq.add(Ani.to(this, s, "y1011:515, y1121:425, y1122:470, bb_y:380", Ani.BOUNCE_OUT));
  seq.endStep();

  seq.beginStep();
  seq.add(Ani.to(this, s, "y1011:605", Ani.BOUNCE_OUT, "onEnd:functionA"));
  seq.add(Ani.to(this, s, "y812:560, ba_y:515", Ani.BOUNCE_OUT));
  seq.add(Ani.to(this, s, "y1121:515, y1122:560, bb_y:470", Ani.BOUNCE_OUT));
  seq.endStep();

  seq.beginStep();
  seq.add(Ani.to(this, s, "y812:650", Ani.BOUNCE_OUT, "onEnd:functionA"));
  seq.add(Ani.to(this, s, "y1121:605, y1122:650, ba_y:605, bb_y:560", Ani.BOUNCE_OUT));
  seq.endStep();

  seq.beginStep();
  seq.add(Ani.to(this, s, "ba_y:650", Ani.BOUNCE_OUT));
  seq.add(Ani.to(this, s, "bb_y:650", Ani.BOUNCE_OUT, "onEnd:functionB"));
  seq.endStep();


  /*ぷよ逃げ出す*/
  seq.add(Ani.to(this, 1.0, "bay:650", Ani.LINEAR, "onStart:functionA"));//A跳ねる
  seq.add(Ani.to(this, 0.3, "bay:630", Ani.QUAD_OUT));
  seq.add(Ani.to(this, 0.2, "bay:650", Ani.QUAD_IN));
  seq.add(Ani.to(this, 0.5, "bay:600", Ani.QUAD_OUT));
  seq.add(Ani.to(this, 0.4, "bay:650", Ani.QUAD_IN));

  seq.add(Ani.to(this, 0.2, "bby:640", Ani.QUART_OUT));//B跳ねる
  seq.add(Ani.to(this, 0.1, "bby:650", Ani.QUART_IN));
  seq.add(Ani.to(this, 0.5, "bby:610", Ani.CUBIC_OUT));
  seq.add(Ani.to(this, 0.4, "bby:650", Ani.CUBIC_IN));

  seq.add(Ani.to(this, 0.5, "bay:650"));//A左に行く
  seq.beginStep();
  seq.add(Ani.to(this, 0.2, "bax:318", Ani.SINE_IN));
  seq.add(Ani.to(this, 0.2, "bay:580", Ani.SINE_OUT));
  seq.endStep();
  seq.beginStep();
  seq.add(Ani.to(this, 0.1, "bax:258", Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.1, "bay:650", Ani.SINE_IN));
  seq.endStep();

  seq.add(Ani.to(this, 0.5, "bay:650"));//A助走
  seq.add(Ani.to(this, 0.2, "bay:620", Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.1, "bay:650", Ani.SINE_IN));
  seq.add(Ani.to(this, 0.2, "bay:620", Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.1, "bay:650", Ani.SINE_IN));

  seq.beginStep();//A外に出る
  seq.add(Ani.to(this, 0.3, "bax:588", Ani.SINE_IN));
  seq.add(Ani.to(this, 0.3, "bay:350", Ani.SINE_OUT));
  seq.endStep();
  seq.beginStep();
  seq.add(Ani.to(this, 0.2, "bax:918", Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.2, "bay:650", Ani.SINE_IN));
  seq.endStep();

  seq.add(Ani.to(this, 0.5, "bby:650"));//Bも外へ
  seq.add(Ani.to(this, 0.3, "bbx:430", Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "bby:650"));
  seq.add(Ani.to(this, 0.3, "bbx:400", Ani.SINE_IN));
  seq.add(Ani.to(this, 0.3, "bby:650"));
  seq.beginStep();
  seq.add(Ani.to(this, 0.25, "bbx:600", Ani.SINE_IN));
  seq.add(Ani.to(this, 0.25, "bby:450", Ani.SINE_OUT));
  seq.endStep();
  seq.beginStep();
  seq.add(Ani.to(this, 0.15, "bbx:800", Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.15, "bby:650", Ani.SINE_IN));
  seq.endStep();

  seq.add(Ani.to(this, 0.5, "bay:650"));//応答しあう
  seq.add(Ani.to(this, 0.4, "bay:600", Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.3, "bay:650", Ani.SINE_IN));
  seq.add(Ani.to(this, 0.2, "bby:650"));
  seq.add(Ani.to(this, 0.4, "bby:620", Ani.QUAD_OUT));
  seq.add(Ani.to(this, 0.3, "bby:650", Ani.QUAD_IN));
  seq.add(Ani.to(this, 0.5, "bby:650"));

  seq.beginStep();//次の世界へ(2秒)
  seq.add(Ani.to(this, 0.5, "t:5", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "bay:500", Ani.QUAD_OUT));
  seq.add(Ani.to(this, 0.5, "bby:500", Ani.QUAD_OUT));
  seq.endStep();
  seq.beginStep();
  seq.add(Ani.to(this, 0.5, "t:10", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "bay:650", Ani.QUAD_IN));
  seq.add(Ani.to(this, 0.5, "bby:650", Ani.QUAD_IN));
  seq.endStep();
  seq.beginStep();
  seq.add(Ani.to(this, 0.5, "t:15", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "bay:500", Ani.QUAD_OUT));
  seq.add(Ani.to(this, 0.5, "bby:500", Ani.QUAD_OUT));
  seq.endStep();
  seq.beginStep();
  seq.add(Ani.to(this, 0.5, "t:20", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "bay:650", Ani.QUAD_IN));
  seq.add(Ani.to(this, 0.5, "bby:650", Ani.QUAD_IN, "onEnd:functionB"));
  seq.endStep();  

  seq.beginStep();//背景変化しだす(3秒)
  seq.add(Ani.to(this, 0.5, "R:179.5", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "G:251.5", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "B:100.5", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "R2:179.5", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "G2:253", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "B2:116", Ani.LINEAR));  
  seq.add(Ani.to(this, 0.5, "f:42.5", Ani.LINEAR)); 
  seq.add(Ani.to(this, 0.5, "bay:500", Ani.QUAD_OUT));
  seq.add(Ani.to(this, 0.5, "bby:500", Ani.QUAD_OUT));
  seq.endStep();
  seq.beginStep();
  seq.add(Ani.to(this, 0.5, "R:195", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "G:248", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "B:106", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "R2:193", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "G2:251", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "B2:137", Ani.LINEAR));  
  seq.add(Ani.to(this, 0.5, "f:85", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "bay:650", Ani.QUAD_IN));
  seq.add(Ani.to(this, 0.5, "bby:650", Ani.QUAD_IN));
  seq.endStep();
  seq.beginStep();
  seq.add(Ani.to(this, 0.5, "R:210", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "G:244", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "B:111.5", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "R2:206.5", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "G2:249", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "B2:158", Ani.LINEAR));  
  seq.add(Ani.to(this, 0.5, "f:127.5", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "bay:500", Ani.QUAD_OUT));
  seq.add(Ani.to(this, 0.5, "bby:500", Ani.QUAD_OUT));
  seq.endStep();
  seq.beginStep();
  seq.add(Ani.to(this, 0.5, "R:225", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "G:240", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "B:117", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "R2:220", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "G2:247", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "B2:179", Ani.LINEAR)); 
  seq.add(Ani.to(this, 0.5, "f:170", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "bay:650", Ani.QUAD_IN));
  seq.add(Ani.to(this, 0.5, "bby:650", Ani.QUAD_IN));
  seq.endStep();
  seq.beginStep();
  seq.add(Ani.to(this, 0.5, "R:240", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "G:236", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "B:122.5", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "R2:233.5", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "G2:245", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "B2:201", Ani.LINEAR));  
  seq.add(Ani.to(this, 0.5, "f:212.5", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "bay:500", Ani.QUAD_OUT));
  seq.add(Ani.to(this, 0.5, "bby:500", Ani.QUAD_OUT));
  seq.endStep();
  seq.beginStep();
  seq.add(Ani.to(this, 0.5, "R:255", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "G:232", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "B:128", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "R2:247", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "G2:243", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "B2:223", Ani.LINEAR));  
  seq.add(Ani.to(this, 0.5, "f:255", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "bay:650", Ani.QUAD_IN));
  seq.add(Ani.to(this, 0.5, "bby:650", Ani.QUAD_IN));
  seq.endStep();

  /*バスケの世界*/
  seq.add(Ani.to(this, 0.5, "bay:650"));//応答しあう
  seq.add(Ani.to(this, 0.3, "bay:600", Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.2, "bay:650", Ani.SINE_IN));
  seq.add(Ani.to(this, 0.4, "bby:650"));
  seq.add(Ani.to(this, 0.4, "bby:620", Ani.QUAD_OUT));
  seq.add(Ani.to(this, 0.3, "bby:650", Ani.QUAD_IN));
  seq.add(Ani.to(this, 0.8, "bby:650"));

  //bax=918 bbx=800;
  seq.add(Ani.to(this, 0.5, "bax:400", Ani.BOUNCE_OUT));//a遊ぶ;
  seq.add(Ani.to(this, 0.5, "bax:400"));
  seq.beginStep();
  seq.add(Ani.to(this, 0.7, "bax:1125", Ani.SINE_IN));
  seq.add(Ani.to(this, 0.7, "bay:100", Ani.SINE_OUT));
  seq.endStep();
  seq.add(Ani.to(this, 0.6, "bay:650", Ani.BOUNCE_OUT));

  seq.add(Ani.to(this, 0.5, "bay:650"));
  seq.add(Ani.to(this, 0.3, "bay:630", Ani.QUAD_OUT));//a跳ねる
  seq.add(Ani.to(this, 0.2, "bay:650", Ani.QUAD_IN));
  seq.add(Ani.to(this, 0.4, "bay:600", Ani.QUAD_OUT));
  seq.add(Ani.to(this, 0.3, "bay:650", Ani.QUAD_IN));
  seq.add(Ani.to(this, 0.3, "bay:650", Ani.LINEAR));
  seq.add(Ani.to(this, 0.5, "bax:950", Ani.LINEAR));

  seq.add(Ani.to(this, 0.8, "bby:650"));
  seq.add(Ani.to(this, 0.7, "bbx:350", Ani.BOUNCE_OUT));//b遊ぶ
  seq.add(Ani.to(this, 0.5, "bby:650"));
  seq.beginStep();
  seq.add(Ani.to(this, 0.6, "bbx:1125", Ani.SINE_IN));
  seq.add(Ani.to(this, 0.6, "bby:100", Ani.SINE_OUT));
  seq.endStep();
  seq.add(Ani.to(this, 0.5, "bby:650", Ani.BOUNCE_OUT));
  seq.add(Ani.to(this, 0.5, "bby:650"));
  seq.beginStep();
  seq.add(Ani.to(this, 0.3, "bbx:975", Ani.SINE_IN));
  seq.add(Ani.to(this, 0.3, "bby:500", Ani.SINE_OUT));
  seq.endStep();
  seq.beginStep();
  seq.add(Ani.to(this, 0.2, "bbx:825", Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.2, "bby:650", Ani.SINE_IN));
  seq.endStep();

  seq.add(Ani.to(this, 0.5, "bay:650"));
  seq.add(Ani.to(this, 0.3, "bay:620", Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.2, "bay:650", Ani.SINE_IN));
  seq.add(Ani.to(this, 0.3, "bay:620", Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.2, "bay:650", Ani.SINE_IN));

  seq.add(Ani.to(this, 0.3, "bby:650"));
  seq.add(Ani.to(this, 0.3, "bby:620", Ani.QUAD_OUT));
  seq.add(Ani.to(this, 0.2, "bby:650", Ani.QUAD_IN));
  seq.add(Ani.to(this, 0.4, "bby:600", Ani.QUAD_OUT));
  seq.add(Ani.to(this, 0.3, "bby:650", Ani.QUAD_IN));

  /*外界へ*/
  seq.add(Ani.to(this, 0.8, "bay:650"));
  seq.add(Ani.to(this, 0.4, "bax:900", Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "bay:650"));
  seq.beginStep();
  seq.add(Ani.to(this, 0.3, "bax:800", Ani.SINE_IN));
  seq.add(Ani.to(this, 0.3, "bay:500", Ani.SINE_OUT));
  seq.endStep();
  seq.beginStep();
  seq.add(Ani.to(this, 0.2, "bax:700", Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.2, "bay:650", Ani.SINE_IN));
  seq.endStep();
  seq.add(Ani.to(this, 0.3, "bay:650"));
  seq.add(Ani.to(this, 0.3, "bay:600", Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.3, "bay:650", Ani.SINE_IN));
  

  seq.add(Ani.to(this, 0.5, "bby:650"));
  seq.add(Ani.to(this, 0.4, "bbx:750", Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "bby:650"));
  seq.add(Ani.to(this, 0.4, "bbx:850", Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "bby:650"));
  seq.add(Ani.to(this, 0.3, "bby:630", Ani.QUAD_OUT));
  seq.add(Ani.to(this, 0.2, "bby:650", Ani.QUAD_IN));
  seq.add(Ani.to(this, 0.3, "bby:630", Ani.QUAD_OUT));
  seq.add(Ani.to(this, 0.2, "bby:650", Ani.QUAD_IN));
  seq.add(Ani.to(this, 0.8, "bby:650"));

  seq.beginStep();
  seq.add(Ani.to(this, 0.2, "bbx:800", Ani.SINE_IN));
  seq.add(Ani.to(this, 0.2, "bby:600", Ani.SINE_OUT));
  seq.endStep();
  seq.beginStep();
  seq.add(Ani.to(this, 0.15, "bbx:750", Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.15, "bby:650", Ani.SINE_IN));
  seq.endStep();
  seq.add(Ani.to(this, 0.3, "bby:650"));
  seq.beginStep();
  seq.add(Ani.to(this, 0.25, "bbx:650", Ani.SINE_IN));
  seq.add(Ani.to(this, 0.25, "bby:580", Ani.SINE_OUT));
  seq.endStep();
  seq.beginStep();
  seq.add(Ani.to(this, 0.2, "bbx:550", Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.2, "bby:650", Ani.SINE_IN));
  seq.endStep();
  seq.add(Ani.to(this, 0.5, "bby:650"));
  
  seq.beginStep();
  seq.add(Ani.to(this, 0.7, "bax:1400", Ani.SINE_IN));
  seq.add(Ani.to(this, 0.7, "bay:250", Ani.SINE_OUT, "onEnd:moveServo1"));
  seq.endStep();
  
  seq.add(Ani.to(this, 0.5, "bby:650"));

  seq.beginStep();
  seq.add(Ani.to(this, 0.6, "bbx:1400", Ani.SINE_IN));
  seq.add(Ani.to(this, 0.6, "bby:110", Ani.SINE_OUT, "onEnd:moveServo2"));
  seq.endStep();


  seq.endSequence();
}


int i, j;
float R=166, G=255, B=95;//background
float R2=166, G2=255, B2=95;//壁
float t=0;//ぷよボックスがフェードアウト
float bax=398, bbx=450;
float bby=650, bay=650;


/*ぷよ連鎖で使う*/
float y1=-25;
float y2=245, y23=200, y4=425, y5=515, y6=605;
float y71=605, y72=560;
float y781=560, y782=470, y783=515, y79=425, y712=380;
float y8=515;
float y891=470, y892=560, y8101=290, y8102=335, y8111=380, y8112=425, y812=245;
float y101=515, y102=560;
float y1011=470, y1121=380, y1122=425;
float ba_y=200, bb_y=335;
int r=0;//連鎖数のカウント
float s=0.4;//ぷよ落下時間

/*ぷよ逃げ出すで使う*/
/*バスケで使う*/
int k1=0;//行動のカウント
float f=0;//バスケの床が浮かび上がる



void draw() {
  /*ぷよ連鎖*/
  background(R, G, B);
  fill(R2, G2, B2);//壁
  stroke(R2, G2, B2);
  rect(0, 0, width, height*2/3);

  /*ぷよボックス*/
  strokeWeight(10);
  fill(255);
  stroke(255);
  rect(155-25*t, 123, 330, 550);

  noFill();
  strokeWeight(10);
  stroke(0);
  line(155-25*t, 120, 155-25*t, 680);
  line(155-25*t, 680, 485-25*t, 680);
  line(485-25*t, 120, 485-25*t, 680);

  chain_puyo();//ぷよが連鎖する仕組みの関数


  /*ぷよが逃げ出す*/
  escape_puyo();

  /*バスケ*/
  sports_puyo();
}

void functionA() {
  r=r+1;
}

void functionB() {
  k1=k1+1;
}


void mousePressed() {
  seq.start();
}



/*Arduino関連*/
boolean arduinoOn = true; //Arduinoを使用するときはtrueにする。

Serial serialPort;  // Arduinoにデータを送るシリアルポート
boolean firstContact = false;  //Arduinoからのはじめの送信を確認する
byte[] inByte = new byte[3]; // 受信データ用バッファ

int oval1; // サーボ1用変数
int oval2; // サーボ2用変数

//サーボの位置を初期化
void initServo() {
  oval1 = oval2 = 20;
  sendToServo(1, oval1); //ゲートを閉じる
  sendToServo(2, oval2); //ゲートを閉じる
}

// シリアルポートにデータが受信されると呼び出されるメソッド
void serialEvent(Serial port) {
  inByte = port.readBytes();

  if (firstContact == false) {
    if (inByte[0] == 'C') {
      println("connect!");
      port.clear();
      firstContact = true;
      initServo();
    }
  }
}

// シリアルポートにサーボの値を送るメソッド
void sendToServo(int id, int value) {
  if (!firstContact) return;
  int v = value;
  if (v < 15) v = 15; // サーボの最小値。個体差による。
  if (v > 125) v = 125; // サーボの最大値。個体差による。
  serialPort.write((byte)'S');
  serialPort.write((byte)id);
  serialPort.write((byte)v);
}

//Step2終了時に呼び出される。
//サーボ1を動かす
void moveServo1() {
  if (arduinoOn) {
    oval1 = 120;
    sendToServo(1, oval1);
  }
}

//Step3終了時に呼び出される。
//サーボ2を動かす
void moveServo2() {
  if (arduinoOn) {
    oval2 = 120;
    sendToServo(2, oval2);
  }
}
