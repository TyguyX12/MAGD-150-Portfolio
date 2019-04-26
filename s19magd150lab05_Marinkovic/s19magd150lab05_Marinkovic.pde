boolean receptionFixed = false;
int channel = 0;
int rectColor = 125;
int circleColor = 125;
String prevMouseState = "Released";
void setup()
{
  size(500,500);
  background(255);
 
  fill(125);
  rect(50,50,400,425,45);
  fill(255);
  rect(75,75,350,300);
  strokeWeight(1);
  for (int x=0;x<100000;x++)
  {
    point(75+random(350),75+random(300));
  }
}
void draw()
{
  fill(rectColor);
  rect(100,413,200,25);
  String s = "Press here to fix reception";
  fill(0);
  textSize(15);
  textAlign(CENTER);
  text(s, 100, 415, 200, 25);
  fill(circleColor);
  ellipse(375,425,75,75);
  s = "Channel";
  textSize(15);
  textAlign(CENTER);
  fill(0);
  text(s, 337,415, 75, 75);
  if (inRect())
  {
    if (mousePressed)
    {
      if (receptionFixed == false)
      {
        channel = round(random(3)+1);
      }
      receptionFixed = true;
    }
  }
  if (inCircle())
  {
    if (mousePressed && receptionFixed == true && prevMouseState.equals("Released"))
    {
       if (channel == 3)
       {
         channel = 1;
       }
       else
       {
         channel++;
       }
    }
  }   
  switch(channel)
  {
    case 1:
      fill(255,0,0);
      rect(75,75,350,300);
      break;
    case 2:
      fill(0,255,0);
      rect(75,75,350,300);
      break;
    case 3:
      fill(0,0,255);
      rect(75,75,350,300);
      break;
  }
  if (mousePressed)
  {
    prevMouseState = "Pressed";
  }
  else
  {
    prevMouseState = "Released";
  }
}

boolean inRect()
{
  if (mouseX > 100 && mouseX < 300 && mouseY > 413 && mouseY < 438)
  {
    rectColor = 175;
    return true;
  }
  else
  {
    rectColor = 125;
    return false;
  }
}
boolean inCircle() 
{
  int diameter = 75;
  int x = 375;
  int y = 425;
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) 
  {
    circleColor = 175;
    return true;
  }
  else
  {
    circleColor = 125;
    return false;
  }
}
