ShapeList shapeList;

class ShapeCanvas {

  PGraphics canvas;

  color backgroundColor;
  float x, y, w, h;

  boolean mouseOver;

  ShapeCanvas(float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;

    backgroundColor = color(255);

    canvas = createGraphics(width, height);

    shapeList = new ShapeList();
  }

  void display() {
    stroke(200);
    strokeWeight(1);
    rect(x-1, y-1, w+1, h+1);
    
    canvas.beginDraw();
    canvas.clip(x, y, w, h);
    canvas.background(backgroundColor);
    canvas.shapeMode(CENTER);
    
    // Shapes that have already been placed.

    for (int i = 0; i < shapeList.shapes.size(); i++) {
      PShape shape = shapeList.shapes.get(i);
      PVector pos = shapeList.positions.get(i);
      float r = shapeList.rotations.get(i);
      color c = shapeList.colors.get(i);
      canvas.push();
      canvas.translate(pos.x, pos.y);
      canvas.push();
      canvas.rotate(r);
      shape.setFill(c);
      shape.setStroke(false);
      canvas.shape(shape, 0, 0);
      canvas.pop();
      canvas.pop();
    }

    // Canvas UI Graphics

    canvas.stroke(0);
    canvas.strokeWeight(2);
    canvas.fill(currentColor);
    canvas.translate(mouseX, mouseY);
    if (shapeSelected != null) {
      canvas.push();
      canvas.rotate(globalRotation);
      switch (shapeSelected) {
      case TRIANGLE:
        PShape tri = createEqTriangle(0, 0, globalSize.y);
        tri.setStroke(0);
        tri.setStrokeWeight(2);
        tri.setFill(currentColor);
        canvas.shape(tri);
        break;
      case RECT:
        canvas.rectMode(CENTER);
        canvas.rect(0, 0, globalSize.x, globalSize.y);
        break;
      case ELLIPSE:
        canvas.ellipse(0, 0, globalSize.x, globalSize.y);
        break;
      }
      canvas.pop();
    }

    canvas.endDraw();
    image(canvas, 0, 0);
  }


  void detectTouch(float tx, float ty) {
    if (tx > x &&
      tx < x + w &&
      ty > y &&
      ty < y + h) {
      if (shapeSelected != null) {
        switch (shapeSelected) {
        case TRIANGLE:
          shapeList.addShape(Shape.TRIANGLE, tx, ty, globalSize.x, globalSize.y, globalRotation, currentColor);
          break;
        case RECT:
          shapeList.addShape(Shape.RECT, tx, ty, globalSize.x, globalSize.y, globalRotation, currentColor);
          break;
        case ELLIPSE:
          shapeList.addShape(Shape.ELLIPSE, tx, ty, globalSize.x, globalSize.y, globalRotation, currentColor);
          break;
        }
      }
    }
  }
}
