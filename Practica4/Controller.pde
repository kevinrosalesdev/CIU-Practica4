class Controller{
  
  MyShip ship;
  MySphere sun;
  ArrayList<MySphere> planetList;
  ArrayList<MySphere> moonList;
  PFont font;
  
  boolean cameraMode, rotateRight, rotateLeft, zoomIn, zoomOut, moveUp, moveDown, moveRight, moveLeft;
  
  Controller(PFont font){
    this.sun = new MySphere(75.0, loadImage("sun/2k_sun-compressor.jpg"), 0, 0, 0, 0.1);
    this.ship = new MyShip(loadShape("ship/10475_Rocket_Ship_v1_L3.obj"), loadImage("ship/10475_Rocket_Ship_v1_Diffuse.jpg"), 0, 0, 750, 0, 0, 0, 0);
    this.planetList = new ArrayList<MySphere>();
    this.moonList = new ArrayList<MySphere>();
    this.font = font;
    this.rotateRight = false;
    this.rotateLeft = false;
    this.zoomIn = false;
    this.zoomOut = false;
    this.moveUp = false;
    this.moveDown = false;
    this.moveRight = false;
    this.moveLeft = false;
  }
  
  void createPlanets(){
    planetList.add(new MySphere(15.0, loadImage("planets/Volcanic-compressor.png"), -0.3, 0.1, 0.45, 2.1));
    planetList.add(new MySphere(10.0, loadImage("planets/Martian-compressor.png"), 0.4, 0, -0.55, 2.0));
    planetList.add(new MySphere(10.0, loadImage("planets/Alpine-compressor.png"), 0.5, 0.2, 0.55, 2.0));
    planetList.add(new MySphere(13.0, loadImage("planets/Savannah-compressor.png"), 0.625, -0.05, 0.6, 1.6));
    planetList.add(new MySphere(25.0, loadImage("planets/2k_blue-compressor.jpg"), -0.8, -0.1, -0.6, 1.6));
    planetList.add(new MySphere(20.0, loadImage("planets/Icy-compressor.png"), -0.8, 0.2, 0.6, 1.2));
    planetList.add(new MySphere(8.0, loadImage("planets/Swamp-compressor.png"), 0.9, -0, 0.65, 0.8));
    planetList.add(new MySphere(12.5, loadImage("planets/Tropical-compressor.png"), 0.9, -0.2, -0.7, 0.8));
  }
  
  void createMoons(){
    moonList.add(new MySphere(1.5, loadImage("moons/2k_moon-compressor.jpg"), 0.05, -0.075, 2, 0));
    moonList.add(new MySphere(5.0, loadImage("moons/Venusian-compressor.png"), -0.04, -0.05, 3, 0));
    moonList.add(new MySphere(2.5, loadImage("moons/2k_ceres_fictional-compressor.jpg"), -0.055, 0, 5, 0));
    moonList.add(new MySphere(7.5, loadImage("moons/2k_makemake_fictional-compressor.jpg"), -0.085, 0, 6, 0));
  }
  
  void drawSun(){
    updateSphereRotation(sun);
    drawSphere(sun);
  }
  
  void drawShip(){
    pushMatrix();
    translate(ship.eyeX,ship.eyeY,ship.eyeZ);
    if (ship.centerZ <= ship.eyeZ){
      if (ship.centerY >= ship.eyeY) rotateX(asin(abs(ship.centerY - ship.eyeY)/sqrt(sq(abs(ship.centerZ - ship.eyeZ)) + sq(abs(ship.centerY - ship.eyeY)))));
      else rotateX(-asin(abs(ship.centerY - ship.eyeY)/sqrt(sq(abs(ship.centerZ - ship.eyeZ)) + sq(abs(ship.centerY - ship.eyeY)))));
      if (ship.centerX >= ship.eyeX) rotateY(HALF_PI + acos(abs(ship.centerX - ship.eyeX)/sqrt(sq(abs(ship.centerZ - ship.eyeZ)) + sq(abs(ship.centerX - ship.eyeX)))));
      else rotateY(-HALF_PI -acos(abs(ship.centerX - ship.eyeX)/sqrt(sq(abs(ship.centerZ - ship.eyeZ)) + sq(abs(ship.centerX - ship.eyeX)))));
    }else{
      if (ship.centerY >= ship.eyeY) rotateX(PI + asin(abs(ship.centerY - ship.eyeY)/sqrt(sq(abs(ship.centerZ - ship.eyeZ)) + sq(abs(ship.centerY - ship.eyeY)))));
      else rotateX(-asin(abs(ship.centerY - ship.eyeY)/sqrt(sq(abs(ship.centerZ - ship.eyeZ)) + sq(abs(ship.centerY - ship.eyeY)))));
      if (ship.centerX >= ship.eyeX) rotateY(HALF_PI + acos(abs(ship.centerX - ship.eyeX)/sqrt(sq(abs(ship.centerZ - ship.eyeZ)) + sq(abs(ship.centerX - ship.eyeX)))));
      else rotateY(-HALF_PI -acos(abs(ship.centerX - ship.eyeX)/sqrt(sq(abs(ship.centerZ - ship.eyeZ)) + sq(abs(ship.centerX - ship.eyeX)))));
      rotateZ(PI);
    }
    rotateZ(-radians(ship.degree));
    scale(0.1);
    shape(ship.model);
    popMatrix();
}
  
  void drawAllPlanets(){
    for(MySphere planet: planetList){
      updateSphereRotation(planet);
      drawSphere(planet);
    }
  }
  
  void drawAllMoons(){
    for(MySphere moon: moonList){
      updateSphereRotation(moon);
    }
    
    drawMoon(planetList.get(0), moonList.get(0));
    drawMoon(planetList.get(0), moonList.get(1));
    drawMoon(planetList.get(2), moonList.get(2));
    drawMoon(planetList.get(4), moonList.get(3));
  }
    
  void drawSphere(MySphere sphere){
    pushMatrix();
    rotateY(radians(sphere.rotationY));
    translate(sphere.translateX, sphere.translateY, 0);

    rotateY(radians(sphere.rotation));
    shape(sphere.sphereShape);
    
    if(!cameraMode){
      pushMatrix();
      rotateY(radians((-sphere.rotationY-sphere.rotation)-((mouseX*90/width)-45)));
      textFont(font, sphere.sphereShape.getHeight()/2);
      text(sphere.name, 0, 0.75*sphere.sphereShape.getHeight(), 25);
      popMatrix();
    }
    
    popMatrix();
  }
  
  void drawMoon(MySphere planet, MySphere moon){
    pushMatrix();
    rotateY(radians(planet.rotationY));
    translate(planet.translateX, planet.translateY, 0);
    
    pushMatrix();
    rotateY(radians(moon.rotationY));
    translate(moon.translateX, moon.translateY, 0);
    shape(moon.sphereShape);
    popMatrix();
    
    popMatrix();
  }
  
  void updateSphereRotation(MySphere sphere){
    sphere.rotationY += sphere.drotationY;
    if(sphere.rotationY > 360) sphere.rotationY = 0;
    else if (sphere.rotationY < -360) sphere.rotationY = 0;
    
    sphere.rotation += sphere.drotation;
    if(sphere.rotation > 360) sphere.rotation = 0;
    else if (sphere.rotation < -360) sphere.rotation = 0;
  }
  
  void setBackground(){
    try{  
      background(loadImage("background/background.jpg"));
    }catch(Exception e){
      background(0);
    }
  }
  
  void setCameraMode(boolean cameraMode){
    this.cameraMode = cameraMode;
  }
  
  void cameraManager(){
    cameraRotation();
    cameraZoom();
    cameraView();
    checkZ();
  }
  
  void cameraRotation(){
    if (rotateRight){
      ship.degree++;
      if (ship.degree > 360) ship.degree = 0;
    }
    if (rotateLeft){
      ship.degree--;
      if (ship.degree < 0) ship.degree = 360;
    }
  }
  
  void cameraZoom(){
    if(zoomIn){
      float movZ = (750 - (abs(ship.eyeX - ship.centerX)))/100;
      if (ship.centerZ <= ship.eyeZ && ship.eyeZ - movZ >= -750 && ship.centerZ - movZ >= -1500){
        ship.eyeZ -= movZ;
        ship.centerZ -= movZ;
        moveXY(0);
      }else if (ship.eyeZ + movZ <= 750 && ship.centerZ + movZ <= 1500){
        ship.eyeZ += movZ;
        ship.centerZ += movZ;
        moveXY(0);
      }
    }else if(zoomOut){
      float movZ = (750 - (abs(ship.eyeX - ship.centerX)))/100;
      if (ship.centerZ <= ship.eyeZ && ship.eyeZ + movZ <= 750 && ship.centerZ + movZ <= 1500){
        ship.eyeZ += movZ;
        ship.centerZ += movZ;
        moveXY(1);
      }else if (ship.eyeZ - movZ >= -750 && ship.centerZ - movZ >= -1500){
        ship.eyeZ -= movZ;
        ship.centerZ -= movZ;
        moveXY(1);
      }
    }
    controller.zoomIn = false;
    controller.zoomOut = false;
  }
  
  void moveXY(int flag){
    if (flag == 0){
        if(ship.eyeX - 5 >= -750 && ship.centerX < ship.eyeX){
          ship.eyeX -= 5;
          ship.centerZ += 2.5;
        }else if (ship.eyeX + 5 <= 750 && ship.centerX > ship.eyeX){
          ship.eyeX += 5;
          ship.centerZ += 2.5;
        }
        if(ship.eyeY - 5 >= -750 && ship.centerY < ship.eyeY){
          ship.eyeY -= 5;
          ship.centerZ += 2.5;
        }else if (ship.eyeY + 5 <= 750 && ship.centerY > ship.eyeY){
          ship.eyeY += 5;
          ship.centerZ += 2.5;
        }
    }else if(flag == 1){
        if(ship.eyeX + 5 <= 750 && ship.centerX < ship.eyeX){
          ship.eyeX += 5;
          ship.centerZ -= 2.5;
        }else if (ship.eyeX - 5 >= -750 && ship.centerX > ship.eyeX){
          ship.eyeX -= 5;
          ship.centerZ -= 2.5;
        }
        if(ship.eyeY + 5 <= 750 && ship.centerY < ship.eyeY){
          ship.eyeY += 5;
          ship.centerZ -= 2.5;
        }else if (ship.eyeY - 5 >= -750 && ship.centerY > ship.eyeY){
          ship.eyeY -= 5;
          ship.centerZ -= 2.5;
        }
    }  
  }
  
  void cameraView(){
    if(moveUp && ship.centerY - 5 >= -1500) updateCenterV(false);
    if(moveDown && ship.centerY + 5 <= 1500) updateCenterV(true);
    if(moveRight){
      if(ship.centerX + 5 <= 1500 && ship.eyeZ > ship.centerZ) updateCenterH(true);
      else if (ship.centerX - 5 >= -1500) updateCenterH(false);
      
      if(ship.centerZ - 2.5 >= -1500 && ship.centerX < ship.eyeX) ship.centerZ -= 2.5;
      else if (ship.centerZ + 2.5 <= 1500) ship.centerZ += 2.5;
    }
    if(moveLeft){
      if(ship.centerX - 5 >= -1500 && ship.eyeZ > ship.centerZ) updateCenterH(false);
      else if (ship.centerX + 5 <= 1500) updateCenterH(true);
      
      if(ship.centerZ + 2.5 <= 1500 && ship.centerX < ship.eyeX) ship.centerZ += 2.5;
      else if (ship.centerZ - 2.5 >= -1500) ship.centerZ -= 2.5;
    }
  }
  
  void updateCenterV(boolean operation){
    if (operation){
      ship.centerY += 15*cos(radians(ship.degree));
      ship.centerX += 15*sin(radians(ship.degree));
    }else{
      ship.centerY -= 15*cos(radians(ship.degree));
      ship.centerX -= 15*sin(radians(ship.degree));
    }
  }
  
  void updateCenterH(boolean operation){
    if (operation){
      ship.centerY -= 15*sin(radians(ship.degree));
      ship.centerX += 15*cos(radians(ship.degree));
    }else{
      ship.centerY += 15*sin(radians(ship.degree));
      ship.centerX -= 15*cos(radians(ship.degree));
    }
  }
  
  void checkZ(){
    if(abs(ship.eyeX - ship.centerX) <= 50 && abs(ship.eyeY - ship.centerY) <= 50 && abs(ship.eyeZ - ship.centerZ) <= 50 && ship.centerZ + 200 <= 1500) ship.centerZ += 200;
  }
}
