// Shape List is a structure that holds the order
// of all shapes being created in order to keep it drawn
// to the screen and to be able to prepare it for output.
// This also enables undo and redo.

class ShapeList {
  ArrayList<String> shapeTypes;
  ArrayList<PVector> sizes;
  ArrayList<PShape> shapes;
  ArrayList<PVector> positions;
  ArrayList<Float> rotations;
  ArrayList<Integer> colors;

  ShapeList() {
    shapeTypes = new ArrayList<String>();
    sizes = new ArrayList<PVector>();
    shapes = new ArrayList<PShape>();
    positions = new ArrayList<PVector>();
    rotations = new ArrayList<Float>();
    colors = new ArrayList<Integer>();
  }

  void addShape(Shape shape, float x, float y, float w, float h, float r, color c) {
    String newShapeType = "";
    PVector newSize = new PVector(w,h);
    PShape newShape;
    PVector newPosition = new PVector(x, y);
    float newRotation = r;
    color newColor = c;
    switch (shape) {
    case TRIANGLE:
      newShapeType = "TRIANGLE";
      newShape = createEqTriangle(0, 0, h);
      shapes.add(newShape);
      break;
    case RECT:
      newShapeType = "RECT";
      newShape = createShape(RECT, -w/2, -h/2, w, h); // Somewhat arbitrary to move them back. Not sure why placement doesn't adhere to CENTER mode here.
      shapes.add(newShape);
      break;
    case ELLIPSE:
      newShapeType = "ELLIPSE";
      newShape = createShape(ELLIPSE, -w/2, -h/2, w, h); // Somewhat arbitrary to move them back. Not sure why placement doesn't adhere to CENTER mode here.
      shapes.add(newShape);
      break;
    }
    sizes.add(newSize);
    shapeTypes.add(newShapeType);
    positions.add(newPosition);
    rotations.add(newRotation);
    colors.add(newColor);
  }
}
