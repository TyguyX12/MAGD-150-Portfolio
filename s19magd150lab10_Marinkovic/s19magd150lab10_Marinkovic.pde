float meshedBoxX, meshedBoxY, meshedBoxZ, meshedBoxXRotation, meshedBoxYRotation, meshedBoxScale;
float sphereX, sphereY, sphereZ, sphereR, sphereXRotation, sphereYRotation;
float boxX, boxY, boxZ, boxW,boxH,boxD, boxXRotation, boxYRotation;
float ambientLightH, targetAmbientLightH;
float pointLightH,targetPointLightH,pointLightX,targetPointLightX,pointLightY,targetPointLightY;
float bgH,targetBgH;
float eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ;
PImage beeImage;
void setup()
{
  colorMode(HSB);
  surface.setResizable(true);
  pixelDensity(displayDensity());
  noStroke();
  size(500,500,P3D);
  
  //Variables for the meshed box's x, y, z, size, and rotations are set
  meshedBoxX = width / 2.0;
  meshedBoxY = height / 2.0;
  meshedBoxZ = -500;
  meshedBoxScale = min(width, height) / 4.0;
  meshedBoxXRotation = 0;
  meshedBoxYRotation = 0;
  
  //Variables for the unmeshed box's x, y, z, width, height, depth, and rotations are set
  boxX = width + width/2;
  boxY = height / 2.0;
  boxZ = -500;
  boxW = 200;
  boxH = 150;
  boxD = 125;
  boxXRotation = 0;
  boxYRotation = 0;
  
  //Variables for the sphere's x, y, z, and radius, are set
  sphereX= -width / 2;
  sphereY = height / 2.0;
  sphereZ = -500;
  sphereR = min(width, height) / 4.0;
  
  //The texture mode and textures are loaded and properly sized
  textureMode(NORMAL);
  textureWrap(REPEAT);
  beeImage = loadImage("bee.tif");
  beeImage.resize(round(meshedBoxScale),round(meshedBoxScale));
  
  //Variables for the camera are set
  eyeX = width/2.0;
  eyeY = height/2.0; 
  eyeZ = (height/2.0) / tan(PI*30.0 / 180.0);
  centerX = width/2.0; 
  centerY = height / 2.0;
  centerZ = 0;
  upX = 0;
  upY = 1;
  upZ = 0;
  camera(eyeX,eyeY,eyeZ,centerX,centerY,centerZ,upX,upY,upZ);
}
void draw()
{
  changeBg();                //ChangeBg changes the background color
  changeAmbientLight();      //ChangeAmbientLight changes the ambient light color
  changePointLight();        //ChangePointLight changes the point light color and location
  boxMovement();             //BoxMovement controls the unmeshed box's location and rotation
  sphereMovement();          //SphereMovement controls the sphere's location and rotation
  meshedBoxMovement();       //MeshedBoxMovement controls the meshed box's location and rotation
}
void boxMovement()
{
  pushMatrix();
  moveBox();                //moveBox shifts the box's x coordinate and moves it to the left when it hits the right side of the screen
  rotateBox();              //rotateBox rotates the box each frame
  drawBox();                //drawBox finalizes the location and draws it
  popMatrix();
}
void drawBox()
{
  translate(boxX,boxY,boxZ);
  rotateY(boxYRotation);
  rotateX(boxXRotation);
  box(boxW,boxH,boxD);
}
void rotateBox()
{
  boxXRotation+=0.02;
  boxYRotation+=0.01;
}
void moveBox()
{
  boxX++;
  if (boxX>1000)
  {
    boxX = -500;
  }
}
void sphereMovement()
{
  pushMatrix();
  sphereX++;
  if (sphereX>1000)
  {
    sphereX = -500;
  }
  translate(sphereX,sphereY,sphereZ);
  sphere(sphereR);
  popMatrix();
}
void meshedBoxMovement()
{
  pushMatrix();
  rotateMeshedBox();    //moveMeshedBox shifts the meshed box's x coordinate and moves it to the left when it hits the right side of the screen
  moveMeshedBox();      //rotateMeshedBox rotates the meshed box each frame
  drawMeshedBox();      //drawMeshedBox finalizes the location and draws it, applying the mesh and texture
  popMatrix();
}
void moveMeshedBox()
{
  meshedBoxX++;
  if (meshedBoxX>1000)
  {
    meshedBoxX = -500;
  }
}

void rotateMeshedBox()
{
  meshedBoxXRotation+=0.01;
  meshedBoxYRotation+=0.02;
}
void drawMeshedBox()
{
  translate(meshedBoxX, meshedBoxY, meshedBoxZ);
  rotateY(meshedBoxYRotation);
  rotateX(meshedBoxXRotation);
  scale(meshedBoxScale);

  beginShape();

  texture(beeImage);
  vertex(-1, -1, 1,0,0);
  vertex(1, -1, 1,1,0);
  vertex(1, 1, 1,1,1);
  vertex(-1, 1, 1,0,1);
  endShape(CLOSE);

  beginShape();
  texture(beeImage);
  vertex(1, -1, 1,0,0);
  vertex(1, -1, -1,1,0);
  vertex(1, 1, -1,1,1);
  vertex(1, 1, 1,0,1);
  endShape(CLOSE);

  beginShape();
  texture(beeImage);
  vertex(1, -1, -1,0,0);
  vertex(-1, -1, -1,1,0);
  vertex(-1, 1, -1,1,1); 
  vertex(1, 1, -1,0,1);
  endShape(CLOSE);

  beginShape();
  texture(beeImage);
  vertex(-1, -1, -1,0,0);
  vertex(-1, -1, 1,1,0);
  vertex(-1, 1, 1,1,1);
  vertex(-1, 1, -1,0,1);
  endShape(CLOSE);

  beginShape();
  texture(beeImage);
  vertex(-1, 1, 1,0,0);
  vertex(1, 1, 1,1,0);
  vertex(1, 1, -1,1,1);
  vertex(-1, 1, -1,0,1);
  endShape(CLOSE);

  beginShape();
  texture(beeImage);
  vertex(-1, -1, -1,0,0);
  vertex(1, -1, -1,1,0);
  vertex(1, -1, 1,1,1);
  vertex(-1, -1, 1,0,1);
  endShape(CLOSE);  
}
void changePointLight()
{
    if(pointLightH == targetPointLightH)                            
    {
      targetPointLightH = round(random(255));
    }
    if (pointLightH > targetPointLightH)                          
    {
      pointLightH--;
    }
    else if (pointLightH < targetPointLightH)
    {
      pointLightH++;
    }
    
    if(pointLightX == targetPointLightX)                            
    {
      targetPointLightX = round(random(255));
    }
    if (pointLightX > targetPointLightX)                          
    {
      pointLightX--;
    }
    else if (pointLightX < targetPointLightX)
    {
      pointLightX++;
    }
    
    if(pointLightY == targetPointLightY)                            
    {
      targetPointLightY = round(random(255));
    }
    if (pointLightY > targetPointLightY)                          
    {
      pointLightY--;
    }
    else if (pointLightY < targetPointLightY)
    {
      pointLightY++;
    }
    pointLight(pointLightH,255,255,pointLightX,pointLightY,0);
}
void changeAmbientLight()
{
    if(ambientLightH == targetAmbientLightH)                           
    {
      targetAmbientLightH = round(random(255));
    }
    if (ambientLightH > targetAmbientLightH)                           
    {
      ambientLightH--;
    }
    else if (ambientLightH < targetAmbientLightH)
    {
      ambientLightH++;
    }
    ambientLight(ambientLightH,255,50);             
}
void changeBg()
{
    if(bgH == targetBgH)                           
    {
      targetBgH = round(random(255));
    }
    if (bgH > targetBgH)                            
    {
      bgH--;
    }
    else if (bgH < targetBgH)
    {
      bgH++;
    }
    
    background(bgH,255,100);                 
}
void mousePressed()
{
  //Clicking the mouse zooms in and out the camera at the center of the screen
  if (eyeZ != 1)
  {
    eyeZ = 1;
  }
  else
  {
    eyeZ = (height/2.0) / tan(PI*30.0 / 180.0);
  }
  camera(eyeX,eyeY,eyeZ,centerX,centerY,centerZ,upX,upY,upZ);
}
