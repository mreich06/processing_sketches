

void setup() {
  size(500, 500);
  background(255);
  ellipseMode(CENTER);
  noLoop();
}
int centerX = 0;
int centerY = 0;
void draw() {
  translate(250, 350);
  stroke(0, 200, 200, 100);

  //turns a total of 90 degrees, 10 degrees 9 times
  for (int i = 0; i < 36; i++) {
    int wave = i*10 + 180; //number degrees to turn for every wave in shell
    for (int j = 0; j <= 10; j++) {
      if (j < 6) {
        stroke(0, 200, 200, j*10);
      float x2 = endX(centerX, 100, wave+j);
      float y2 = endY(centerX, 100, wave+j);
      line(centerX, centerY+100, x2, y2);
      float midX = (centerX + x2)/2;
      float midY = (centerY+100 + y2)/2;
      ellipse(midX, midY, 2, 2);
      float midX2 = (centerX + midX)/2;
      float midY2 = (centerY+100 + midY)/2;
      ellipse(midX2, midY2, 2, 2);
      float midX3 = (midX + x2)/2;
      float midY3 = (midY + y2)/2;
      stroke(200,200,200, j*10);
      ellipse(midX3, midY3, 2, 2);
        
      } else {
        stroke(0, 200, 200, 50);
      
      //line(centerX, centerY+100, endX(centerX, 100, wave+j), endY(centerX, 100, wave+j));
      float x2 = endX(centerX, 100, wave+j);
      float y2 = endY(centerX, 100, wave+j);
      line(centerX, centerY+100, x2, y2);
      float midX = (centerX + x2)/2;
      float midY = (centerY+100 + y2)/2;
      ellipse(midX, midY, 2, 2);
      float midX2 = (centerX + midX)/2;
      float midY2 = (centerY+100 + midY)/2;
      ellipse(midX2, midY2, 2, 2);
      float midX3 = (midX + x2)/2;
      float midY3 = (midY + y2)/2;
      stroke(255);
      ellipse(midX3, midY3, 2, 2);
      }
    }
  }
}

float endX(float startX, float radius, float degree) {
  return startX + cos(radians(degree))*radius;
}

float endY(float startY, float radius, float degree) {
  return startY + sin(radians(degree))*radius;
}