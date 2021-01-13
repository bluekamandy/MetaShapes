void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      globalSize = new PVector(globalSize.x, globalSize.y + 10);
    } else if (keyCode == DOWN) {
      globalSize = new PVector(globalSize.x, globalSize.y - 10);
    } else if (keyCode == LEFT) {
      globalSize = new PVector(globalSize.x - 10, globalSize.y);
    } else if (keyCode == RIGHT) {
      globalSize = new PVector(globalSize.x + 10, globalSize.y);
    }
  }

  if (key == 'R' || key == 'r') {
    palette.randomizeColors();
  } else if (key == 'B' || key == 'b') {
    backgroundColor = currentColor;
    shapeCanvas.backgroundColor = backgroundColor;
  } else if (key == 'A' || key == 'a') {
    globalRotation = (globalRotation - PI/16) % (2*PI);
  } else if (key == 'S' || key == 's') {
    globalRotation = (globalRotation + PI/16) % (2*PI);
  } else if (key == 'H' || key == 'h') {
    palette.rainbowColors();
  }
}

void mouseReleased() {
  ellipseButton.detectTouch(mouseX, mouseY);
  rectButton.detectTouch(mouseX, mouseY);
  triangleButton.detectTouch(mouseX, mouseY);

  if (randomizeButton.isClicked) {
    randomizeButton.executeAction();
    randomizeButton.isClicked = false;
  }
  if (saveButton.isClicked) {
    saveButton.executeAction();
    saveButton.isClicked = false;
  }
  if (clearButton.isClicked) {
    clearButton.executeAction();
    clearButton.isClicked = false;
  }


  shapeCanvas.detectTouch(mouseX, mouseY);
}

void mousePressed() {
  randomizeButton.detectTouch(mouseX, mouseY);
  saveButton.detectTouch(mouseX, mouseY);
  clearButton.detectTouch(mouseX, mouseY);
}

PShape createEqTriangle(float x, float y, float radius) {
  
  PVector[] points = createEqTrianglePoints(x, y, radius);

  return createShape(TRIANGLE, points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y);
}

PVector[] createEqTrianglePoints(float x, float y, float radius) {

  radius = radius * 2/3; // An adjustment to make it seem perceptually similar to the other shapes.
  PVector center = new PVector(x, y);

  PVector A = new PVector(
    center.x -  radius*cos(PI/6), 
    center.y + radius*sin(PI/6)
    );
  PVector B = new PVector(
    center.x + radius*cos(PI/6), 
    center.y + radius*sin(PI/6)
    );
  PVector C = new PVector(
    center.x, 
    center.y - radius
    );

  return new PVector[]{A, B, C};
}
