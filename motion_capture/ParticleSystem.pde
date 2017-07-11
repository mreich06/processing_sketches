/**
 * Created by Maya Reich on 7/10/17
 */

class Particle {
  float x,y,z, xVelocity, yVelocity, zVelocity, size, gravity, weight, particleSize;
  color ballColor;

  Particle(float x, float y, float z) {

    this.x = x; 
    this.y = y;
    this.z = z;
 
    xVelocity = random(-0.01, .01); 
    yVelocity = random(-.01, .01);
    zVelocity = random(-.01, .01);
   
    weight = 0.99; 
    

    ballColor = 255;
    
    particleSize = random(0.05, 0.1); 
    size = random(0.9, 0.95); 
    
    gravity = -0.00004; 

  }

//colors change every 100 frames by adding to rgb until 255, then subtract from 255
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