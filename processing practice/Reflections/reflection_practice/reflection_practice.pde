void setup()
{
  size(800,800);
  background(255);
  translate(400,400);
  
  stroke(128);
  drawPetal();
  rotateQuarter();
  drawPetal();
  rotateQuarter();
  drawPetal();
  rotateQuarter();
  drawPetal();
  rotateQuarter();
  drawPetal();
  rotateQuarter();
  drawPetal();
  rotateQuarter();
  drawPetal();
  rotateQuarter();
  drawPetal();
 
}

void rotateQuarter() {
   rotate(radians(45));
}

void drawPetal() {
  color petalColor;
  float alpha = 255;
  noStroke();
  petalColor = color(random(255),random(255),random(255), alpha);
  fill(petalColor);
  rect(20, 20, 50, 50);  
  pushMatrix();
  
  for (int i = 0; i < 4; i++) {
    translate(20,20);
    scale(1.2);
    fill(petalColor, alpha/2);
    rect(20,20,50, 50);

  }
  popMatrix();
}