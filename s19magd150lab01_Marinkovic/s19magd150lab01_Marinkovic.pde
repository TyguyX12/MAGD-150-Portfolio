size(256,256);
background(0); //black for space

fill(255);                 //moon = white
ellipse(200,50,50,50);     //draw moon

noStroke();                //darkness of moon has no outline
fill(0);                   //darkness of moon = bg color
ellipse(215,50,50,50);     //darkness of moon

stroke(255);               //stars = white
strokeWeight(5);           //thickness of stars 
point(25,25);              //six stars in the sky
point(36,100);
point(100,46);
point(107,100);
point(150,125);
point(186,100);

noStroke();
fill(40);                  //color of background buildings
rect(30,175,20,200);       //8 buildings in background
rect(50,150,20,200);
rect(70,160,20,200);
rect(90,180,20,200);
rect(170,150,20,200);
rect(190,170,20,200);
rect(210,160,20,200);
rect(230,185,20,200);

strokeWeight(1);           //thin stroke
stroke(255);               //white planet outline
fill(0);                   //planet is black on inside
ellipse(127,450,750,500);  //planet

strokeWeight(5);           //thicker stroke
fill(255);                 //head is white
ellipse(127,150,30,30);    //head drawing

strokeCap(ROUND);          //rounded lines
rect(126,167,3,33);        //body
line(105,195,127,175);     //left arm
line(127,175,149,195);     //right arm

line(127,200,105,230);     //left leg
line(127,200,149,230);     //right leg
