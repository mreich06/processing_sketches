int _num = 100;
Circle[] circles = {};

void setup() {
  size(1500,900);
  background(255);
  smooth();
  strokeWeight(0.5);
  fill(150, 50);
  draw_hundred();
}

//circle class
class Circle {
  float x, y, radius, xdirection, ydirection;
  color circColor;
  
  Circle() { //circle object
    x = random(50, width-50); //random height and width
    y = random(50, height-50);
    radius = random(120);
    circColor = color(random(255), random(255), random(255));
    xdirection = random(10) - 5.5;
    ydirection = random(10) - 5.5;
  }
  
  void drawCircle() {
    //noStroke();
    fill(circColor);
    stroke(0, 0);
    ellipse(x, y, radius*2, radius*2);
    
    //ellipse(x, y, 10, 10);
  }
  
  
  void animate() {
    float isX, isY, xDiff, yDiff, isX1, isX2, isY1, isY2;
    
    x += xdirection;
    y += ydirection;
    
    if ((x < radius) || (x > width - radius)) xdirection = -xdirection;
    if ((y < radius) || (y > height - radius)) ydirection = -ydirection;
    
    //detect interactions between circles
    boolean collision = false;
    
    for (int i = 0; i < circles.length; i++) { //check all circles for collisions
    Circle other = circles[i];
    xDiff = other.x - this.x;
    yDiff = other.y - this.y;
    
     if (other != this) { //check all other circles
       float dist= dist(x, y, other.x, other.y); //get distance between radii
       float touchDist = this.radius + other.radius - dist;
       float k = (pow(dist,2) + pow(this.radius,2) - pow(other.radius,2))/(2*dist);
       float IH = sqrt(pow(radius, 2) - pow(k, 2));
       
       if (IH == 0.0) { //just intersected
         isX = this.x + (xDiff*k)/dist;
         isY = this.y + (yDiff*k)/dist;
         collision = true;
         //ellipse(isX, isY, 50, 50);
          //tate(frameCount / -100.0);
          Star mystar = new Star(isX, isY);
       }
       else if (IH > 0) { //intersection creates two points
         isX1 = this.x + (xDiff*k + yDiff*IH)/dist;
         isY1 = this.y + (yDiff*k - xDiff*IH)/dist; 
         isX2 = this.x + (xDiff*k - yDiff*IH)/dist;
         isY2 = this.y + (yDiff*k + xDiff*IH)/dist;   
         collision = true;
         //ellipse(isX1, isY1, 20, 20);
         //ellipse(isX2, isY2, 20, 20);
       }  
       
       if (collision = true) {
         //do some interaction stuff here        
       }
     }     
    }    
    drawCircle();
  
  }
}
    

void draw() {
  background(255);
  for (int i=0; i< circles.length; i++) { //iterate through each circle and update location
  //to move all circles
    Circle current = circles[i];
    
  }
}

void draw_hundred() {
  for (int i=0; i<_num; i++) { //draw 10 circles
    Circle mycircle = new Circle();
    mycircle.drawCircle();
    circles = (Circle[])append(circles, mycircle); //append circle just made to list
  }
}

class Star {
  float x, y, radius1, radius2;
  int points;
  color starColor;
  
  Star(float x, float y) {
    radius1 = 10;
    radius2 = 20;
    points = 5;
    float angle = TWO_PI / points;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
      vertex(sx, sy);
      sx = x + cos(a+halfAngle) * radius1;
      sy = y + sin(a+halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
    
  }
}