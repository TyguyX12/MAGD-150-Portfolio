class weatherEffect
{
  int mode;
  boolean isActive;
  weatherEffect()
  {
    //weatherEffect starts with the lightning effect and is inactive
    mode = 0;
    isActive = false;
  }
  //setMode changes the effect based on the weather mode
  void setMode(int newMode)
  {
    mode = newMode;
  }
  //setActive changes the visibility of the effect
  void setActive(boolean active)
  {
    isActive = active;
  }
  //getActive returns the visibility of the effect
  boolean getActive()
  {
    return isActive;
  }
  //runEffect draws the effect if it is active and determines what it will look like based on the weather mode and effect mode
  void runEffect()
  {
    if (isActive == true)
    {
      switch (mode)
      {
        case 0: //lightning
          stroke(255);
          strokeWeight(25);
          line(100,0,150,50);
          line(150,50,50,150);
          line(50,150,300,300);
          line(300,300,250,400);
          line(250,400,200,500);
          break;
        case 1: //rainbow
          strokeWeight(10);
          stroke(255,0,0);
          noFill();
          curve(0,200,0,100,500,100,500,200);
          stroke(255, 127, 0);
          curve(0,210,0,110,500,110,500,210);
          stroke(255, 255, 0);
          curve(0,220,0,120,500,120,500,220);
          stroke(0, 255, 0);
          curve(0,230,0,130,500,130,500,230);
          stroke(0, 0, 255);
          curve(0,240,0,140,500,140,500,240);
          stroke(127, 0, 255);
          curve(0,250,0,150,500,150,500,250);
          break;
        case 2:  //fire
          fill(255,0,0);
          beginShape();
          vertex(100,450);
          vertex(125,300);
          vertex(175,325);
          vertex(250,250);
          vertex(325,325);
          vertex(375,300);
          vertex(400,450);
          endShape();
          fill(255,255,0);
          beginShape();
          vertex(150,475);
          vertex(135,325);
          vertex(175,350);
          vertex(250,275);
          vertex(325,350);
          vertex(365,325);
          vertex(350,475);
          endShape();
          fill(200,255,0);
          arc(250,500,1000,200,PI,2*PI);
      }
    }
  }
}
