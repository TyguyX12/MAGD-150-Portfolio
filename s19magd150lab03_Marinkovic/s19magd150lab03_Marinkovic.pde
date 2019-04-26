void setup()
{
  size(510,510);
  strokeWeight(50);
}
int r = 0;
int g = 0;
int b = 0;
int x = 0;
int y = 0;
float mode = 0;
float weight = 5;
float constraint = constrain(weight,5,50);
float weightMode = 5;
int everyOther = 0;
void draw()
{
  if (mode == 0)
  {
    grayscaleGradientLeft();
  }
  if (mode == 0.3)
  {
    redGradientDown();
  }
  if (mode == 0.6)
  {
    greenGradientRight();
  }
  if(mode == 1)
  {
    blueGradientUp();
  }
  updateWeight();
}
void grayscaleGradientLeft()
  {
    stroke(r,g,b);
    
    line(x,0,x,height);
    if (everyOther%2 == 0)
    {
      r++;
      g++;
      b++;
    }
    x++;
    everyOther++;
    if (x == 510)
    {
      r = 0;
      g = 0;
      b = 0;
      x = 0;
      y = 0;
      mode = 0.3;
      System.out.println("Hit edge, starting redGradientDown() with a mouse x value of " + mouseX + " and a mouse y value of " + mouseY +".");
    }
  }
  void redGradientDown()
  {
    stroke(r,g,b);
    line(0,y,width,y);
    if (everyOther%2==0)
    {
      r++;
    }
    y++;
    everyOther++;
    if (y == 510)
    {
      r = 0;
      g = 0;
      b = 0;
      x = 510;
      y = 0;
      mode = 0.6;
      System.out.println("Hit edge, starting greenGradientRight() with a mouse x value of " + mouseX + " and a mouse y value of " + mouseY +".");
    }
  }
  void greenGradientRight()
  {
    stroke(r,g,b);
    line(x,0,x,height);
    if (everyOther%2==0)
    {
      g++;
    }
    x--;
    everyOther++;    
    if (x == 0)
    {
      r = 0;
      g = 0;
      b = 0;
      x=0;
      y=510;
      mode = 1;
      System.out.println("Hit edge, starting blueGradientUp() with a mouse x value of " + mouseX + " and a mouse y value of " + mouseY +".");
    }
  }
  void blueGradientUp()
  {
    stroke(r,g,b);
    line(0,y,width,y);
    if (everyOther%2==0)
    {
      b++;
    }
    y--;
    everyOther++;
    if (y == 0)
    {
      r = 0;
      g = 0;
      b = 0;
      mode = 0;
      System.out.println("Hit edge, starting graysclaeGradientLeft() with a mouse x value of " + mouseX + " and a mouse y value of " + mouseY +".");
    }
  }
  void updateWeight()
  {
    push();
    weight += weightMode;
    if (weight == 5)
    {
      weightMode = 2.5;
    }
    if (weight == 50)
    {
      weightMode = -2.5;
    }
    strokeWeight(weight);
    point(mouseX,mouseY);
    pop();
  }
  void mousePressed()
  {
    int rand = (int)(random(8));
    if (rand == 0)
    {
      r = max(r,g,b);
      g = max(r,g,b);
      b = max(r,g,b);
      System.out.println("Cleared the screen and set the color to ("+ r +", "+g+", "+b+").");
    }
    if (rand == 1)
    {
      r = 255 - max(r,g,b);
      g = 255 - max(r,g,b);
      b = 255 - min(r,g,b);
      System.out.println("Cleared the screen and set the color to ("+ r +", "+g+", "+b+").");
    }
    if (rand == 2)
    {
      r = 255 - max(r,g,b);
      g = 255 - min(r,g,b);
      b = 255 - max(r,g,b);
      System.out.println("Cleared the screen and set the color to ("+ r +", "+g+", "+b+").");
    }
    if (rand == 3)
    {
      r = 255 - max(r,g,b);
      g = 255 - min(r,g,b);
      b = 255 - min(r,g,b);
      System.out.println("Cleared the screen and set the color to ("+ r +", "+g+", "+b+").");
    }
    if (rand == 4)
    {
      r = 255 - min(r,g,b);
      g = 255 - max(r,g,b);
      b = 255 - max(r,g,b);
      System.out.println("Cleared the screen and set the color to ("+ r +", "+g+", "+b+").");
    }
    if (rand == 5)
    {
      r = 255 - min(r,g,b);
      g = 255 - max(r,g,b);
      b = 255 - min(r,g,b);
      System.out.println("Cleared the screen and set the color to ("+ r +", "+g+", "+b+").");
    }
    if (rand == 6)
    {
      r = 255 - min(r,g,b);
      g = 255 - min(r,g,b);
      b = 255 - max(r,g,b);
      System.out.println("Cleared the screen and set the color to ("+ r +", "+g+", "+b+").");
    }
    if (rand == 7)
    {
      r = 255 - min(r,g,b);
      g = 255 - min(r,g,b);
      b = 255 - min(r,g,b);
      System.out.println("Cleared the screen and set the color to ("+ r +", "+g+", "+b+").");
    }
    background(r,g,b);
  }
