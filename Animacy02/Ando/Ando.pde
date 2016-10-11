// Andoの気持ち悪いヘビのアニメーション

int t0; // 開始時間
int yd = 200; // Y座標
int sw = 15; // 線の太さ
int nw; // 経過時間

float x, y;
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
  strokeWeight(1); 
  stroke(0);
  for (i=1; i<3; ++i) {
    line(0, i*yd, 600, i*yd);
  }
  
  //　ラベル
  noStroke();
  fill(0, 0, 0);
  for (i=0; i<3; ++i) {
    text(label[i], 600-25, i*yd+100);
  }

  // ヘビ用描画パレメータ
  noFill();  
  strokeWeight(sw); 
  strokeCap(ROUND);
  stroke(0, 0, 255);

  // x座標（共通）
  x = nw/1000.0*600/3;

  // #A （点）
  y = 0.5*yd + sin(x/600*8*PI)*yd/8;
  beginShape();
  vertex(x, y);
  endShape();
  
  // #B （軌跡）
  beginShape();
  for (float x000 = 0; x000 <= x; x000+=5) {
    y = 1.5*yd + sin(x000/600*8*PI)*yd/8;
    vertex(x000, y);
  }
  endShape();

  // #C （ヘビ）
  float x00 = x > 150? x-150 : 0;
  beginShape();
  for (float x000 = x00; x000 <= x; x000+=5) {
    y = 2.5*yd + sin(x000/600*8*PI)*yd/8;
    vertex(x000, y);
  }
  endShape();

  // saveFrame("frames/######.tga");
  if (nw > 3000) {
    exit();
  }
}
