class ColorPalette {

  PImage paletteShadow;

  int colorsWide;
  int colorsHigh;
  int w;
  int h;

  boolean isRandom = true;

  ColorButton[] buttons;

  ColorPalette(int _colorsWide, int _colorsHigh, int _w, int _h, boolean _isRandom) {

    colorsWide = _colorsWide;
    colorsHigh = _colorsHigh;
    w = _w;
    h = _h;
    isRandom = _isRandom;

    paletteShadow = loadImage("palette_shadow.png");

    initButtons();
  }

  ColorPalette(int _colorsWide, int _colorsHigh, int _w, int _h) {
    colorsWide = _colorsWide;
    colorsHigh = _colorsHigh;
    w = _w;
    h = _h;
    
    paletteShadow = loadImage("palette_shadow.png");

    initButtons();
  }

  void initButtons() {
    buttons = new ColorButton[colorsWide*colorsHigh];

    int index = 0;
    for (int y = 0; y < colorsHigh; y++) {
      for (int x = 0; x < colorsWide; x++) {
        if (isRandom) {
          colorMode(RGB, 255, 255, 255);
          buttons[index++] = new ColorButton(color(int(random(255)), int(random(255)), int(random(255))), 
            x*width/colorsWide, 
            y*100, 
            width/colorsWide, 
            100);
        } else {
          colorMode(HSB, 360, 100, 100);
          buttons[index++] = new ColorButton(color(map(x, 0, colorsWide, 0, 360), map(y, 0, colorsHigh, 100, 0), 100), 
            x*width/colorsWide, 
            y*100, 
            width/colorsWide, 
            100);
          colorMode(RGB, 255, 255, 255);
        }
      }
    }
  }

  void display() {
    for (int x = 0; x < width; x++) {
      tint(255, 25);
      image(paletteShadow, x, 100*colorsHigh);
    }
    tint(255,255);
    for (ColorButton b : buttons) {
      b.display();
      if (b.detectTouch(mouseX, mouseY, mousePressed)) {
        currentColor = b.c;
      }
    }
  }

  void randomizeColors() {
    for (ColorButton b : buttons) {
      b.randomizeColor();
    }
  }
  
  void rainbowColors() {
    isRandom=false;
    initButtons();
  }
}
