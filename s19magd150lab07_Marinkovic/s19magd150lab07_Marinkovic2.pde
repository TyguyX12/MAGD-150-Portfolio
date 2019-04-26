void setup()
{
  rectMode(CENTER);
  ellipseMode(CENTER);
  size(500,500);
  background(0,0,255);
  println("Click to test if all spokes are equidistant, of equal lengths, and have the same angle between them.");
}
//An array of spoke objects allows easy access to all items of the spoke class, which creates the ellipses and lines to the center of the screen.
Spoke[] spokes = new Spoke[]{
new Spoke(new PVector(-150,-150)),
new Spoke(new PVector(-212.13203,0)),
new Spoke(new PVector(-150,150)),
new Spoke(new PVector(0,212.13203)),
new Spoke(new PVector(150,150)),
new Spoke(new PVector(212.13203, 0)),
new Spoke(new PVector(150,-150)),
new Spoke(new PVector(0,-212.13203)),
};

//The wheel and center colors are random on startup and provide variation with each run.
int wheelR = round(random(255)), wheelG = round(random(255)), wheelB = round(random(255));
int centerR = round(random(255)), centerG = round(random(255)), centerB = round(random(255));


void draw()
{
  //sky colored background
  background(0,255,255);
  //the base of the wheel is colored with wheelR, wheelG, and wheelB, and is made of a triangle.
  fill(wheelR, wheelG,wheelB);
  beginShape();
    vertex(width/4,height);
    vertex(width/2,height/2);
    vertex(3*width/4,height);
  endShape();
  
  //updateSpoke is called for each spoke, which makes them move
  for(int x = 0; x < 8; x++)
  {
    spokes[x].updateSpoke();
  }
  
  //The center of the wheel is created on top of everything else with the centerR, centerG, and centerB colors assigned on startup.
  fill(centerR,centerG,centerB);
  ellipse(250,250,100,100); 
}


//When the mouse is pressed, information is displayed about the distance between spokes, magnitude of spokes, and the angle between the spokes. This allowed me to troubleshoot the spokes not being uniform.
void mousePressed()
{
  println("Information check");
  for(int x = 0; x < 7; x++)
  {
    println("Distance between spoke " + x + " and spoke " + (x+1) + " = " + PVector.dist(spokes[x].getPVector(),spokes[x+1].getPVector()));
  }
  println("Distance between spoke 7 and spoke 0 = " + PVector.dist(spokes[7].getPVector(),spokes[0].getPVector()));
  
  for(int x = 0; x < 7; x++)
  {
    println("Magnitude of spoke " + x + " = " + spokes[x].getPVector().mag());
  }
  
  for(int x = 0; x < 7; x++)
  {
    println("Angle between spoke " + x + " and spoke " + (x+1) + " = " + PVector.angleBetween(spokes[x].getPVector(),spokes[x+1].getPVector()));
  }
  println("Angle between spoke 7 and spoke 0 = " + PVector.angleBetween(spokes[7].getPVector(),spokes[0].getPVector()));

}
