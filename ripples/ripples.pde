//once circle gets to certain radius, stop drawing it and remove it from list

ripple[] ripples; //array to keep location of multiple ripples
int index = 0;

void setup() {
  size(1000,1000);
  smooth();
  
  ripples = new ripple[40];
  for (int i = 0; i < 40; i++) { //initialize 100 ripple objects
    ripples[i] = new ripple();
  }
}

void draw() {
  fill(0, 200, 200, 20);
  rect(0, 0, width, height); //for fade effect
  
  for (int i = 0; i < 40; i++) {
    ripples[i].fade();
    ripples[i].show();
  }
}

//when clicked, save x and y location for that ripple object inside the list 
void mouseClicked() {
  ripples[index].location(mouseX, mouseY);
  index++; //next ripple will be saved in next index of list
}


class ripple {
  float radius, alpha, x, y;
  boolean clicked = false; //mouse not yet clicked
  
  void location(float xLoc, float yLoc) {
    radius = 0;
    x = xLoc;
    y = yLoc;
    clicked = true;
  }
  
  void fade() {
    for (float g = 1.0; g>0.1; g--) {
    radius += g;
    alpha += g*10;
    }
    
    //when ripple is too big, make it disappear
    if (radius > 200) {
      alpha 
    }
  }
  
  void show() {
    if (clicked == true) {
    rect(0,0, width, height);
    
    strokeWeight(3);
    ellipse(x, y, radius*2, radius*2);
    strokeWeight(2);
    ellipse(x, y, (radius*2)+20, (radius*2)+20);
    strokeWeight(1);
    ellipse(x, y, (radius*2)+30, (radius*2)+30);
    
  }
}
}