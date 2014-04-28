public class Line
{
  float x, y, lineThickness;

  Line(float _x, float _y)
  {
    
    x = _x;
    y = _y;
    lineThickness = 2;
  }

  void display()
  {
    x = constrain(x, b.thickness, (width-b.thickness));
    y = constrain(y, b.thickness, (height-b.thickness*2));
    strokeWeight(lineThickness);
    stroke(0);
    point(x, y);
  }


  //drawing method that can be used with direction keys.
  void drawing()
  {

    if ((keyPressed) && (key == CODED))
    {
      if (keyCode == UP)
      {
        y -= 1;
      }
      else if (keyCode == DOWN)
      {
        y += 1;
      }
      else if (keyCode == LEFT)
      {
        x += -1;
      }
      else if (keyCode == RIGHT)
      {
        x += 1;
      }
    }
  }

  //drawing method specific to the dials.
  void drawing(Dial dx, Dial dy)
  {
    if (mousePressed = true)
    {
      if (dx.movingPositive)
      {
        x += 1;
      }
      if (dx.movingNegative)
      {
        x -= 1;
      }

      if (dy.movingPositive)
      {
        y -= 1;
      }
      if (dy.movingNegative)
      {
        y += 1;
      }
    }
  }
}

