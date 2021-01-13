class ColorButton {

  color c;

  float x;
  float y;

  float w;
  float h;

  boolean hasBorder = false;
  Boolean selected;

  ColorButton(color _c, float _x, float _y) {
    c = _c;
    x = _x;
    y = _y;
  }

  ColorButton(color _c, float _x, float _y, float _w, float _h) {
    c = _c;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  }

  void display() {
    fill(c);
    if (hasBorder) {
      stroke(200);
    } else {
      noStroke();
    }
    rect(x, y, w, h);
  }

  Boolean detectTouch(float tx, float ty, boolean tch) {
    if (tch &&
      tx > x &&
      tx < x + w &&
      ty > y &&
      ty < y + h) {
      return true;
    } else {
      return false;
    }
  }

  void randomizeColor() {
    c = color(random(255), random(255), random(255));
  }
}
