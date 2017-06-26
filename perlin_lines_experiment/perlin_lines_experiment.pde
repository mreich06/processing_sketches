size(500,1000);
background(255);
strokeWeight(5);
smooth();
stroke(0, 30);
line(20,50,480,50);
stroke(20, 50, 70);
int step = 20;
float lastx = -999;
float lasty = -999;
float ynoise = random(10);
float xnoise = random(10);
float y;
for (int x=20; x<=480; x+=step) {
  y = 10 + noise(xnoise,ynoise) * 80;
  
  if (lastx > -999) { //doesn't check first time
  for (int i = 0; i < 10; i++) {
    
    line(x, y+i*10, lastx, lasty+i*10);
  }
  }
  lastx = x;
  lasty = y;
  ynoise += 0.1;
}