Character guerrer, enemic;
float distanciaTotal;

void setup() {
  size(600, 600); 

  // Instancio les dades del guerrer i de l'enemic, donant valor a les variables de posició, el radi i les vides que té.
  guerrer = new Character((width/2) + 60, height/2, 30, 3); 
  enemic = new Character((width/2), height/2, 30, 5);
}

void draw() {
  background(255); 

  // Associem a la variable "distanciaTotal" les posicions "x" i "y" 
  // tant de l'enemic com del guerrer per poder saber quina és la distància total entre aquests dos objectes.
  distanciaTotal = dist(enemic.x, enemic.y, guerrer.x, guerrer.y); 

  // Condicional que comprova si la distància (coneguda amb el codi d'abans) és menor a 100 i, 
  // en cas que ho sigui, resta una vida a l'enemic i retorna l'objecte a la posició inicial.
  if (dist(enemic.x, enemic.y, guerrer.x, guerrer.y) > 100) { 

    enemic.vida--; 

    // Codi que retorna els dos objectes (guerrer i enemic) a les seves corresponents posicions inicials. 
    guerrer = new Character((width/2) +60, height/2, 30, guerrer.vida);
    enemic = new Character((width/2), height/2, 30, enemic.vida);
  }

  // Condicional que detecta si l'enemic col·leix amb el guerrer, i, en cas que així sigui, li resta una vida i retorna a la seva corresponent posició inicial. 
  if (enemic.Colisionar(guerrer)) { 
    guerrer.vida--;

    // Codi que retorna els dos objectes (guerrer i enemic) a les seves corresponents posicions inicials. 
    guerrer = new Character((width/2) +60, height/2, 30, guerrer.vida);
    enemic = new Character((width/2), height/2, 30, enemic.vida);
  }

  // Condicional que comprova qui ha estat el guanyador i associa el text corresponent (mitjançant setters) segons qui ha guanyat i qui ha perdut. 
  if (enemic.vida == 0 && guerrer.vida >= 1) {

    text(guerrer.setGuanyador(), guerrer.x, guerrer.y);     
    text(enemic.setPerdedor(), enemic.x+50, enemic.y+20);
  } else if (guerrer.vida == 0 && enemic.vida >= 1) {

    text(enemic.setGuanyador(), enemic.x, enemic.y);    
    text(guerrer.setPerdedor(), guerrer.x+50, guerrer.y+20);
  } 

  // Mitjançant les corresponents posicions "x" i "y" de l'enemic i del guerrer, es dibuixa una línia entre aquests dos objectes.
  line(enemic.x, enemic.y, guerrer.x, guerrer.y); 

  // Mitjançant el mètode "walk()" de la classe Walker(), es fa que l'enemic faci un moviment de "caminar". 
  enemic.walk(); 

  // S'usa el mètode mostraEnemic() de la classe Character() passant com a paràmetre la variable de distància 
  // "distanciaTotal" perquè dibuixi un el·lipse i mostri la corresponent informació (vides, distància, ...) 
  enemic.mostraEnemic(distanciaTotal);  

  // Mitjançant el mètode "walk()" de la classe Walker(), es fa que el guerrer faci un moviment de "caminar". 
  guerrer.walk();

  // S'usa el mètode mostraEnemic() de la classe Character() passant com a paràmetre la variable de distància 
  // "distanciaTotal" perquè dibuixi un el·lipse i mostri la corresponent informació (vides, distància, ...) 
  guerrer.mostraGuerrer();
}
