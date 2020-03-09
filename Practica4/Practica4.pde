//import gifAnimation.*;

float blink = 0.0;
boolean increase = false;
boolean cameraMode = false;
Controller controller;
PFont font;
String randomPlanetarySystemTitle;

//GifMaker ficherogif;
//int frameCounter;


void setup() {
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

void draw() {
  //frameCounter++;
  //if(frameCounter == 10){
    //ficherogif.addFrame();
    //frameCounter = 0;
  //}

  controller.setBackground();

  translate(width/2, height/2, 0);

  if (cameraMode) {
    controller.cameraManager();
    camera(controller.ship.eyeX, controller.ship.eyeY, controller.ship.eyeZ, 
            controller.ship.centerX, controller.ship.centerY, controller.ship.centerZ, 
            sin(radians(controller.ship.degree)), cos(radians(controller.ship.degree)), 0);
  } else {
    resetMatrix();
    translate(0, 0, -800);
    drawTitleAndControls();
    rotateX(radians((-mouseY*90/height)+45));
    rotateY(radians((mouseX*90/width)-45));
    controller.drawShip();
  }
  
  controller.drawSun();
  controller.drawAllPlanets();
  controller.drawAllMoons();
}

void drawTitleAndControls() {
  pushMatrix();
  translate(-400, -300, 300);
  fill(255, 255, 0, blink());
  textAlign(CENTER);
  textFont(font, 20);
  text("Mapa del Sistema Planetario:", 0.5*width, 0.1*height);
  textFont(font, 35);
  text(randomPlanetarySystemTitle, 0.5*width, 0.15*height);
  textFont(font, 15);
  text("¡Mueva el ratón para rotar el Sistema Planetario!", 0.5*width, 0.2*height);
  fill(100, 0, 255);
  rect(0.35*width, 0.65*height, 237.5, 125);
  fill(255, 255, 0);
  textFont(font, 25);
  text("CONTROLES", 0.5*width, 0.7*height);
  textFont(font, 20);
  text("Alternar entre vista general/nave: ENTER", 0.5*width, 0.74*height);
  fill(230, 230, 0);
  textFont(font, 17.5);
  text("Zoom (mover nave): flecha arriba/flecha abajo", 0.5*width, 0.77*height);
  text("Mover cámara: A/W/S/D", 0.5*width, 0.79*height);
  text("Rotar nave: Q/E", 0.5*width, 0.81*height);
  popMatrix();
}

float blink() {
  if (increase) blink += 5;
  else blink -= 5 ;
  if (blink >= 500) increase = false;
  if (blink <= 0) increase = true;
  return blink;
}

void keyPressed() {
  if (key == 'd' || key == 'D') controller.moveRight = true;
  if (key == 'a' || key == 'A') controller.moveLeft = true; 
  if (key == 'w' || key == 'W') controller.moveUp = true;
  if (key == 's' || key == 'S') controller.moveDown = true;
  if (key == 'q' || key == 'Q') controller.rotateLeft = true;
  if (key == 'e' || key == 'E') controller.rotateRight = true;
  if (key == CODED && keyCode == UP) {
    controller.zoomIn = true;
    controller.zoomOut = false;  
  }
  if (key == CODED && keyCode == DOWN) {
    controller.zoomIn = false;
    controller.zoomOut = true;
  }
  if (key == ENTER || key == RETURN) {
    cameraMode = !cameraMode;
    controller.setCameraMode(cameraMode);
    if (cameraMode) beginCamera(); 
    else endCamera();
  }
}

void keyReleased() {
  if (key == 'd' || key == 'D') controller.moveRight = false;
  if (key == 'a' || key == 'A') controller.moveLeft = false;
  if (key == 'w' || key == 'W') controller.moveUp = false;
  if (key == 's' || key == 'S') controller.moveDown = false;
  if (key == 'q' || key == 'Q') controller.rotateLeft = false;
  if (key == 'e' || key == 'E') controller.rotateRight = false;
    if (key == CODED && keyCode == UP) {
    controller.zoomIn = false;  
  }
  if (key == CODED && keyCode == DOWN) {
    controller.zoomOut = false;
  }
}
