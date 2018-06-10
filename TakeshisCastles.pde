import ddf.minim.*;
import processing.video.*;

AudioSnippet TankFiring;
AudioSnippet Destruction;
AudioSnippet Gameplay;
AudioSnippet Game;
Minim minim;
int frameNumber=0;
int place=300;
float angle;
int screenHeight = 768;
PFont playerFont,playerFont2;
int screenNumber=1;
Movie myMov;
int x1=0;
int resizeWidth;
static float alpha = 0;

//Logo
layer Logo = new layer();

//Sky frames
layer Sky = new layer();
layer Fire = new layer();

//Mountain Frames
layer Mountains = new layer();
layer Mountains2 = new layer();
layer Mountains3 = new layer();
layer Mountains4  = new layer();
layer Mountains5 = new layer();
layer Mountains6 = new layer();
layer Mountains7 = new layer();
layer Mountains8  = new layer();

//Cloud Frames
layer Clouds = new layer();
layer Clouds2 =  new layer();
layer Clouds3 = new layer();
layer Clouds4 = new layer();
layer Clouds5 = new layer();

//Bird Frames
layer Birds = new layer();
layer Birds1 = new layer();
layer Birds2 = new layer();
layer Birds3 = new layer();
layer Birds4 = new layer();

//Sun Frames
layer Sun = new layer();
layer Moon = new layer();

//Fort Frames
layer Fort = new layer();
layer Fort2 = new layer();
layer Fort3 = new layer();
layer Fort4 = new layer();

//Canon
layer Canon = new layer();
layer Canon2 = new layer();
layer Arm = new layer();
layer Arm2 = new layer();
layer Arm3 = new layer();

//Score
layer ScorePlayer1 = new layer();
layer ScorePlayer2 = new layer();

//Buttons
layer Button1 = new layer();
layer Button2 = new layer();
layer Button4 = new layer();
layer Button5 = new layer();
layer Button6 = new layer();
layer Button7 = new layer();

PImage crash;

int clickValue = 0;
int rateFrame = 2;

float playerAngle1;
float playerAngle2;
float force;
float forceX;
float forceY;
float distanceX;
float distanceY;
float initialY;


int x=0;
int c=100;
int frameCounter=0;
float positionX;
float positionY; 
int counter1=0;
int counter2=0;
int impact=0; //Impact on building

//Turn of the player
int turn=1;

int healthOne=300; //health of player one
int healthTwo=300; //health of player two

class layer{
  int posX;       //Position of the layer
  int posY;
  int changeFactor;
  int velocity;   //Gives the velocity of the layer
  PImage backdrop;//Gives the backdrop of the layer
  
  void drawLayer(int y,int resizeWidth,int loop){
    int x = posX;
    for(int i=0;i<loop;i++){
    backdrop.resize(resizeWidth,0);
    image(backdrop,x,y);
    x = x+backdrop.width;
    }
  }
  void drawMountainIntro(int y,int resizeWidth,int loop){
    int x = posX;
    for(int i=0;i<loop;i++){
    backdrop.resize(resizeWidth,150);
    pushMatrix();
    tint(255,alpha);
    image(backdrop,x,y);
    popMatrix();
    x = x+backdrop.width;
    }
    alpha = alpha + 0.75;
  }
}


void setup(){
  myMov = new Movie(this, "Tutorial.mp4");
  playerFont =  createFont("BebasNeue.otf", 25);
  playerFont2 =  createFont("BebasNeue.otf", 50);
  size(1366,768);
  Mountains.backdrop = loadImage("Mountain.png");
  Mountains.posX = place+50;
  Mountains.changeFactor = 5*rateFrame;
  
  Mountains4.backdrop =  loadImage("mountain2.png");
  Mountains4.posX =place+90;
  Mountains4.changeFactor = 5*rateFrame;
  
  Mountains2.backdrop =  loadImage("mountain2.png");
  Mountains2.posX = place+150;
  Mountains2.changeFactor = 6*rateFrame;
  
  Mountains3.backdrop =  loadImage("mountain3.png");
  Mountains3.posX = place+70;
  Mountains3.changeFactor = 8*rateFrame;
  //Mountains.drawLayer(0,screenHeight-200,resizeWidth,6);
  
  Mountains5.backdrop = loadImage("Mountain.png");
  Mountains5.posX = (place+50)-330;
  Mountains5.changeFactor = 5*rateFrame;
  
  Mountains8.backdrop =  loadImage("mountain2.png");
  Mountains8.posX =(place+90)-330;
  Mountains8.changeFactor = 5*rateFrame;
  
  Mountains6.backdrop =  loadImage("mountain2.png");
  Mountains6.posX = (place+150)-330;
  Mountains6.changeFactor = 6*rateFrame;
  
  Mountains7.backdrop =  loadImage("mountain3.png");
  Mountains7.posX = (place+70)-330;
  Mountains7.changeFactor = 8*rateFrame;
  
  Clouds.backdrop =  loadImage("cloud.png");
  Clouds.posX =30;
  Clouds.changeFactor = 15*rateFrame;
  
  Clouds2.backdrop =  loadImage("cloud.png");
  Clouds2.posX =1000;
  Clouds2.changeFactor = 25*rateFrame;
  
  Clouds3.backdrop =  loadImage("cloud.png");
  Clouds3.posX =2000;
  Clouds3.changeFactor = 15*rateFrame;
  
  Clouds4.backdrop =  loadImage("cloud.png");
  Clouds4.posX =3200;
  Clouds4.changeFactor = 25*rateFrame;
  
  Clouds5.backdrop =  loadImage("cloud.png");
  Clouds5.posX =3400;
  Clouds5.changeFactor = 15*rateFrame;
  
  Birds.backdrop =  loadImage("bird1.png");
  Birds.posX =1000;
  Birds.changeFactor = 10*rateFrame;
  
  Birds1.backdrop =  loadImage("bird1.png");
  Birds1.posX =500;
  Birds1.changeFactor = 10*rateFrame;
  
  Birds2.backdrop =  loadImage("bird1.png");
  Birds2.posX =800;
  Birds2.changeFactor = 10*rateFrame;
  
  Birds3.backdrop =  loadImage("bird1.png");
  Birds3.posX =1500;
  Birds3.changeFactor = 10*rateFrame;
  
  Birds4.backdrop =  loadImage("bird1.png");
  Birds4.posX =2000;
  Birds4.changeFactor = 10*rateFrame;
  
  Sun.backdrop =  loadImage("sun2.png");
  Sun.posX =1000;
  Sun.changeFactor = 3*rateFrame;
  
  //Sky.backdrop =  loadImage("backFinal.png");
  Sky.posX =0;
  Sky.changeFactor = 2*rateFrame;
  
  Moon.backdrop =  loadImage("moon.png");
  Moon.posX =950;
  Moon.changeFactor = 10*rateFrame;
  
  Fort.backdrop =  loadImage("FORT3.png");
  Fort.posX =-100;
  Fort.changeFactor = 15*rateFrame;
  
  Fort2.backdrop =  loadImage("fort4.png");
  Fort2.posX =3000;
  Fort2.changeFactor = 15*rateFrame;
  
    
  Fort3.backdrop =  loadImage("FORT3.png");
  Fort3.posX =300;
  
  Fort4.backdrop =  loadImage("fort4.png");
  Fort4.posX =2750;
  
  Arm.backdrop =  loadImage("arm2.png");
  Arm.posX =275;
  Arm.changeFactor = 15*rateFrame;
  
  Arm2.backdrop =  loadImage("arm2.png");
  Arm2.posX =3400;
  Arm2.changeFactor = 15*rateFrame;
  
  Arm3.backdrop = loadImage("arm4.png");
  Arm3.posX = 3400;
  
  ScorePlayer1.backdrop =  loadImage("score1.png");
  ScorePlayer1.posX =30;
  ScorePlayer1.changeFactor = 0;
  
  ScorePlayer2.backdrop =  loadImage("score1.png");
  ScorePlayer2.posX =width-375;
  ScorePlayer2.changeFactor = 0;
  
  Canon.backdrop =  loadImage("canon.png");
  Canon.posX =180;
  Canon.changeFactor = 15*rateFrame;
  
  Canon2.backdrop =  loadImage("canon2.png");
  Canon2.posX =3300;
  Canon2.changeFactor = 15*rateFrame;
  
  Fire.backdrop = loadImage("fire.gif");
  Fire.posX=-100;
  
  Button1.backdrop = loadImage("play.png");
  Button1.posX = 1050;

  Button2.backdrop = loadImage("how_to.png");
  Button2.posX = 1050;
  
  Button4.backdrop = loadImage("play1.png");
  Button4.posX = 1050;
  
  Button5.backdrop = loadImage("howto1.png");
  Button5.posX = 1050;
  
  Button6.backdrop = loadImage("play_again.png");
  Button6.posX = 570;
  
  Button7.backdrop = loadImage("play_again1.png");
  Button7.posX = 570;
  
  Logo.backdrop = loadImage("logo.png");
  Logo.posX = 165;
  
  positionX = Arm.posX;
  positionY = 475;
  minim = new Minim(this);
  TankFiring = minim.loadSnippet("TankFiring.mp3");
  Destruction = minim.loadSnippet("Explosion.mp3");
  Gameplay = minim.loadSnippet("Gameplay.mp3");
  Gameplay.loop(10);
}


void draw(){
   if(x1 == 2050){
    myMov.stop();
    screenNumber = 1;
    x1=0;
  }

  if(screenNumber==1){
      introScreen();
    }
  else if(screenNumber==2){
      playGame();
   }
  else if(screenNumber==3){
    endGame();
  }
  else if(screenNumber==4){
    howtoplay();
  }
}

void introScreen(){
  background(0,148,255);
  Sun.drawMountainIntro(screenHeight-655,160,1);
  Mountains6.drawMountainIntro(screenHeight-150,resizeWidth,6);
  Mountains5.drawMountainIntro(screenHeight-125,resizeWidth,5);
  Mountains8.drawMountainIntro(screenHeight-130,resizeWidth,5);
  Mountains7.drawMountainIntro(screenHeight-145,resizeWidth,5);
  Clouds.drawLayer(screenHeight-600,300,1);
  Clouds2.drawLayer(screenHeight-600,300,1);
  Clouds3.drawLayer(screenHeight-600,300,1);
  Clouds4.drawLayer(screenHeight-600,300,1);
  Clouds5.drawLayer(screenHeight-600,300,1);
  Canon.drawLayer(screenHeight-75,200,1);
  Canon2.drawLayer(screenHeight-75,200,1);
  Fort3.drawLayer(screenHeight-500,800,1);
  Fort4.drawLayer(screenHeight-500,800,1);
  pushMatrix();
  image(Arm3.backdrop,200,screenHeight-205);
  popMatrix();
  Button1.drawLayer(screenHeight-400,200,1);
  Button2.drawLayer(screenHeight-325,200,1);
  Logo.drawLayer(screenHeight-650,1080,1);
  if(screenNumber==1 && mouseX > 1050 && mouseY > screenHeight-400 && mouseX < 1245 && mouseY < 416) {
    Button4.drawLayer(screenHeight-400,200,1);
  }
  if(screenNumber==1 && mouseX > 1050 && mouseY > screenHeight-325 && mouseX < 1245 && mouseY < 489) {
    Button5.drawLayer(screenHeight-325,200,1);
  }
  
  Gameplay.rewind();
  Gameplay.play();
}

void howtoplay(){
    background(0,148,255);
    myMov.play();
    image(myMov,0,0);
    x1++;
}
void movieEvent(Movie myMov) { 
  myMov.read(); 
} 
int i=0;
void endGame(){
   resizeWidth=400;
  /*endGame Code here*/
  toRight();
  if(i<400)
  i+=10;
  background(0,148,255);
  crash=  loadImage("win.png");
  crash.resize(i, i);
  Mountains4.drawLayer(screenHeight-300,resizeWidth,10);
  Mountains3.drawLayer(screenHeight-150,resizeWidth,10);
  Clouds.drawLayer(screenHeight-600,300,1);
  Clouds2.drawLayer(screenHeight-600,300,1);
  Clouds3.drawLayer(screenHeight-600,300,1);
  Clouds4.drawLayer(screenHeight-600,300,1);
  Clouds5.drawLayer(screenHeight-600,300,1);
  image(crash,width/2-200,height/2-300);
  if(i>360){
    if(healthOne==0){
      textFont(playerFont2);
      fill(254,201,1);
    text("Player 2 wins",570,550);
    Button6.drawLayer(screenHeight-200,220,1);
    if(mouseX > 575 && mouseX < 787 && mouseY > 571 && mouseY < 621){
      Button7.drawLayer(screenHeight-200,220,1);
    }
    }
    else if(healthTwo==0){
      textFont(playerFont2);
      fill(254,201,1);
      text("Player 1 wins",570,550);
      Button6.drawLayer(screenHeight-200,220,1);
      if(mouseX > 575 && mouseX < 787 && mouseY > 571 && mouseY < 621){
        Button7.drawLayer(screenHeight-200,220,1);
    }
    }
  }
}

void playGame(){
  background(0,148,255);
  int resizeWidth=400;
  Sun.drawLayer(screenHeight-655,160,1);
  Mountains2.drawLayer(screenHeight-250,resizeWidth,6);
  Mountains.drawLayer(screenHeight-250,resizeWidth,5);
  Mountains4.drawLayer(screenHeight-300,resizeWidth,5);
  Mountains3.drawLayer(screenHeight-150,resizeWidth,5);
  Clouds.drawLayer(screenHeight-600,300,1);
  Clouds2.drawLayer(screenHeight-600,300,1);
  Clouds3.drawLayer(screenHeight-600,300,1);
  Clouds4.drawLayer(screenHeight-600,300,1);
  Clouds5.drawLayer(screenHeight-600,300,1);
  Birds.drawLayer(screenHeight-200,50,1);
  Birds1.drawLayer(screenHeight-400,50,1);
  Birds2.drawLayer(screenHeight-300,50,1);
  Birds3.drawLayer(screenHeight-600,50,1);
  Birds4.drawLayer(screenHeight-200,50,1);
  
  //text("Turn: " + turn,90,60);
  //text("PositionX: " +positionX,90,70);
  //text("PositionY: " +positionY,90,80);
  //text("Click value: " +clickValue,90,90);
  
  if (turn ==1){
    //Angle for player 1
    pushMatrix();
    translate(Arm.posX, 475);
    playerAngle1 = atan2(mouseY-475, mouseX-Arm.posX);
    //text(playerAngle1,500,500);
    rotate(playerAngle1);
    Arm.backdrop.resize(175,0);
    image(Arm.backdrop,-50,-10);
    popMatrix();
    
    line(Arm.posX,475,mouseX,mouseY);
    
    //Angle for player 2
    pushMatrix();
    translate(Arm2.posX, 475);
    playerAngle2 = atan2((mouseY-475),(mouseX-Arm2.posX));
    rotate(playerAngle2);
    Arm2.backdrop.resize(175,0);
    image(Arm2.backdrop,-50,-10);
    popMatrix();
    
    Canon.drawLayer(screenHeight-315,200,1);
    Canon2.drawLayer(screenHeight-315,200,1);
    Fort.drawLayer(screenHeight-500,800,1);
    Fort2.drawLayer(screenHeight-500,800,1);
    
    ScorePlayer1.drawLayer(screenHeight-750,355,1);
    ScorePlayer2.drawLayer(screenHeight-750,355,1);
    
    if(clickValue==1){
      player1();
    }
    //text("Force X "+(mouseX - Arm.posX),500,300);
    //text("Force Y "+(mouseY - 475),600,300); 
  }
  else if(turn ==2){
    //Angle for player 1
    pushMatrix();
    translate(Arm.posX, 475);
    playerAngle1 = atan2(mouseY-475, mouseX-Arm.posX);
    text(playerAngle1,500,500);
    rotate(playerAngle1);
    Arm.backdrop.resize(175,0);
    image(Arm.backdrop,-50,-10);
    popMatrix();
    
    //Angle for player 2
    pushMatrix();
    translate(Arm2.posX, 475);
    playerAngle2 = atan2((mouseY-475),(mouseX-Arm2.posX));
    rotate(playerAngle2);
    Arm2.backdrop.resize(175,0);
    image(Arm2.backdrop,-50,-10);
    popMatrix();
    line(Arm2.posX,475,mouseX,mouseY);
    
    Canon.drawLayer(screenHeight-315,200,1);
    Canon2.drawLayer(screenHeight-315,200,1);
    Fort.drawLayer(screenHeight-500,800,1);
    Fort2.drawLayer(screenHeight-500,800,1);
    
    ScorePlayer1.drawLayer(screenHeight-750,355,1);
    ScorePlayer2.drawLayer(screenHeight-750,355,1);
    
    if(clickValue==2){
      player2();
    }
    //text("Force X "+(mouseX - Arm2.posX),500,300);
    //text("Force Y "+(mouseY - 475),600,300); 
  }
  
  drawPlayer1score();
  drawPlayer2score();
}

void drawPlayer2score(){
  textFont(playerFont);
  if(turn==2){
    fill(255,106,0);
  }
  else{
    fill(0,0,0);
  }
  text("Player 2",1245,60); 
  pushMatrix();
  fill(0,216,21);
  noStroke();
  rect(1014,73,healthTwo,20,10);
  popMatrix();
  if((healthOne ==0)||(healthTwo ==0)){
    screenNumber=3;
  }
  
}

void drawPlayer1score(){
  textFont(playerFont);
  if(turn==1){
    fill(255,106,0);
  }
  else{
    fill(0,0,0);
  }
   text("Player 1",57,60);
  pushMatrix();
  fill(0,216,21);
  noStroke();
  rect(57,73,healthOne,20,10);
  popMatrix();
  if((healthOne ==0)||(healthTwo ==0)){
    screenNumber=3;
  }
}
void player1(){
      counter1++;
      if(counter1<78)
      toRight();
      else{
      if(impact!=1){
       positionX=positionX+forceX/25;
      }
      if((positionX>890&&positionX<1300)&&(positionY>419&&positionY<768)){
        int randomImage = int(random(1,5));
        Gameplay.rewind();
        Gameplay.play();
        delay(2000);
        crash=  loadImage("Collision\\"+randomImage+".png");
        image(crash,positionX,positionY);
        Destruction.rewind();
        Destruction.play();
        delay(100);
        impact=1;
        turn=2;
        positionX = Arm2.posX;
        positionY = 475;
        clickValue=0;
        counter2=0;
        counter1=0;
        forceX = 0;
        forceY = 0;
        distanceX = 0;
        distanceY = 0;
        initialY = 0;
        healthTwo -= 50;
      }}
      if(impact!=1){
      pushMatrix();
      fill(84,84,84);
      ellipse(positionX,positionY,20,20);
      popMatrix();
      forceY+=2;
      if(forceY<0){
        //if(force
        positionY-=abs(distanceY/6);
        distanceY++;
      }
      else if(forceY >-10 && forceY <15){
      }
      else{
        positionY+=abs(distanceY/6);
        distanceY--;
      }
      }
     if(positionY>=750 && counter1>=78){
      turn=2;
      positionX = Arm2.posX;
      positionY = 475;
      clickValue=0;
      impact=0;
      forceX = 0;
      forceY = 0;
      distanceX = 0;
      distanceY = 0;
      initialY = 0;
      counter2=0;
      counter1=0;
    }
    //text(positionY,500,500);
}

void player2(){
  counter2++;
  if(counter2<78)
  toLeft();
  else{
  if(impact!=2){
   positionX=positionX+forceX/25;
  }
  if((positionX>100&&positionX<490)&&(positionY>421&&positionY<768)){
  int randomImage = int(random(1,5));
  Gameplay.rewind();
  Gameplay.play();
  crash=  loadImage("Collision\\"+randomImage+".png");
  image(crash,positionX,positionY);
  Destruction.rewind();
  Destruction.play();
  delay(100);
    impact=2;
    turn=1;
    positionX = Arm.posX;
    positionY = 475;
    clickValue=0;
    counter1=0;
    counter2=0;
    forceX = 0;
      forceY = 0;
      distanceX = 0;
      distanceY = 0;
      initialY = 0;
      healthOne -= 50;
  }}
  if(impact!=2){
  pushMatrix();
  fill(84,84,84);
  ellipse(positionX,positionY,20,20);
  popMatrix();
  forceY+=2;
  if(forceY<0){
  positionY-=abs(distanceY/6);
  distanceY++;
  }
  else if(forceY >-10 && forceY <15){
  }
  else{
  positionY+=abs(distanceY/6);
  distanceY--;
  }
  }
  if(positionY>=750 && counter2>=78){
    turn=1;
    positionX = Arm.posX;
    positionY = 475;
    clickValue=0;
    counter1=0;
    counter2=0;
    impact=0;
    forceX = 0;
      forceY = 0;
      distanceX = 0;
      distanceY = 0;
      initialY = 0;
  }
}

void mouseClicked(){
  if(turn==1&&clickValue==0&&screenNumber==2){
  clickValue =1;
    TankFiring.rewind();
    TankFiring.play();
  delay(100);
  forceX = mouseX - Arm.posX;
  forceY = mouseY - 475;
  distanceX = forceX;
  distanceY = forceY;
  initialY = forceY;
  }
  if(turn==2&&clickValue==0&&screenNumber==2){
  clickValue =2;
  TankFiring.rewind();
  TankFiring.play();
  forceX = mouseX - Arm2.posX;
  forceY = mouseY - 475;
  distanceX = forceX;
  distanceY = forceY;
  initialY = forceY;
  }
    if(screenNumber==1 && mouseX > 1050 && mouseY > screenHeight-400 && mouseX < 1245 && mouseY < 416) {
    screenNumber = 2;
  }
  if(screenNumber==1 && mouseX > 1050 && mouseY > screenHeight-325 && mouseX < 1245 && mouseY < 489) {
    screenNumber = 4;
  }
  if(screenNumber==1 && mouseX > 1050 && mouseY > screenHeight-250 && mouseX < 1245 && mouseY < 567) {
    screenNumber = 3;
  }
  if(screenNumber==3 && mouseX > 575 && mouseX < 787 && mouseY > 571 && mouseY < 621) {
    screenNumber = 1;
  }
  }

//D - To left
//A - To right

void toLeft(){
    frameCounter++;
    Mountains.posX += Mountains.changeFactor;
    Mountains2.posX += Mountains2.changeFactor;
    Mountains3.posX += Mountains3.changeFactor;
    Mountains4.posX += Mountains4.changeFactor;
    Clouds.posX += Clouds.changeFactor;
    Clouds2.posX += Clouds2.changeFactor;
    Clouds3.posX += Clouds3.changeFactor;
    Clouds4.posX += Clouds4.changeFactor;
    Clouds5.posX += Clouds5.changeFactor;
    Birds.posX += Birds.changeFactor;
    Birds1.posX += Birds.changeFactor;
    Birds2.posX += Birds.changeFactor;
    Birds.posX += Birds.changeFactor;
    Birds4.posX += Birds.changeFactor;
    Sun.posX += Sun.changeFactor;
    Sky.posX += Sky.changeFactor;
    Fort.posX += Fort.changeFactor;
    Fort2.posX += Fort2.changeFactor;
    Canon.posX += Canon.changeFactor;
    Canon2.posX += Canon2.changeFactor;
    Arm.posX += Arm.changeFactor;
    Arm2.posX += Arm2.changeFactor;
    if((frameCounter%4)==0){
        Birds.backdrop =  loadImage("bird1.png");
        Birds1.backdrop =  loadImage("bird1.png");
        Birds2.backdrop =  loadImage("bird1.png");
        Birds3.backdrop =  loadImage("bird1.png");
        Birds4.backdrop =  loadImage("bird1.png");
    }
    else if((frameCounter%4)==1){
        Birds.backdrop =  loadImage("bird2.png");
        Birds1.backdrop =  loadImage("bird2.png");
        Birds2.backdrop =  loadImage("bird2.png");
        Birds3.backdrop =  loadImage("bird2.png");
        Birds4.backdrop =  loadImage("bird2.png");
    }
    else if((frameCounter%4)==2){
        Birds.backdrop =  loadImage("bird3.png");
        Birds1.backdrop =  loadImage("bird3.png");
        Birds2.backdrop =  loadImage("bird3.png");
        Birds3.backdrop =  loadImage("bird3.png");
        Birds4.backdrop =  loadImage("bird3.png");
    }
    else if((frameCounter%4)==3){
        Birds.backdrop =  loadImage("bird4.png");
        Birds1.backdrop =  loadImage("bird4.png");
        Birds2.backdrop =  loadImage("bird4.png");
        Birds3.backdrop =  loadImage("bird4.png");
        Birds4.backdrop =  loadImage("bird4.png");
    }
}

void toRight(){
  if(frameCounter!=0)
    frameCounter--;
    Mountains.posX -= Mountains.changeFactor;
    Mountains2.posX -= Mountains2.changeFactor;
    Mountains3.posX -= Mountains3.changeFactor;
    Mountains4.posX -= Mountains4.changeFactor;
    Clouds.posX -= Clouds.changeFactor;
    Clouds2.posX -= Clouds2.changeFactor;
    Clouds3.posX -= Clouds3.changeFactor;
    Clouds4.posX -= Clouds4.changeFactor;
    Clouds5.posX -= Clouds5.changeFactor;
    Birds.posX -= Birds.changeFactor;
    Birds1.posX -= Birds.changeFactor;
    Birds2.posX -= Birds.changeFactor;
    Birds3.posX -= Birds.changeFactor;
    Birds4.posX -= Birds.changeFactor;
    Sun.posX -= Sun.changeFactor;
    Fort.posX -= Fort.changeFactor;
    Fort2.posX -= Fort2.changeFactor;
    Canon.posX -= Canon.changeFactor;
    Canon2.posX -= Canon2.changeFactor;
    Arm.posX -= Arm.changeFactor;
    Arm2.posX -= Arm2.changeFactor;
    
    if((frameCounter%4)==0){
        Birds.backdrop =  loadImage("bird1.png");
        Birds1.backdrop =  loadImage("bird1.png");
        Birds2.backdrop =  loadImage("bird1.png");
        Birds3.backdrop =  loadImage("bird1.png");
        Birds4.backdrop =  loadImage("bird1.png");
    }
    else if((frameCounter%4)==1){
        Birds.backdrop =  loadImage("bird2.png");
        Birds1.backdrop =  loadImage("bird2.png");
        Birds2.backdrop =  loadImage("bird2.png");
        Birds3.backdrop =  loadImage("bird2.png");
        Birds4.backdrop =  loadImage("bird2.png");
    }
    else if((frameCounter%4)==2){
        Birds.backdrop =  loadImage("bird3.png");
        Birds1.backdrop =  loadImage("bird3.png");
        Birds2.backdrop =  loadImage("bird3.png");
        Birds3.backdrop =  loadImage("bird3.png");
        Birds4.backdrop =  loadImage("bird3.png");
    }
    else if((frameCounter%4)==3){
        Birds.backdrop =  loadImage("bird4.png");
        Birds1.backdrop =  loadImage("bird4.png");
        Birds2.backdrop =  loadImage("bird4.png");
        Birds3.backdrop =  loadImage("bird4.png");
        Birds4.backdrop =  loadImage("bird4.png");
    }
    Sky.posX -= Sky.changeFactor;
}

void stop()
{
  Destruction.close();
  Gameplay.close();
  TankFiring.close();
  minim.stop();
  super.stop();
}


void keyPressed(){
  if(key == 'D'||key=='d'){
  toRight();
  }
  if(key == 'A'||key=='a'){
  toLeft();
  }
}