import processing.sound.*;
import processing.video.*;

SoundFile beeNoise;  //BeeNoise is the audio file of the bee's wings
Movie beeVideo;      //BeeVideo is the mov file of the bee
float beeNoiseVolume;//beeNoiseVolume holds the amplitude of the BeeNoise so that it may be more easily manipulated 
PImage recording;    //Recording is the image that is the frame

void setup()
{
  size(500,500);
  background(255,0,0);
  
  beeNoise = new SoundFile(this, "beeSound.wav");
  beeVideo = new Movie(this, "beeVideo.mov");        //BeeNoise and BeeVideo are set to the wav and mov files
  
  beeNoise.loop();
  beeNoise.amp(0);
  beeVideo.loop();                                   //BeeNoise and beeVideo both loop, the beeVideo starts off silent
    
  recording = loadImage("cameraTransparent.png");    //The frame is set to the png file
  recording.resize(500,500);                         //The frame is resized to fit the screen
}
void movieEvent(Movie beeVideo) 
{
  beeVideo.read();
}
void draw()
{
  image(beeVideo, 0, 0,500,500);        
  image(recording,0,0);              //The BeeVideo and Frame are both drawn
  
  if (beeVideo.time() < 3)           //The BeeNoise fades in when the video begins
  {
    beeNoiseVolume = beeVideo.time()/3;
    beeNoise.amp(beeNoiseVolume);
  }
  if (beeVideo.time() > 6)          //The BeeNoise fades out when the video ends
  {
    beeNoiseVolume = beeNoiseVolume - 0.01;
    beeNoise.amp(beeNoiseVolume);
  }
}
void mousePressed()
{
  save("bee.tif");
}
