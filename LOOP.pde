PImage avocado;
float rValue = 0;

void setup () {
  size(900, 900);
  noStroke();
  background(134, 59, 191);
  avocado = loadImage("Avocado-flip.png");
  imageMode(CENTER);
  
}

void draw (){
  rValue = rValue + .5;
//background(134, 59, 191);

translate(width/2, width/2);
 rotate(radians(rValue));
// horizontal line
  for (int i=0; i<7; i++){
  image(avocado,50 + i *60, 0, 60, 60);
  }
  
  
}