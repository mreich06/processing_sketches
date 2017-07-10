//Maya Reich 2017
//Processing sketch
//3D Particle system

ArrayList<Particle> particleGroup = new ArrayList<Particle>();
int maxParticles = 10; 


void setup() { 
  size(700, 700, P3D); 
  smooth(); 
  noStroke(); 
}

void draw() { 
  background(0); 

  particleGroup.add(new Particle());
  particleGroup.add(new Particle());
  particleGroup.add(new Particle());

  
  //update all current particles
  for (int i=0; i<particleGroup.size(); i++) { 
    particleGroup.get(i).update();
  }
  // if we have max particles, remove oldest
  if (particleGroup.size()>= maxParticles) {
    particleGroup.remove(particleGroup.get(0));
  }
}

class Particle {
  public float x, y, z, xVelocity, yVelocity, zVelocity, size, gravity, weight, particleSize;
  public color ballColor;

  Particle() {

    x = width/2; 
    y = height/2;
    z = width/2;
 
    xVelocity = random(-10, 10); 
    yVelocity = random(-10, 10);
    zVelocity = random(-10, 10);
   
    weight = 0.99; 
    

    ballColor = 255;
    
    particleSize = random(6,12); 
    size = random(0.6, 0.95); 
    
    gravity = 0.4; 

  }

void update() { 
        
    particleSize *= size; 
  
    xVelocity*=weight; 
    yVelocity*=weight; 
    zVelocity*=weight; 
    yVelocity+=gravity;
    
    // update position
    x+=xVelocity;
    y+=yVelocity;  
    z+=zVelocity; 
   
   fill(ballColor, 255); 
   pushMatrix();
   translate(x, y, z);
   sphere(particleSize);
   popMatrix();

  }
}