int xPos = 100;
int yPos = 0;
float fishR = 255;
float fishG = 255;
float fishB = 0;
float bgR = 0;
float bgG = 0;
float bgB = 200;
int mode = 1;
float bubblesX[] = new float[10];
float bubblesY[] = new float[10];
float bubblesWidth[] = new float[10];
float bubblesHeight[] = new float[10];
void setup()
{
  System.out.println("Hello! Left-Click to change the color of your fish. Right-Click to change the color of the background. Use the arrow keys to move!");
  size(500,500);
  background(bgR,bgG,bgB);
  noStroke();
  for (int x = 0; x < 10; x++)
  {
    bubblesX[x] = random(500);
    bubblesY[x] = random(500);
    bubblesWidth[x] = random(10,25);
    bubblesHeight[x] = random(10,25);
    fill(255);
    ellipse(bubblesX[x], bubblesY[x], bubblesWidth[x], bubblesHeight[x]);
  }
}

void draw()
{
  background(bgR,bgG,bgB);
  fill(fishR,fishG,fishB);
  if (keyPressed == true)
  {
    if (key == CODED)
    {
      if (keyCode == UP)
      {
        yPos-=2;
        System.out.println("X: "+xPos+", Y: " + yPos);
      }
      if (keyCode == DOWN)
      {
        yPos+=2;
        System.out.println("X: "+xPos+", Y: " + yPos);

      }
      if (keyCode == LEFT)
      {
        xPos-=2;
        mode = 2;
        System.out.println("X: "+xPos+", Y: " + yPos);
      }
      if (keyCode == RIGHT)
      {
        xPos+=2;
        mode = 1;
        System.out.println("X: "+xPos+", Y: " + yPos);
      }
    }
  }
  if (xPos>500)
  {
    xPos = -200;
  }
  else if (xPos<-200)
  {
    xPos = 500;
  }
  if (yPos>500)
  {
    yPos = -100;
  }
  else if (yPos<-100)
  {
    yPos = 500;
  }
  if (mode == 1)
  {
    triangle(xPos,yPos,xPos+50, yPos+25,xPos, yPos+50);
    ellipse(xPos+100,yPos+25, 100,75);
  }
  else
  {
    triangle(xPos+50,yPos+25,xPos+100,yPos,xPos+100,yPos+50);
    ellipse(xPos,yPos+25,100,75);
  }
  for (int x = 0; x < 10; x++)
  {
    fill(255);
    bubblesY[x]--;
    if ((int)(bubblesY[x])==-50)
    {
      bubblesX[x] = random(500);
      bubblesY[x] = 550;
    }
    ellipse(bubblesX[x], bubblesY[x], bubblesWidth[x], bubblesHeight[x]);
  }
}
void mousePressed()
{
  if (mouseButton == LEFT)
  {
    fishR = random(255);
    fishG = random(255);
    fishB = random(255);
  }
  else if (mouseButton == RIGHT)
  {
    bgR = random(255);
    bgG = random(255);
    bgB = random(255);
  }
}
