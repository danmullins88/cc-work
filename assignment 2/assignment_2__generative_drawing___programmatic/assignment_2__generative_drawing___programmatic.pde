// size of page
size(600, 600);

// set background colour
background(255);

//draw 2x ellipse in the center
ellipseMode(RADIUS);  // Set to RADIUS
fill(0);
ellipse(300, 300, 100, 100);  // Draw ellipse

fill( 255, 228, 30);
ellipse(300, 300, 60, 60);  // Draw ellipse

//draw square top left
fill(155, 155, 155);
stroke(155, 155, 155);
// square 
rect(50, 50, 150, 150);
//    x,  y, width,height

//a triangle
fill(215, 50, 13, 200);
stroke(215, 50, 13);
triangle(50, 200, 200, 200, 125, 50);

//draw square top left
fill(215, 50, 13, 200);
stroke(215, 50, 13);
// square 
rect(400, 400, 150, 150);
//    x,  y, width,height

//a triangle
fill(155, 155, 155, 255);
stroke(155, 155, 155);
triangle(400, 400, 475, 550, 550, 400);

// draw 3 line
stroke(0);
// ^ line colour    ^ transparency
//   x1, y1,  x2,  y2
line(0, 600, 600, 0);

stroke(0);
// ^ line colour    ^ transparency
//   x1, y1,  x2,  y2
line(0, 550, 550, 0);

stroke(0);
// ^ line colour    ^ transparency
//   x1, y1,  x2,  y2
line(0, 650, 650, 0);