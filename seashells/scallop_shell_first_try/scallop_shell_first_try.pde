

void setup(){
  size(500,500);
  background(255);
  ellipseMode(CENTER);
  noLoop();
  
}
int centerX = 250;
int centerY = 250;
void draw(){
  stroke(0,200,200,100);
  
  for (int i = 0; i < 36; i++) {
    int wave = i*10 + 180;
    for (int j = 0; j <= 10; j++) {
      if (j < 6) {
        stroke(0, 200,200,j*10);
        
        //endX(center, radius, degree)
        float x2 = endX(centerX, 100, wave+j);
        float y2 = endY(centerX, 100, wave+j);
        line(centerX, centerY+100, x2, y2);
       // float midX = (centerX + x2)/2;
        //float midY = (centerY + y2)/2;
        //ellipse(midX, midY, 5, 5);
        //float midX2 = (centerX + x2)/4;
        //float midY2 = (centerY + x2)/4;
        
      }
      else{
        stroke(0,200,200,50);
        line(centerX, centerY+100, endX(centerX, 100, wave+j), endY(centerX, 100, wave+j));
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