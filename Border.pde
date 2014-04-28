class Border
{
  int thickness;
  color c;

  Border()
  {
    thickness = width/12;
    c = color(255, 0, 0);
  }

  void display()
  {
    rectMode(CORNER);
    noStroke();
    fill(c);
    rect(0, 0, width, thickness); //top
    rect(0, 0, thickness, height); //left
    rect(width-thickness, 0, thickness, height);  //right
    rect(0, height-thickness*2, width, height); //bottom
  }
}

