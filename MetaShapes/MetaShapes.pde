/*
  
 MetaShapes:
 The Shape Compiler
 
 programmed
 by
 M A S O O D
 
 Initiated: 1/7/2021
 Last Updated: 1/12/2021
 
 Note: This is a graphical shape collage maker that writes processing 
 code to create that face. This is a process is sometimes called
 metaprogramming. It's inspired by the history of painting programs
 for kids, specifically KidPix, which was created by Broderbund.
 
 Keyboard Shortcuts (necessary to fully use the program):
 
 UP - Increase vertical size.
 DOWN - Decrease vertical size.
 RIGHT - Increase horizontal size.
 LEFT - Decrease horizontal size.
 A - Rotate PI/16 (11.25°) CCW
 S - Rotate PI/16 (11.25°) CC
 B - Set background color.
 R - Randomize palette.
 H - Set palette to rainbow hues.
 
 */


import java.util.*;

enum Shape {
  ELLIPSE, 
    RECT, 
    TRIANGLE,
}

PVector globalSize;
float globalRotation;

ColorPalette palette;
color currentColor;
color backgroundColor;

ShapeCanvas shapeCanvas;
int canvasW = 1000;
int canvasH = 1000;

ColorButton white;
ColorButton black;

ShapeButton ellipseButton;
ShapeButton rectButton;
ShapeButton triangleButton;

ActionButton randomizeButton;
ActionButton saveButton;
ActionButton clearButton;

ShapeCompiler shapeCompiler;

int ui_w = 100;
int ui_h = 100;
int ui_margin = 25;

void setup() {
  fullScreen();
  cursor(CROSS);
  
  // Setting up canvas so it works on any monitor.
  canvasH = height - 200 - ui_margin - ui_margin;
  canvasW = canvasH;
  
  currentColor = color(255);
  palette = new ColorPalette(10, 2, width, height, false);

  white = new ColorButton(color(255), ui_margin, height - ui_margin*2 - ui_h*2, ui_w, ui_h);
  white.hasBorder = true;
  black = new ColorButton(color(0), ui_margin*2+ui_w, height - ui_h - ui_margin, ui_w, ui_h);
  black.hasBorder = true;

  backgroundColor = color(255);

  shapeCanvas = new ShapeCanvas(width/2 - canvasW/2, height/2 - canvasH/2 + 100, canvasW, canvasH);

  println(width/2 - canvasW/2);
  println(height/2 - canvasH/2 + 100);
  
  ellipseButton = new ShapeButton(ui_margin, height - ui_margin*3 - ui_h*3, ui_w, ui_h, Shape.ELLIPSE);
  rectButton = new ShapeButton(ui_margin, height - ui_margin*4 - ui_h*4, ui_w, ui_h, Shape.RECT);
  triangleButton = new ShapeButton(ui_margin, height - ui_margin*5 - ui_h*5, ui_w, ui_h, Shape.TRIANGLE);

  randomizeButton = new ActionButton(width - ui_w - ui_margin, height - ui_h - ui_margin, "RANDOMIZE");
  saveButton = new ActionButton(width - ui_w - ui_margin, height - ui_h*2 - ui_margin*2, "SAVE");
  clearButton = new ActionButton(width - ui_w - ui_margin, height - ui_h*3 - ui_margin*3, "CLEAR");

  shapeCompiler = new ShapeCompiler();
  
  globalSize = new PVector(100, 100);
  globalRotation = 0.0;
}

void draw() {
  background(255);
  // UI
  palette.display();

  // Current Color
  stroke(200);
  fill(currentColor);
  rect(ui_margin, height - ui_h - ui_margin, ui_w, ui_h); 

  // Black and White
  white.display();
  if (white.detectTouch(mouseX, mouseY, mousePressed)) {
    currentColor = white.c;
  }

  black.display();
  if (black.detectTouch(mouseX, mouseY, mousePressed)) {
    currentColor = black.c;
  }

  // Drawing Space
  shapeCanvas.display();

  // Tool Bar
  ellipseButton.display();
  rectButton.display();
  triangleButton.display();
  
  // Action Tools
  randomizeButton.display();
  saveButton.display();
  clearButton.display();
}
