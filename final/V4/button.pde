abstract class Button
{
  int x, y, hw, hh;
  
  Button(int x, int y, int hw, int hh)
  {
    this.x = x;
    this.y = y;
    this.hw = hw;
    this.hh = hh;
  }
  
  boolean pressed()
  {
    return mouseX > x - hw && mouseX < x + hw && mouseY > y - hh && mouseY < y + hh;
  }
  
  abstract void mousePressed();
  abstract void mouseReleased();
  abstract void update();
  abstract void draw();
}

class Play extends Button
{
  boolean play;
  boolean invert;
  
  Play(int x, int y, int hw, int hh) 
  { 
    super(x, y, hw, hh); 
    play = true;
  }
  
  //play and pause
  void mousePressed()
  {
    if ( pressed() )
    {
      invert = true;
      if ( song.isPlaying() ) 
      {
        song.pause();
        play = true;
      }
      else
      {
        song.loop();
        play = false;
      }
    }
  }
  
  void mouseReleased()
  {
    invert = false;
  }
  
  void update()
  {
    if ( song.isPlaying() ) play = false;
    else play = true;
  }
  
  void draw()
  {
    if ( invert )
    {
      fill(255);
      stroke(0);
    }
    else
    {
      noFill();
      stroke(255);
    }
    rect(x - hw, y - hh, hw*2, hh*2);
    if ( invert )
    {
      fill(0);
      stroke(255);
    }
    else
    {
      fill(255);
      noStroke();
    }
    if ( play )
    {
      triangle(x - hw/3, y - hh/2, x - hw/3, y + hh/2, x + hw/2, y);
    }
    else
    {
      rect(x - hw/3, y - hh/2, hw/4, hh);
      rect(x + hw/8, y - hh/2, hw/4, hh);
    }
  }
}

class Rewind extends Button
{
  boolean invert;
  boolean pressed;
  
  Rewind(int x, int y, int hw, int hh)
  {
    super(x, y, hw, hh);
    invert = false;
  }
  
  // backwards
  void update()
  {
    //rewind button pressed
    if (pressed)
    {
      //position
      int pos = song.position();

      if ( pos > 200 )
      {
        // rewind by 200 milliseconds
        song.skip(-200);
      }
      else
      {
        // if not rewind to beginning
        song.rewind();
      }
    }
  }
  
  void mousePressed()
  {
    pressed = pressed();
    if ( pressed ) 
    {
      invert = true;
      if ( !song.isPlaying() ) song.rewind();      
    }
  }
  
  void mouseReleased()
  {
    pressed = false;
    invert = false;
  }

  void draw()
  {
    if ( invert )
    {
      fill(255);
      stroke(0);
    }
    else
    {
      noFill();
      stroke(255);
    }
    rect(x - hw, y - hh, hw*2, hh*2);
    if ( invert )
    {
      fill(0);
      stroke(255);
    }
    else
    {
      fill(255);
      noStroke();
    }
    triangle(x - hw/2, y, x, y - hh/2, x, y + hh/2);
    triangle(x, y, x + hw/2, y - hh/2, x + hw/2, y + hh/2);    
  }  
}

class Forward extends Button
{
  boolean invert;
  boolean pressed;
  
  Forward(int x, int y, int hw, int hh)
  {
    super(x, y, hw, hh);
    invert = false;
  }
  
  void update()
  {

    if (pressed)
    {

      int pos = song.position();

      if ( pos < song.length() - 40 )
      {

        song.skip(40);
      }
      else
      {

        song.cue( song.length() );
      }

      song.play();
    }
  }
  
  void mousePressed()
  {
    pressed = pressed();
    if ( pressed ) 
    {
      invert = true;      
    }
  }
  
  void mouseReleased()
  {
    pressed = false;
    invert = false;
  }

  void draw()
  {
    if ( invert )
    {
      fill(255);
      stroke(0);
    }
    else
    {
      noFill();
      stroke(255);
    }
    rect(x - hw, y - hh, hw*2, hh*2);
    if ( invert )
    {
      fill(0);
      stroke(255);
    }
    else
    {
      fill(255);
      noStroke();
    }
    triangle(x, y, x - hw/2, y - hh/2, x - hw/2, y + hh/2);
    triangle(x, y - hh/2, x, y + hh/2, x + hw/2, y);    
  }  
}