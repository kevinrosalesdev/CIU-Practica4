class Controller{
  
  MyShip ship;
  MySphere sun;
  ArrayList<MySphere> planetList;
  ArrayList<MySphere> moonList;
  PFont font;
  
  Controller(PFont font){
    this.sun = new MySphere(75.0, loadImage("sun/2k_sun-compressor.jpg"), 0, 0, 0, 0.1);
    this.ship = new MyShip(loadShape("ship/10475_Rocket_Ship_v1_L3.obj"), loadImage("ship/10475_Rocket_Ship_v1_Diffuse.jpg"), 2.5,
                width/2.0, height/2.0, (height/2.0)/tan(PI*30.0/180.0), 0, 0, 0, -1, 1, 0);
    this.planetList = new ArrayList<MySphere>();
    this.moonList = new ArrayList<MySphere>();
    this.font = font;
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
    updateShipRotation(ship);
    
    pushMatrix();
    translate(ship.eyeX,ship.eyeY,ship.eyeZ);
    rotateX(radians(200));
    rotateY(radians(30));
    rotateZ(radians(ship.rotationZ));
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
    
    pushMatrix();
    rotateY(radians((-sphere.rotationY-sphere.rotation)-(-45)));
    //textFont(font, sphere.sphereShape.getHeight()/2);
    //text(sphere.name, 0, 0.75*sphere.sphereShape.getHeight(), 25);
    popMatrix();
    
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
  
  void updateShipRotation(MyShip ship){
    ship.rotationZ += ship.drotationZ;
    if(ship.rotationZ > 360) ship.rotationZ = 0;
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
    background(loadImage("background/background.jpg"));
  }
}
