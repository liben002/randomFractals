// constructor for the fractal tree

class fractalTree {
  float x;
  float y;
  float angle;

  fractalTree(float x, float y, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
  }

  void draw(){
    // creates a line at the given coordinates and angle value
    drawBranch(x, y, angle);
  }

  void drawBranch(float x, float y, float angle) {
    // EDITABLE: changes complexity of fractal. Recommended to keep between 0.5 and 0.8
    x *= 0.79;
    angle *= 0.8;
    // keep on drawing branches until x > y
    if (x >= y) {
      translateBranch(x, y, angle);  
    }
  }
  void translateBranch(float x, float y, float angle) {
    // REMEMBER: pushMatrix() and then popMatric() to get translate to work
    // EDITABLE: move where rotations and translations are to change fractal type
    pushMatrix();
    rotateX(angle);
    line(0, 0, 0, -x);
    translate(0, -x);
    drawBranch(x, y, angle);
    popMatrix();
    pushMatrix();
    rotateX(-angle);
    line(0, 0, 0, -x);
    translate(0, -x);
    drawBranch(x, y, angle);
    popMatrix();
   
    pushMatrix();
    rotateZ(angle);
    line(0, 0, 0, -x);
    translate(0, -x);
    drawBranch(x, y, angle);
    popMatrix();
    pushMatrix();
    rotateZ(-angle);
    line(0, 0, 0, -x);
    translate(0, -x);
    drawBranch(x, y, angle);
    popMatrix();
  }
}