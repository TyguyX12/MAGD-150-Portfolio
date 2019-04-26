import processing.pdf.*;

String[] strings;                                    //Strings contains all of the text in Motivational.txt
int bgH, targetBgH;                                  //The desired and current Hue of the background
PFont Himalaya, Onyx, TWCenMT;                       //The three chosen fonts to display
void setup()
{
  println("Click to save PDF");
  beginRecord(PDF, "MotivationalImage.pdf");        //starts recording to make pdf
  //printArray(PFont.list());
  Himalaya = createFont("Microsoft Himalaya",16);   //creates three fonts
  Onyx = createFont("Onyx",16);
  TWCenMT = createFont("Tw Cen MT",16);
  colorMode(HSB);                                   //sets color mode to HSB
  bgH = round(random(255));                         //sets initial bg color and size
  size(500,500);
  background(bgH,255,255);
  strings = loadStrings("motivational.txt");        //loads text from txt file to strings array
}
int transparency = 0;                               //text starts off invisible
boolean transparencyIncrease = true;                //text starts off increasing in opacity
int textX, textY;                                   //Position of text
String textToShow;                                  //Random text from strings displayed
int rand;                                           //Random variable
void draw()
{
  changeBg();                                       //Calls method to change bg each frame
  changeText();                                     //Calls method to change text each frame
}
void changeBg()
{
    if(bgH == targetBgH)                            //changes target bg hue when current bg hue is the same as the current target
    {
      targetBgH = round(random(255));
    }
    if (bgH > targetBgH)                            //moves the current bg hue to be closer to the target bg hue
    {
      bgH--;
    }
    else if (bgH < targetBgH)
    {
      bgH++;
    }
    
    background(bgH,255,255);                        //sets bg
}
void changeText()
{
  fill(0,transparency);                             //sets text to be black with transparency set in this method
  if (transparency == 0)
  {
    rand = round(random(3));                        //when text is made invisible, it changes to be a different font, font size, different area, and a random different text
    if (rand == 0)
    {
      textFont(Himalaya,round(random(32)+16));
    }
    else if (rand == 1)
    {
      textFont(Onyx,round(random(32)+16));
    }
    if (rand == 2)
    {
      textFont(TWCenMT,round(random(32))+16);
    }
    textToShow = strings[round(random(strings.length-1))];
    transparencyIncrease=true;                     //increases transparency when it reaches 0
    textX = round(random(500-textWidth(textToShow)));
    textY = round(random(500));
  }
  if (transparency == 255)
  { 
    transparencyIncrease=false;                    //decreases transparency when it reaches 255
  }
  if (transparencyIncrease == true)
  {
    transparency+=5;                               
  }
  else
  {
    transparency-=5;
  }
  textAlign(LEFT);                                //text align is set to left so that left and right can be easily calculated
  text(textToShow,textX,textY);
}
void mousePressed()
{
  endRecord();                                    //saves pdf
  println("Saved pdf!");
}
