// size of page
size(800, 800);

// use photoshop to pick colours
background(190, 100, 50);

int joe = 255;
int sally = 100;
// instead of writing numbers you can write names for coordinates

stroke(255, 255, 0, 100);
// ^ line colour    ^ transparency
//   x1, y1,  x2,  y2
line(10, 600, 300, 600);

fill(150, 200, 40);
stroke(100);
// rectangle 
rect(20, 30, 100, 150);
//    x,  y, width,height

fill(255, 200, 0);
ellipse(400, 250, 50, 50);
// ^ circle
fill(200, 60, 70);
ellipse(width/2, height/2, 50, 50);
//      ^ to center shape halve width and height (can halve it by whatever therefor can determine a location on the page)

//a triangle
fill(100, 100, 255);
triangle(30, 75, 400, 20, 86, 150);

// look at processing site to get more instructions and ideas. 