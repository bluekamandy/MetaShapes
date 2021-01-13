class ActionButton {
  String action;

  PImage randomizeIcon; // icons should be 72x72 px
  PImage clearIcon;
  PImage saveIcon;

  PImage shadow;

  float x;
  float y;

  float w = 100;
  float h = 100;

  float m = 10; // margin

  boolean hasBorder = false;
  boolean isClicked = false;
  boolean hasDropshado = false;

  ActionButton(float _x, float _y, String _action) {
    x = _x;
    y = _y;

    action = _action;

    shadow = loadImage("shadow.png");
    randomizeIcon = loadImage("randomizeIcon.png");
    clearIcon = loadImage("clearIcon.png");
    saveIcon = loadImage("saveIcon.png");
  }

  void display() {
    tint(255, 25);
    image(shadow, x-10, y-10);
    tint(255, 255);
    if (isClicked) {
      strokeWeight(2);
      stroke(255, 0, 255);
    } else {
      strokeWeight(1);
      stroke(200);
    }
    fill(200);
    rect(x, y, w, h, 10);
    switch (action) {
    case "RANDOMIZE":
      image(randomizeIcon, x+14, y+14);
      break;
    case "SAVE":
      image(saveIcon, x+14, y+14);
      break;
    case "CLEAR":
      image(clearIcon, x+14, y+14);
      break;
    }
  }

  void detectTouch(float tx, float ty) {
    if (tx > x &&
      tx < x + w &&
      ty > y &&
      ty < y + h) {
      isClicked = !isClicked;
    }
  }

  void executeAction() {
    switch (action) {
    case "RANDOMIZE":
      for (int i = 0; i < shapeList.colors.size(); i++) {
        shapeList.colors.set(i, color(int(random(255)), int(random(255)), int(random(255))));
      }
      shapeCanvas.backgroundColor = color(int(random(255)), int(random(255)), int(random(255)));
      break;
    case "SAVE":
      shapeCompiler.saveImageAsPDE();
      break;
    case "CLEAR":
      shapeList = new ShapeList();
      shapeCanvas.backgroundColor = color(255);
      break;
    }
  }
}
