class MySphere {

  String name;
  PShape sphereShape;
  float rotation, rotationY, translateX, translateY, drotation, drotationY;

  MySphere(float radius, PImage texture, float translateX, float translateY, float drotationY, float drotation) {
    this.name = createName();
    this.sphereShape = createShape(SPHERE, radius);
    sphereShape.setTexture(texture);
    this.rotation = 0;
    this.rotationY = 0;
    this.translateX = width/2*translateX;
    this.translateY = height/2*translateY;
    this.drotation = drotation;
    this.drotationY = drotationY;
  }
}

String[] syllables = new String[]{"ar", "pac", "rar", "lal", "zac", 
  "per", "me", "kec", "ve", "sen", 
  "nin", "gin", "li", "fin", "zy", 
  "op", "con", "qo", "fon", "yo", 
  "um", "hup", "bu", "ru", "dur", 
};
String[] nameTermination = new String[]{"-04", "-Beta", "-Gamma", "-Z", "-1001"};

String createName() {

  String name = "";

  int syllablesNumber = int(random(2, 5));
  for (int i = 0; i < syllablesNumber; i++) {
    name += syllables[int(random(25))];
  }

  if (int(random(5)) == 1) name += nameTermination[int(random(5))];

  return name.substring(0, 1).toUpperCase() + name.substring(1);
}
