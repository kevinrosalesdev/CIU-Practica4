class MyShip{
  
  PShape model;
  float rotationZ, drotationZ, eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ;
  
  MyShip(PShape model, PImage texture, float drotationZ, float eyeX, float eyeY, float eyeZ,
         float centerX, float centerY, float centerZ, float upX, float upY, float upZ){
    this.model = model;
    model.setTexture(texture);
    this.drotationZ = drotationZ;
    this.rotationZ = 0;
    
    this.eyeX = eyeX;
    this.eyeY = eyeY;
    this.eyeZ = eyeZ;
    this.centerX = centerX;
    this.centerY = centerY;
    this.centerZ = centerZ;
    this.upX = upX;
    this.upY = upY;
    this.upZ = upZ;
  }
  
}
