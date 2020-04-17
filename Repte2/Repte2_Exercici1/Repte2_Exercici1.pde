PVector posicio;
PVector velocitat;

void setup() {
  size(640, 360);

  // S'inicialitza les variables de PVector posicio i velocitat i se li assignen els valors float del vector. 
  posicio = new PVector(100, 100);
  velocitat = new PVector(2.5, 5);
}

void draw() {
  background(255);

  // Li dóna la velocitat a l'esfera. 
  posicio.add(velocitat);

  // Quan la posició de X de l'el·lipse és més gran que la mida de la pantalla aplica una força contrària, fent que vagi cap al costat oposat. 
  if ((posicio.y > height) || (posicio.y < 0)) {
    velocitat.y = velocitat.y * -1;
    fill(255, 35, 144);
  }

  // Quan la posició de Y de l'el·lipse és més gran que la mida de la pantalla aplica una força contrària, fent que vagi cap al costat oposat. 
  if ((posicio.x > width) || (posicio.x < 0)) {
    velocitat.x = velocitat.x * -1;
    fill(0, 255, 255);
  }

  // Es crea l'el·lipse i si li dóna la posició que s'ha inicialitzat al setup(). 
  ellipse(posicio.x, posicio.y, 16, 16);
}
