import ketai.sensors.*;
KetaiSensor sensor;

Border b;
Button saveButton, clearButton;
Line l;
Dial dl, dr;
PVector accel1 = new PVector();
PVector accel2 = new PVector();
float accelDelta;
int shakeCount = 0;
PFont main;
String savePath;

void setup()
{
  orientation(LANDSCAPE);
  try    //checking if accelerometer present if an android device
  {
    sensor = new KetaiSensor(this);
    sensor.start();
    println(sensor.list());
    savePath = "/storage/sdcard0/Save1.jpg";
  }
  catch(NoClassDefFoundError e)
  {
    savePath = "EtchSketch_" + hour() + minute() + second() +"_"+ day() + month() + year() + ".jpg";
    println("No Accelerometer Present");
  }


  size(700, 480);
  background(200);

  b = new Border();
  saveButton = new Button(width/3, height - height/8, height/6, "Save");
  clearButton = new Button(width-width/3, height - height/8, height/6, "Clear");
  b.display();
  l = new Line(width/2, height/2);
  dr = new Dial((width-width/10), (height-height/8), width/12);
  dl = new Dial(width-(width-width/10), (height-height/8), width/12);
  main = loadFont("Harrington-48.vlw");
  textAlign(CENTER, CENTER);
  textFont(main, 50);
  fill(255, 255, 33);
  text("Etch-a-Sketch", width/2, height/16);
}

void draw()
{

  l.display();
  l.drawing(dr, dl);
  l.drawing();
  dr.display();
  dr.move();

  dl.display();
  dl.move();

  saveButton.display();
  clearButton.display();


  fill(255);

  //angle between current accelerometer PVector and Previous
  accelDelta = PVector.angleBetween(accel1, accel2);

  if (degrees(accelDelta) > 35)
  {
    println("kkk");
    clearScreen();
  }
  accel2.set(accel1);
}

void mousePressed()
{
  saveButton.click();
  clearButton.click();
  if (saveButton.clicked)
  {
    //Create a PImage of just the drawing area.
    PImage img = get(b.thickness, b.thickness, width-b.thickness*2, height - b.thickness*3);
    img.save(savePath);
  }
  if (clearButton.clicked)
  {
    setup();
  }
}

void onAccelerometerEvent(float x, float y, float z)
{ 
  accel1.x = x;
  accel1.y = y;
  accel1.z = z;
}

void clearScreen()
{
  if (shakeCount > 30)
  {
    setup();
    println("Shake-A-Shake-A");
    shakeCount = 0;
  }
  else
  {
    shakeCount ++;
  }
}

