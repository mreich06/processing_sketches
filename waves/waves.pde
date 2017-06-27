float x = 10;
float y = 50;
int speed = 1;
float cutoff = 5;
float angle = 0.0;
float drawCount = 0.0;
int blue = 250;
int green = 150;
 
void setup(){
  size(1000,600);
  background(0);
  smooth();
  noStroke(); 

}

void draw() {  
  translate(x, (height/6)+y); 
  rotate(angle); 
  
  stroke(0, green, blue, 40);
  triangle(-50, -50, -50, -50, 30, 30); 
    
  stroke(0, green, blue, 30);
  triangle(-100, -100, -100, -100, 100, 25); 
    
  
  x = x + speed;

 //restart drawing 
 if (x > width + cutoff) {
   x = - cutoff - 20; //adjust next line to be slightly to left
   y += 50; //move next drawing down a little

 }
 
 drawCount+= 0.1;
 angle -= 0.05;
 
 if (drawCount > 1000) {
   noLoop();
 }
   
}