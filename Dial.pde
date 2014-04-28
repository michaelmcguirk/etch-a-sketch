class Dial extends Toggle
{
  float theta, prevTheta;
  boolean movingPositive, movingNegative;

  Dial(float _x, float _y, float _r)
  {
    super(_x, _y, _r);
    theta = 0;
    prevTheta = 0;
  }


  void display()
  {
    super.display();

    if (mouseDistance <= r)
    {
      //atan2() to get the angle between the mouse coordinates and the origin.
      theta = atan2(mouse.y, mouse.x)< 0 ? atan2(mouse.y, mouse.x) + TWO_PI :   atan2(mouse.y, mouse.x);
    }
    noFill();
    pushMatrix();
    translate(x, y);
    stroke(200);
    line(0, 0, r, 0);
    stroke(255, 0, 0);
    fill(255);
    ellipse(0, 0, r*2, r*2);
    fill(150);
    ellipse(0, 0, r, r);
    rectMode(RADIUS);
    stroke(255, 255, 255);
    if (mouseDistance <= 100)  //check mouse position is within the dial radius.
    {
      line(0, 0, mouse.x, mouse.y);
    }
    stroke(255, 0, 0);
    strokeWeight(1);
    arc(0, 0, 30, 30, 0, theta);
    popMatrix();

    //println("M" + degrees(theta));
    //println("P" + degrees(theta));
    //println("Mouse Dist " + mouseDistance);
  }

  void move()
  {
    //checking for positive or negative movement.
    if (degrees(theta) - degrees(prevTheta) > 2)
    {
      //println("move");
      prevTheta = theta;
      movingPositive = true;
    }
    else if (degrees(prevTheta) - degrees(theta) > 0)
    {
      prevTheta = theta;
      movingNegative = true;
      println("move");
    }
    else
    {
      movingPositive = false;
      movingNegative = false;
      prevTheta = theta;
    }
  }
}

