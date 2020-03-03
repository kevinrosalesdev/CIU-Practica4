//import gifAnimation.*;

float blink = 0.0;
boolean increase = false;
Controller controller;
PFont font;
String randomPlanetarySystemTitle;

//GifMaker ficherogif;
//int frameCounter;


void setup(){
  size(800, 700, P3D);
  noStroke();
  font = loadFont("GillSansMT-Condensed-48.vlw");
  randomPlanetarySystemTitle = createName();
  controller = new Controller(font);
  controller.createPlanets();
  controller.createMoons();
  
  //ficherogif = new GifMaker(this, "animation.gif");
  //ficherogif.setRepeat(0);
  //ficherogif.addFrame();
  //frameCounter = 0;
}

void draw(){
  //frameCounter++;
  //if(frameCounter == 10){
  //  ficherogif.addFrame();
  //  frameCounter = 0;
  //}
  
  controller.setBackground();
  
  //drawTitle();
  
  translate(width/2, height/2, -100);
  rotateY(radians(-45));
  
  camera(controller.ship.eyeX, controller.ship.eyeY, controller.ship.eyeZ,
         controller.ship.centerX, controller.ship.centerY, controller.ship.centerZ,
         controller.ship.upX, controller.ship.upY, controller.ship.upZ);
  
  fill(255,255,0);
  controller.drawSun();
  controller.drawShip();
  controller.drawAllPlanets();
  controller.drawAllMoons();
  


}

void drawTitle(){
  pushMatrix();
  fill(255, 255, 0, blink());
  textAlign(CENTER);
  textFont(font, 20);
  text("Mapa del Sistema Planetario:", 0.5*width, 0.1*height);
  textFont(font, 35);
  text(randomPlanetarySystemTitle, 0.5*width, 0.15*height);
  fill(255, 0, 0);
  textFont(font, 25);
  text("¡Mueva el ratón para rotar el Sistema Planetario!", 0.5*width, 0.2*height);
  popMatrix();
}

float blink(){
  if (increase) blink += 5;
  else blink -= 5 ;
  if (blink >= 500) increase = false;
  if (blink <= 0) increase = true;
  return blink;
}
