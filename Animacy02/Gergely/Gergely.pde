// Gergelyの飛び跳ねアニメーション

int t0; // 開始時刻
int y0 = 0, yd = 200; // Y座標
int er = 40; // 半径
int nw; // 経過時間

float x, y, y1;
int i;
char label[] = {'A', 'B', 'C'};

void setup() {
  size(600, 600);
  background(255);
  textSize(32);
  rectMode(CENTER); 
  t0 = millis();
}

void draw() {
  background(255);
  nw = millis() - t0; // 経過時間
  
  // 横線
  stroke(0);
  for (i=1; i<3; ++i) {
    line(0, y0+i*yd, 600, y0+i*yd);
  }
  
  // ラベル
  noStroke();
  fill(0, 0, 0);
  for (i=0; i<3; ++i) {
    text(label[i], 600-25, y0+i*yd+100);
  }

  // X座標（共通）
  x = nw/1000.0*600/3;

  // #A
  y1 = 0;
  y = y1 + y0/2+1*yd - er/2;
  fill(255, 0, 0);
  ellipse(x, y, er, er);

  // #B
  y1 = -cos((x-300)/600*3*PI)*yd*0.75 * ((x < 200 || x > 400)?0:1);
  y = y1 + y0/2+2*yd - er/2;
  fill(255, 0, 0);
  ellipse(x, y, er, er);

  // #C
  y = y1 + y0/2+3*yd - er/2;
  fill(255, 0, 0);
  ellipse(x, y, er, er);
  // 板  
  fill(128, 128, 128);
  rect(300, y0/2+3*yd-60, 20, 120);


  // saveFrame("frames/######.tga");
  if (nw > 3000) {
    exit();
  }
}
