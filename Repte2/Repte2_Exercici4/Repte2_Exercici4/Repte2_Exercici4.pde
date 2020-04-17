void draw() {
  background(255);

  // Les variables mouseX i mouseY són variables pròpies del Processing que et retornen la posició del ratolí.

  PVector mouse = new PVector(mouseX, mouseY);
  PVector center = new PVector(width/2, height/2);

  // Es posa  mouse.sub(center) perquè només d'aquesta manera es pot donar una volta de 360º al voltant de la pantalla.
  mouse.sub(center);

  // Normalitza la línia perquè estigui constant estigui on estigui. No té en compte la llargada perquè sempre serà la mateixa, només té en compte la posició. 
  mouse.normalize();

  // Amb el mult() multiplica sempre per la mida de 50. 
  mouse.mult(50);

  // Es fa un translate perquè la recta apareixi al centre. Si no el posem apareixerà a la cantonada esquerra de la pantalla. 
  translate(width/2, height/2);

  // Crea una línia a la posició 0, 0 i de mides mouse.x i mouse.y.
  line(0, 0, mouse.x, mouse.y);
}
