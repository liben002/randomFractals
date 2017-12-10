/** 
 * Allows user to explore fractals in 3D. Press "r" to generate new fractal. Left click, w, or up to zoom in. Right click, s, or down to zoom out. 
 * Editable parts of the sketch are labaled as such. Allow Processing at least 1 GB of RAM for optimal result.
 * Additional fractals such as pyramids and spheres soon to come.
 * Inspired by Dr. Nguyen's recursion and line segment labs, chaos theory misguidances, and a Numberphile Youtube video.
 * Created by Benjamin Li
 */

int zAxis = 300;
int r = (int)random(256);
int g = (int)random(256);
int b = (int)random(256);
//int backgroundR = (int)random(256);
//int backgroundG = (int)random(256);
//int backgroundB = (int)random(256);
//int title;
// 0 for fractalTree, 1 for fractalPyramid, 2 for fractalSphere
//int fractal;
ArrayList fractals;
  
void setup() {
  //title = 0;
  // creates third dimension using OpenGL
  size(1080, 720, P3D);
  frameRate(144);
  zAxis = constrain(zAxis, 200, 800);
  // creates blank array to store fractals
  fractals = new ArrayList();
  // creates a fractal with random branch sizes and angles
  fractals.add(new fractalTree(random(50, 80), random(20, 30), random(10, 90)));
}

void draw() {
  //if (title != 0) {
    // dark grey
  background(#424242);
  //}
  // left click to zoom in, right click to zoom out
  if (mousePressed) {
    if (mouseButton == LEFT) {
      zAxis += 2;  
    }
    else if (mouseButton == RIGHT) {
      zAxis -= 2;
    }
  }
  // w or up to zoom in, s or down to zoom out
  if (keyPressed) {
    if (key == 'w' || keyCode == UP) {
      zAxis += 2;
    } else if (key == 's' || keyCode == DOWN) {
      zAxis -= 2;
    }
  }
  // TO DO: add fractalPyramid and fractalSphere options
  // places every fractal tree into the middle
  translate(width/2, height/2, zAxis);
  // moves the perspective based on the mouse movement
  float perspectiveY = map(radians(mouseX), 0, 20, 0, TWO_PI);
  float perspectiveX = map(radians(mouseY), 0, 20, 0, TWO_PI);
  rotateX(perspectiveX * 2.5);
  rotateY(perspectiveY * 1.5);
  // determines color and opacity of branches
  stroke(r, g, b, random(155, 200));
  updateFractalTree();
}

public void updateFractalTree() {
  // count backwards (copy from line segment lab)
  for (int i=fractals.size()-1;i>=0;i--) {
    fractalTree fractal = (fractalTree)fractals.get(i);
    fractal.draw();
    // pressing r changes to random fractal
    if (keyPressed) {
      if (key == 'r') {
          r = (int)random(256);
          g = (int)random(256);
          b = (int)random(256);
        fractals.remove(i);
        fractals.add(new fractalTree(random(50, 80), random(20, 30), random(10, 90)));
      }
    }
  }
}
