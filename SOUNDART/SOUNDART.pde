import processing.sound.*;
SoundFile file;
Amplitude rms;

float scale=2;

float smooth_factor=0.30;

float sum;

void setup() {
  size(800,500);
  background(0);
  smooth();
  file = new SoundFile(this, "AUT? MM.mp3");
  file.play();
  file.loop();
  file.amp(0.6);
  
  rms = new Amplitude(this);
    rms.input(file);
}

void draw() {
    background(38,38,34);
    noStroke();
    fill(207,68,65);
    
// smoothing factor
sum += (rms.analyze() - sum) * smooth_factor;  

    float rms_scaled=sum*(height/2)*scale;
    
    ellipse(655, 250, rms_scaled, rms_scaled);
    ellipse(640, 250, rms_scaled, rms_scaled);
    ellipse(625, 250, rms_scaled, rms_scaled);
    ellipse(610, 250, rms_scaled, rms_scaled);
   
    ellipse(595, 250, rms_scaled, rms_scaled);
    ellipse(580, 250, rms_scaled, rms_scaled);
    ellipse(565, 250, rms_scaled, rms_scaled);
    ellipse(550, 250, rms_scaled, rms_scaled);
    ellipse(535, 250, rms_scaled, rms_scaled);
    ellipse(520, 250, rms_scaled, rms_scaled);
    ellipse(505, 250, rms_scaled, rms_scaled);
    ellipse(490, 250, rms_scaled, rms_scaled);
    ellipse(475, 250, rms_scaled, rms_scaled);
    ellipse(460, 250, rms_scaled, rms_scaled);
    ellipse(445, 250, rms_scaled, rms_scaled);
    ellipse(430, 250, rms_scaled, rms_scaled);
    ellipse(415, 250, rms_scaled, rms_scaled);
    ellipse(400, 250, rms_scaled, rms_scaled);
    
    ellipse(385, 250, rms_scaled, rms_scaled);
    ellipse(370, 250, rms_scaled, rms_scaled);
    ellipse(355, 250, rms_scaled, rms_scaled);
    ellipse(340, 250, rms_scaled, rms_scaled);
    ellipse(325, 250, rms_scaled, rms_scaled);
    ellipse(310, 250, rms_scaled, rms_scaled);
    ellipse(295, 250, rms_scaled, rms_scaled);
    ellipse(280, 250, rms_scaled, rms_scaled);
    ellipse(265, 250, rms_scaled, rms_scaled);
    ellipse(250, 250, rms_scaled, rms_scaled);
    ellipse(235, 250, rms_scaled, rms_scaled);
    ellipse(220, 250, rms_scaled, rms_scaled);
    ellipse(205, 250, rms_scaled, rms_scaled);
    ellipse(190, 250, rms_scaled, rms_scaled);
    
    ellipse(175, 250, rms_scaled, rms_scaled);
    ellipse(160, 250, rms_scaled, rms_scaled);
    ellipse(145, 250, rms_scaled, rms_scaled);
    
    
     
  fill(237, 239, 228, 220);
  ellipseMode(CENTER);
 
 //x axis
  float x = random(0, 801);
  int xx = int(x);
  //y axis
  float y = random(0, 501);
  int yy= int(y);
  ellipse(xx, yy, rms_scaled, rms_scaled);
  
 
}