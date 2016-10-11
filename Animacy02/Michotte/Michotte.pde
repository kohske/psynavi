// Michotteのcausalityアニメーション

int t0; // 開始時刻
int y0 = 50, yd = 100; // Y座標 
int er = 40; // 半径
int x0 = 200; // ぶつかる位置
int nw; // 経過時間

float x;
int i;
char label[] = {'A', 'B', 'C', 'D', 'E', 'F'};

void setup() {
  size(600, 600);
  background(255);
  textSize(32);
  t0 = millis();
}

void draw() {
  background(255);
  nw = millis() - t0; // 経過時間
  
  // 横線
  stroke(0);
  for (i=1; i<6; ++i) {
    line(0, y0+(i-0.5)*yd, 600, y0+(i-0.5)*yd);
  }
  
  // ラベル
  noStroke();
  fill(0, 0, 0);
  for (i=0; i<6; ++i) {
    text(label[i], 600-25, y0+i*yd+5);
  }

  // 衝突前
  if (nw < 1000) {
    for (i=0; i<6; ++i) {
      x = nw/1000.0*x0;
      // 赤玉
      fill(255, 0, 0);
      ellipse(x, y0+i*yd, er, er);
      
      // 緑玉
      fill(0, 255, 0);
      if (4 == i) {
        ellipse(x0+er+x0/4, y0+i*yd, er, er);
      } else if (5 == i) {
        fill(0, 0, 255);
        ellipse(x0+er, y0+i*yd, er, er);
        fill(0, 255, 0);
        ellipse(x0+er+er+x0, y0+i*yd, er, er);
      } else {
        ellipse(x0+er, y0+i*yd, er, er);
      }
    }
  }
  
  // 衝突後
  if (nw > 1000) {
    
    // #A
    x = nw/1000.0*x0;
    fill(255, 0, 0);
    ellipse(x0, y0+0*yd, er, er);
    fill(0, 255, 0);
    ellipse(x+er, y0+0*yd, er, er);

    // #B
    x = nw/1000.0*x0;
    fill(255, 0, 0);
    ellipse(x, y0+1*yd, er, er);
    fill(0, 255, 0);
    ellipse(x+er, y0+1*yd, er, er);

    // #C
    x = x0;
    if (nw >= 1500) {
      x = (nw-500)/1000.0*x0;
    }
    fill(255, 0, 0);
    ellipse(x0, y0+2*yd, er, er);
    fill(0, 255, 0);
    ellipse(x+er, y0+2*yd, er, er);

    // #D
    x = x0+(nw-1000)/1000.0*2.0*x0;
    fill(255, 0, 0);
    ellipse(x0, y0+3*yd, er, er);
    fill(0, 255, 0);
    ellipse(x+er, y0+3*yd, er, er);

    // #E
    x = nw/1000.0*x0;
    fill(255, 0, 0);
    ellipse(x0, y0+4*yd, er, er);
    fill(0, 255, 0);
    ellipse(x+er+x0/4, y0+4*yd, er, er);

    // #F
    x = nw/1000.0*x0;
    fill(255, 0, 0);
    ellipse(x0, y0+5*yd, er, er);
    if (nw < 2000) {
      fill(0, 0, 255);
      ellipse(x+er, y0+5*yd, er, er);
      fill(0, 255, 0);
      ellipse(x0+er+er+x0, y0+5*yd, er, er);
    } else {
      fill(0, 0, 255);
      ellipse(x0+er+x0, y0+5*yd, er, er);
      fill(0, 255, 0);
      ellipse(x+er+er, y0+5*yd, er, er);
    }
  }
  
  // saveFrame("frames/######.tga");
  if (nw > 3500) {
    exit();
  }
}
