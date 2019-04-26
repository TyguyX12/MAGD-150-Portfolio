size(256,256);
colorMode(RGB,255,255,255);            //rgb color mode for background & strings
background(125,255,255);               //sky blue sky

fill(#00FF00); //green grass     
noStroke();                       //green outline of grass
arc(128,300,500,200,PI,2*PI);          //arc making horizon
   
//3 black balloon strings    
stroke(0,0,0);                         //baloon strings = black
noFill();                                 
bezier(58,194,110,110,21,175,43,121);  //string 1
bezier(99,90,70,140,149,119,143,179);  //string 2
bezier(168,182,243,203,176,89,217,98); //string 3

colorMode(HSB,360,100,100,100);        //hsb color mode for balloons
fill(100,100,100,75);                  //1st balloon is slightly transparent and green
stroke(100,100,50,75);                 //balloon outline is darker than rest of balloon
beginShape();                          //1st baloon is pentagonal
vertex(40, 85);
vertex(65,100);
vertex(55,130);
vertex(25,125);
vertex(15,100);
endShape(CLOSE);                        //end of 1st balloon

fill(200,100,100,75);                   //2nd balloon is slightly transparent and blue
stroke(200,100,50,75);                  //balloon outline is darker than rest of balloon
ellipse(100,75,35,50);                  //2nd baloon is an ellipse

fill(300,100,100,75);                   //3rd balloon is slightly transparent and purple
stroke(300,100,50,75);                  //balloon outline is darker than rest of balloon
quad(195,65,235,85,225,125,185,115);    //balloon outline is darker than rest of balloon
