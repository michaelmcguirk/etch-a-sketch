class Button extends Toggle
{
  String text;
  boolean clicked = false;

  Button(float _x, float _y, float _r, String _text)
  {
    super(_x, _y, _r);
    text = _text;
  }

  void display()
  {
    super.display();

    pushMatrix();
    translate(x, y);
    ellipseMode(CENTER);
    fill(0);
    stroke(255, 255, 33);
    ellipse(0, 0, r, r);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(r/3);
    text(text, 0, -r/20);
    popMatrix();
  }

  void click()
  {

    if (mouseDistance <= r/2 && mousePressed)
    {
      clicked =true;
      println("clicked");
    }
    else
    {
      clicked = false;
      //println("false click");
    }
  }
}

