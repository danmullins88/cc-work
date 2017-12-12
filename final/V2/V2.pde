import ddf.minim.analysis.*;
import ddf.minim.*;
import processing.pdf.*;
import java.util.Calendar;

Minim       minim;
AudioPlayer song;
FFT         fft;

Play play;
Rewind rewind;
Forward ffwd;

WaveformRenderer waveform;
boolean          listening;

int formResolution;
int stepSize;
int bands;

float distortionFactor;
float initRadius;
float centerX, centerY;
float scale;
float smooth_factor;
float[] x;
float[] y;
float[] sum;

class WaveformRenderer implements AudioListener
{
  private float[] left;
  private float[] right;
  
  WaveformRenderer()
  {
    left = null; 
    right = null;
  }
  
  public synchronized void samples(float[] samp)
  {
    left = samp;
  }
  
  public synchronized void samples(float[] sampL, float[] sampR)
  {
    left = sampL;
    right = sampR;
  }
  
  synchronized void draw()
  {
    // stereo signal if right or left are not null
    if ( left != null && right != null )
    {
      noFill();
      stroke(237, 239, 228);
      beginShape();
      for ( int i = 0; i < left.length; i++ )
      {
        vertex(i, height/4 + left[i]*50);
      }
      endShape();
      
      beginShape();
      for ( int i = 0; i < right.length; i++ )
      {
        vertex(i, 3*(height/4) + right[i]*50);
      }
      endShape();
    }
  
  }
}

void setup()
{
  size(1000, 800);
  smooth();
  strokeWeight(0.05);
  stroke(207,68,65);
  frameRate(30);
  background(199,97,106);
  noFill();
  
  play = new Play(width/2 - 50, 130, 20, 10);
  rewind = new Rewind(width/2, 130, 20, 10);
  ffwd = new Forward(width/2 + 50, 130, 20, 10);

  initSound();
  initDefaultData();
  
  waveform = new WaveformRenderer();
}

void initSound()
{
  minim = new Minim(this);
  song = minim.loadFile("CC FINAL AUDIO.mp3", 1024);
  song.play();

  fft = new FFT( song.bufferSize(), song.sampleRate() );
  bands = (fft.specSize() / (fft.specSize()/15));
  sum = new float[bands];
}

void initDefaultData()
{
  float angle;

  formResolution   = 15;
  stepSize         = 10;
  distortionFactor = 70;
  initRadius       = 200;
  scale            = 0.30;
  smooth_factor    = 0.15;

  x   = new float[formResolution];
  y   = new float[formResolution];
  sum = new float[bands];

  centerX = width/2; 
  centerY = height/2;

  angle = radians(360/float(formResolution));

  for (int i=0; i<formResolution; i++)
  {
    x[i] = cos(angle*i) * initRadius;
    y[i] = sin(angle*i) * initRadius;
  }
}



void calcStepSize()
{
  float range;
  fft.forward(song.mix);
  for (int i = 0; i < bands; i++) 
  {
    sum[i] += (fft.getBand(i) - sum[i]) * smooth_factor;

    range = (sum[i] * scale);

    x[i] += random(-range, range);
    y[i] += random(-range, range);
  }
}


void visualizeSound()
{
  calcStepSize();
  beginShape();
  curveVertex(x[formResolution-1]+centerX, y[formResolution-1]+centerY);

  for (int i=0; i<formResolution; i++) 
  {
    curveVertex(x[i]+centerX, y[i]+centerY);
  }
  curveVertex(x[0]+centerX, y[0]+centerY);
  curveVertex(x[1]+centerX, y[1]+centerY);

  endShape();
}

void draw() 
{
  background(199,97,106);
  if (song.isPlaying() == true)
  {
    visualizeSound();
  }
  
  
  if ( listening )
  {  
    waveform.draw();
  }
 {
   play.update();
  play.draw();
  rewind.update();
  rewind.draw();
  ffwd.update(); 
  ffwd.draw();
 }
}

void mousePressed()
{
  play.mousePressed();
  rewind.mousePressed();
  ffwd.mousePressed();
}

void mouseReleased()
{
  play.mouseReleased();
  rewind.mouseReleased();
  ffwd.mouseReleased();
}

void keyPressed()
{
  if ( key == ' ' )
  {
    if ( !listening )
    {
      song.addListener( waveform ); 
      listening = true;
    }
  }
}