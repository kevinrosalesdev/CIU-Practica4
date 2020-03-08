class MyShip{
  
  PShape model;
  float eyeX, eyeY, eyeZ, centerX, centerY, centerZ, degree;
  
  MyShip(PShape model, PImage texture, float eyeX, float eyeY, float eyeZ,
         float centerX, float centerY, float centerZ, float degree){
    this.model = model;
    model.setTexture(texture);
    
    this.eyeX = eyeX;
    this.eyeY = eyeY;
    this.eyeZ = eyeZ;
    this.centerX = centerX;
    this.centerY = centerY;
    this.centerZ = centerZ;
    this.degree = degree;
  }
}
