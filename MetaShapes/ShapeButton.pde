// Because statics aren't supported, we're using a global,
// which lacks privacy, but is the easiest way to implement
// a "static."

Shape shapeSelected;

class ShapeButton {

  Shape shape;

  PImage shadow;

  float x;
  float y;

  float w;
  float h;

  float m = 10; // margin

  boolean hasBorder = false;
  boolean isSelected = false;
  boolean hasDropshado = false;

  ShapeButton(float _x, float _y, float _w, float _h, Shape _shape) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;

    shape = _shape; 

    shadow = loadImage("shadow.png");
  }

  void display() {
    tint(255, 25);
    image(shadow, x-10, y-10);
    tint(255, 255);
    if (isSelected && shapeSelected == shape) {
      strokeWeight(2);
      stroke(0);
    } else {
      strokeWeight(1);
      stroke(200);
    }
    fill(200);
    rect(x, y, w, h, 10);
    fill(currentColor);
    noStroke();
    switch(shape) {
    case ELLIPSE:
      ellipseMode(CORNER);
      ellipse(x+m, y+m, w-2*m, h-2*m);
      break;
    case RECT:
      rect(x+m, y+m, w-2*m, h-2*m);
      break;
    case TRIANGLE:
      triangle(x+m+(w-2*m)/2, y+m, x+m, y+h-m, x+w-m, y+h-m);
      break;
    }
  }

  void detectTouch(float tx, float ty) {
    if (tx > x &&
      tx < x + w &&
      ty > y &&
      ty < y + h) {
      reset();
      if (shapeSelected != shape) {
        isSelected = true;
        if (isSelected) {
          shapeSelected = shape;
        }
      } else {
        isSelected = false;
        shapeSelected = null;
      }
    }
  }

  void reset() {
    globalSize = new PVector(100, 100);
    globalRotation = 0;
  }
}
