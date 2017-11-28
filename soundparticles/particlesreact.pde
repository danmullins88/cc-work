import processing.sound.*;
SoundFile file;
Amplitude rms;

float scale=0.20;
float smooth_factor=0.07;
float sum;

int maxNum = 5000;

float[] xoff = new float[maxNum];
float[] yoff = new float[maxNum];

void setup() {
  size(1000,1000);
  smooth();
  file = new SoundFile(this, "AUT? MM.mp3");
  file.play();
  file.loop();
  file.amp(0.6);
  
  rms = new Amplitude(this);
    rms.input(file);
    
  for(int i=0; i<maxNum; i++){
    xoff[i] = random(1000);
    yoff[i] = random(1000);

  }
}

void draw() {
  background(0);
  noStroke();
  fill(0,7);
  //rect(0,0,width,height);
  // i++ is the same as i=i+1
  
  sum += (rms.analyze() - sum) * smooth_factor;  

    float rms_scaled=sum*(height/2)*scale;
  
  for(int i = 0; i < maxNum; i++){
    //println(i);
    float x = map(noise(xoff[i]),0,1,-200,width+200);
    float y = map(noise(yoff[i]),0,1,-200,height+200);

    ellipse(x, y, rms_scaled, rms_scaled);
    fill(255);
    xoff[i] += 0.001;
    yoff[i] += 0.001;
  }
}