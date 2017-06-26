float time = 0;
float dt = 0.01;
void setup(){
  size(800,600);
  background(255);
  colorMode(HSB);
}

void mousePressed() {
  beginShape();
  for(float x=0; x<=width; x+=1){
    float y = mouseY;
    float drift = (noise(x/100,y/300,time)-0.5)*300;
    vertex(x,y+drift);
    }
  
  endShape();
  
}

void draw(){
  time += dt;
  stroke(165,255,255,20);
  noFill();
  

}