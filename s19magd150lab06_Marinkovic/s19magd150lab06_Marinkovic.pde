int weather = 0;
weatherEffect effect = new weatherEffect();
boolean prevKeyDown = true;
void setup()
{
  println("Click to activate/deactivate weather effect. Press the left/right arrow keys to change the weather");
  size(500,500);
  background(155);
  //background is set up to be the gray skies for the rainy weather.
}
void draw()
{
  drawWeather(); //drawWeather is the method that sets the background color, the color of the ground, and whether or not it is raining
  if (keyPressed == true)
  {
    effect.setActive(false); //changing the weather mode always turns off the weather effect
    if (key == CODED)
    {
      if (keyCode == LEFT && prevKeyDown == false)
      {
        //weather mode changes depending on what key is pressed and what the current weather mode is
        if (weather == 0)
        {
          weather = 2;
          println("Setting WeatherMode to " + weather);
        }
        else
        {
          weather--;
          println("Setting WeatherMode to " + weather);
        }
      }
      if (keyCode == RIGHT && prevKeyDown == false)
      {
        if (weather == 2)
        {
          weather = 0;
          println("Setting WeatherMode to " + weather);
        }
        else
        {
          weather++;
          println("Setting WeatherMode to " + weather);
        }
      }
    }
  prevKeyDown = true; //prevKeyDown prevents the app from changing the weather rapidly while a key is held
  }
  else
  {
    prevKeyDown = false;
  }
  effect.setMode(weather); //the effect's mode is coordinated with the weather mode
}
void drawWeather()
{
  noStroke();
  switch (weather)
  {
   //drawWeather changes background depending on weather mode
  case 0: //rainy
    background(155);
    noStroke();
    fill(150,255,150);
    arc(250,500,1000,200,PI,2*PI); 
    fill(0,0,100);
    for (int x = 0; x < 100; x++)
    {
      ellipse(random(500),random(500),5,5);
    }
  break;
  case 1: //sunny
    background(0,255,255);
    fill(0,255,0);
    arc(250,500,1000,200,PI,2*PI);        
    break;
  case 2: //hot
    background(255,150,0);
    fill(200,255,0);
    arc(250,500,1000,200,PI,2*PI); 
    break;
  }
  //the effect is ran no matter what, whether or not it shows up is dependent on a boolean called isActive
  effect.runEffect();
}
void mousePressed()
{
  //pressing the mouse changes the isActive boolean on the effect
  if (effect.getActive() == true)
  {
    effect.setActive(false);
  }
  else
  {
    effect.setActive(true);
  }
      println("Changing WeatherEffectIsOn to " + effect.getActive());
}
