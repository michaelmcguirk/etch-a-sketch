//toggle class is super class of Dial and Button classes.
class Toggle
{
  float x, y, r, mouseDistance;
  PVector mouse, center;

  Toggle(float _x, float _y, float _r)
  {
    x = _x;
    y = _y;
    r = _r;
  }

  void display()
  {
    point(x, y);
    mouse = new PVector(mouseX, mouseY);
    center = new PVector(x, y);

    mouseDistance = PVector.dist(mouse, center);
    mouse.sub(center);
    mouse.normalize();
    mouse.mult(r);

    pushMatrix();
    translate(x, y);
    popMatrix();
  }
}

