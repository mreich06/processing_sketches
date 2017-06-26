int _num = 10;
Circle[] circles = {};
ArrayList<ParticleSystem> systems;

void setup() {
  size(1500,900);
  background(0);
  smooth();
  strokeWeight(0.5);
  fill(150, 50);
  draw_hundred();
  systems = new ArrayList<ParticleSystem>();  
  
}


//circle class
class Circle {
  float x, y, radius, xdirection, ydirection;
  color circColor;
  int current = 0;
  float[] xtrail = new float[30];
  float[] ytrail = new float[30];

  Circle() { //circle object
    x = random(50, width-50); //random height and width
    y = random(50, height-50);
    //radius = random(120);
    radius = 5 + 5 * sin( frameCount * 0.05f );
    circColor = color(random(255), random(255), random(255));
    xdirection = random(10) - 5.5;
    ydirection = random(10) - 5.5;
    
    for (int i = 0; i < xtrail.length; i++) {
    xtrail[i] = 0;
    ytrail[i] = 0;
  }
  }
  
  void drawCircle(color c) {
    //noStroke();
    fill(c);
    stroke(0, 0);
    ellipse(x, y, radius*2, radius*2);

  }
  
  void redrawCircle() {
    color newCircColor = color(random(255), random(255), random(255));
    fill(newCircColor);
    stroke(0, 0);
    ellipse(x, y, radius*2, radius*2);
  }
  
  
  void animate() {
    float dist, k, IH, isX, isY, xDiff, yDiff, isX1, isX2, isY1, isY2;
    
    x += xdirection;
    y += ydirection;
    
    if ((x < radius) || (x > width - radius)) xdirection = -xdirection;
    if ((y < radius) || (y > height - radius)) ydirection = -ydirection;
    
    for(int j = 0; j<xtrail.length-1; j++) {
      // and shift all the values down one item
      //xtrail[j] = xtrail[j+1]; //so 0th element is 1st places value
      //ytrail[j] = ytrail[j+1]; 
      
      // set the fill colour to be darker the 
      // lower its index in the array
      fill(circColor, (j*2));
      int index = (j + current) % xtrail.length;
      // and draw the circle at the position
      ellipse(xtrail[index], ytrail[index], radius*2, radius*2); 
      
      
    
  }
  
  xtrail[current] = this.x;
  ytrail[current] = this.y;
  current = (current + 1) % xtrail.length;
  
    
    //detect interactions between circles
    boolean collision = false;
    
    for (int i = 0; i < circles.length; i++) { //check all circles for collisions
    Circle other = circles[i];
    xDiff = other.x - this.x;
    yDiff = other.y - this.y;
    
     if (other != this) { //check all other circles
       dist= dist(x, y, other.x, other.y); //get distance between radii
       float touchDist = this.radius + other.radius - dist;
       k = (pow(dist,2) + pow(this.radius,2) - pow(other.radius,2))/(2*dist);
       IH = sqrt(pow(radius, 2) - pow(k, 2));
       
       if (IH == 0.0) { //just intersected
         isX = this.x + (xDiff*k)/dist;
         isY = this.y + (yDiff*k)/dist;
         collision = true;
        
         //ellipse(isX, isY, 50, 50);
          
          //tate(frameCount / -100.0);

       }
       else if (IH > 0) { //intersection creates two points
         isX1 = this.x + (xDiff*k + yDiff*IH)/dist;
         isY1 = this.y + (yDiff*k - xDiff*IH)/dist; 
         isX2 = this.x + (xDiff*k - yDiff*IH)/dist;
         isY2 = this.y + (yDiff*k + xDiff*IH)/dist;   
         collision = true;
         //ellipse(isX1, isY1, 20, 20);
        //ellipse(isX2, isY2, 20, 20);
        systems.add(new ParticleSystem(1, new PVector(isX1, isY1)));
       }
     }     
     }
     drawCircle(collision? color(random(255), random(255), random(255)) : circColor);
    }
}



// An ArrayList is used to manage the list of Particles

class ParticleSystem {

  ArrayList<Particle> particles;    // An arraylist for all the particles
  PVector origin;                   // An origin point for where particles are birthed

  ParticleSystem(int num, PVector v) {
    particles = new ArrayList<Particle>();   // Initialize the arraylist
    origin = v.copy();                        // Store the origin point
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin));    // Add "num" amount of particles to the arraylist
    }
  }


  void run() {
    // Cycle through the ArrayList backwards, because we are deleting while iterating
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  void addParticle() {
    Particle p;
    // Add either a Particle or CrazyParticle to the system
    if (int(random(0, 2)) == 0) {
      p = new Particle(origin);
    } 
    else {
      p = new Particle(origin);
    }
    particles.add(p);
  }

  void addParticle(Particle p) {
    particles.add(p);
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    return particles.isEmpty();
  }
}





// A simple Particle class

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = l.copy();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    stroke(255, lifespan);
    fill(color(random(255), random(255), random(255)));
    ellipse(position.x, position.y, 8, 8);
  }

  // Is the particle still useful?
  boolean isDead() {
    return (lifespan < 0.0);
  }
}
void mousePressed() {

}


void draw() {
  background(0);
   noStroke();
   for (ParticleSystem ps : systems) {
    ps.run();
    ps.addParticle();
   }
   if (systems.isEmpty()) {
    fill(255);
    
  }

  //fill( 0xee, 0xee, 0xff, 50);
  //rect(0, 0, width, height);
  for (int i=0; i< circles.length; i++) { //iterate through each circle and update location to move all circles
    Circle current = circles[i];
    current.radius = 10 + 5 * sin( frameCount * 0.05f ); //make circles get smaller and larger
    
    
    current.animate();
    //for each circle, draw a trail behind it
    
  
    
  }
}

void draw_hundred() {
  for (int i=0; i<_num; i++) { //draw 10 circles
    Circle mycircle = new Circle();
    //mycircle.drawCircle();
    circles = (Circle[])append(circles, mycircle); //append circle just made to list
  }
}