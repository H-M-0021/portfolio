import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer player; //clear play

void setup() {
  size(500, 600);
  background(255); //white
  noStroke();

  minim = new Minim(this); 
  player = minim.loadFile("03.mp3");

  PFont myFont = loadFont("ErasITC-Light-48.vlw"); //font
  textFont(myFont);



  for (i=0; i<rand.length; i++) { //color random
    for (j=0; j<rand[i].length; j++) {
      rand[i][j]=int(random(1, 5));  //color 1~4
    }
  }

  for (i=0; i<durable.length; i++) { //durable value
    for (j=0; j<durable[i].length; j++) {
      durable[i][j] = 1;  //durable=1
    }
  }
}


float ball_x=10; //ball1 x
float ball_x2=30; //ball2 x
float ball_x3=50; //ball3 x
float ball_x4=60; //ball4 x

float ball_y=250; //ball1 y
float ball_y2=300; //ball2 y
float ball_y3=400; //ball3 y
float ball_y4=450; //ball4 y

float ball_w=8;  //ball width hight

float dx=2, dy=3;  //ball1 speed
float dx2=3, dy2=2; //ball2 spead
float dx3=2, dy3=2; //ball3 speed
float dx4=3, dy4=3; //ball4 speed

float bar_w=100;  //bar width

float block_dx=1; //obstruction block speed
float block_x=0; //obstruction block x
float block_w=100; //obstruction block width

int chb=0, chb2=0; //checkhit
int i, j;//配列に使用
int k=40; //おじゃまブロック

int game=0; //display change
int score=0; //score
int hit=0; //hit count

int [][]rand = new int[6][16];  //color random
int [][]durable = new int[6][16];  //durable value


void draw() {
  if (game ==0) {
    game_start(); //start
  } else if (game ==1) {
    game_play(); //game play now
  } else if (game ==2) {
    game_clear(); //game clear
  }


  if (hit==96) { //clear display change
    game=2;
  }


  for (i=0; i<rand.length; i++) { //block vertical
    for (j=0; j<rand[i].length; j++) {  //block side

      if (rand[i][j] == 1) {
        fill(255, 99, 71);  //red
      } else if (rand[i][j] == 2) {
        fill(34, 139, 34);  //green
      } else if (rand[i][j] == 3) {
        fill(65, 105, 225);  //blue
      } else if (rand[i][j] == 4) {
        fill(255, 225, 0);  //yellow
      }

      show_block(j, i); //show block
    }
  }
}

void mousePressed() { //click
  if (game==0) { //start display
    game=1; //play display
  }
}
