void setup() {
  size(640, 360);
}

void draw() {
  background(255);

  // Les variables mouseX i mouseY són variables pròpies del Processing que et retornen la posició del ratolí.
  PVector mouse = new PVector(mouseX, mouseY);
  PVector center = new PVector(width/2, height/2);  

  // Es posa  mouse.sub(center) perquè només d'aquesta manera es pot donar una volta de 360º al voltant de la pantalla.
  // El mètode sub és un mètode usat per restar (substreure) un vector extern al vector d'aquest objecte. 
  mouse.sub(center);

  // Es desa la magnitud del vector. 
  float m = mouse.mag();

  // Es mostra per pantalla el valor de la magnitud usant el mètode mag() que té per defecte Processing. 
  print(" Magnitud: " + mouse.mag());

  // Es crea un rectangle i s'omple la amb color negre perquè es pugui apreciar correctament. 
  fill(0);
  rect(0, 0, m, 10);

  // Es fa un translate perquè la recta apareixi al centre. Si no el posem apareixerà a la cantonada esquerra de la pantalla. 
  translate(width/2, height/2);  

  // Es crea una línia a la posició 0, 0 amb les mides del mouse.x i mouse.y.
  line(0, 0, mouse.x, mouse.y);
}
