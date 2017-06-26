float theta = 0;
float d = 0;
float prevX = 1;
float prevY = 1;
float t = 0;
float dt = .01;
void setup() {
  size(1080,720);
  background(0);
}

void draw() {
    if (mousePressed) {
      t+=dt;
      fill(0);
      int Tint = int(t);
      stroke(abs(255*cos(t)), abs(255*cos(4*t)), abs(255*cos(t/2)));
      d = dist(540,360,mouseX,mouseY);
      if (mouseY>360){
        theta = acos((mouseX-width/2)/d);
      } else {
        theta = -acos((mouseX-width/2)/d);
      }
      
      translate(width/2, height/2);
      float posX = d*cos(theta);
      float posY = d*sin(theta);
      triangle(posX,posY,0,0,prevX,prevY);
      rotate(2*PI/6);
      posX = d*cos(theta);
      posY = d*sin(theta);
      triangle(posX,posY,0,0,prevX,prevY);
      rotate(2*PI/6);
      posX = d*cos(theta);
      posY = d*sin(theta);
      triangle(posX,posY,0,0,prevX,prevY);
      rotate(2*PI/6);
      posX = d*cos(theta);
      posY = d*sin(theta);
      triangle(posX,posY,0,0,prevX,prevY);
      rotate(2*PI/6);
      posX = d*cos(theta);
      posY = d*sin(theta);
      triangle(posX,posY,0,0,prevX,prevY);
      rotate(2*PI/6);
      posX = d*cos(theta);
      posY = d*sin(theta);
      triangle(posX,posY,0,0,prevX,prevY);
      
      prevX = posX;
      prevY = posY;

    }
  }