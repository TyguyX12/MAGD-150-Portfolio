class Spoke
{ 
  //Spokes are created with a position, scaling makes the size change slightly over time, the scalingInc allows it to both grow and shrink, and the colors are randomized on startup.
  PVector position;
  float scalingInc = 0.01, scaling = 1, rInc = 1, gInc = 1, bInc = 1;
  int r = round(random(255)), g = round(random(255)), b = round(random(255));
  Spoke(PVector p)
  {
    position = p;
  }
  
  //updateSpoke handles all movement and scaling
  void updateSpoke()
  {
    //the matrix is pushed so that each spoke may have its own position and rotation information
    pushMatrix();
      //the shape is centered on the program so that everything rotates around the center, it is rotated slightly each frame.
      translate(width/2, height/2);
      rotate(radians(frameCount));
      
      //updateScaling changes the size of the spokes each frame for added movement
      updateScaling();
      
      //the line connecting the center and the ellipse is created.
      line(0,0,position.x,position.y);
      
      //updateColoring updates the colors slightly each frame.
      updateColoring();
      
      //finally, the ellipse is drawn in position.
      ellipse(position.x,position.y,50,50);
    popMatrix();
   
  }
  void updateScaling()
  {
    //the image is scaled up or down 1/10th of a percentage each frame
    scaling = scaling + scalingInc;
    scale(scaling);
    
    //if the image is at 110% size, the image will start to shrink
    if (scaling >= 1.1)
    {
      scalingInc = -0.001;
    }
    //if the image is at 90% size, the image will start to shrink
    else if (scaling <= 0.90)
    {
      scalingInc = 0.001;
    }
  }
  void updateColoring()
  {
     //updateColoring makes each color go up or down each frame. Like the scalingInc, if the color hits 0 or 255, the increment will change to be positive or negative, respectively.
     if (r == 255)
     {
       rInc = -1;
     }
     if (r == 0)
     {
       rInc = 1;
     }
     if (g == 255)
     {
       gInc = -1;
     }
     if (g == 0)
     {
       gInc = 1;
     }
    if (b == 255)
     {
       bInc = -1;
     }
     if (b == 0)
     {
       bInc = 1;
     }
     r+=rInc;
     g+=gInc;
     b+=bInc;
     fill(r,g,b);
  }
  //getPVector returns the PVector of the spoke for troubleshooting
  PVector getPVector()
  {
    return new PVector(position.x, position.y);
  }
}
