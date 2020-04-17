class Character extends Walker {

  int posX, posY, diameter, vida;
  float radiTotal, distancia;

  String stGuerrer = "Warrior";
  String stEnemic = "Enemy";
  String stPerdedor = "Loser";
  String stGuanyador = "Winner";

  // Es crea el setter() corresponent que s'usarà a la classe Main() en el cas que es vulgui donar un personatge com a guanyador. 
  public String setGuanyador() {
    return stGuanyador;
  }

  // Es crea el setter() corresponent que s'usarà a la classe Main() en el cas que es vulgui donar un personatge com a perdedor.
  public String setPerdedor() {
    return stPerdedor;
  }

  // Es crea el constructor de la classe Character() per poder usar-lo al mètode Main() introduïnt els paràmetres que demana (x, y, diametre i vidaInicial). 
  // A més, també s'asocien els valors de les variables que donen amb unes variables locals de la classe Character(). 
  Character(int x_, int y_, int diametre, int vidaInicial) { 
    posX = x_;
    x = posX;
    posY = y_;
    y = posY;
    diameter = diametre;
    vida = vidaInicial;
  }

  // Mètode que es crida quan es pretén mostrar a un enemic. Aquest mètode té com a entrada un "double distancia".
  // Aquest mètode conté dos condicionals per saber l'enemic és mort o no i depèn fa una cosa o una altra. 
  void mostraEnemic(double distancia) {

    // Si la vida de l'enemic és zero, aquest ha mort, i, per tant, ho fem desaparèixer tot. 
    if (vida == 0) { 
      noStroke();
      noFill();
    } 

    // En cas que la vida de l'enemic no sigui zero, és viu, i, per tant, mostrem la informació necessària.
    else {

      // Crea la forma de l'el·lipse, li associa el seu nom i la seva posició mitjançant un text.      
      ellipse(x, y, diameter, diameter);
      text(stEnemic, x+24, y);

      // Li indico les vides i la posició a on ha d'anar mitjan+ant un text. I, finalment, li indico la distància entre els characters i la posició a on ha d'anar.
      text("VIDA: " + vida, x + 27, y + 15); 
      text("DISTÀNCIA: " + (int)distancia, x + 27, y + 30);  
      fill(0, 255, 0);
    }
  }

  // Mètode que es crida quan es pretén mostrar a un guerrer.
  // Aquest mètode conté dos condicionals per saber l'enemic és mort o no i depèn fa una cosa o una altra.
  void mostraGuerrer() {

    // Si la vida del guerrer és zero, aquest ha mort, i, per tant, ho fem desaparèixer tot. 
    if (vida == 0) { 
      noStroke();
      noFill();
    } 

    // En cas que la vida del guerrer no sigui zero, és viu, i, per tant, mostrem la informació necessària.
    else {

      // Crea la forma de l'el·lipse, li associa el seu nom i la seva posició mitjançant un text.      
      ellipse(x, y, diameter, diameter);
      text(stGuerrer, x + 24, y + 1);

      // Li indico les vides i la posició a on ha d'anar mitjan+ant un text. I, finalment, li indico la distància entre els characters i la posició a on ha d'anar.
      text("VIDA: " + vida, x + 24, y + 15);
      fill(255, 0, 0);
    }
  }

  // Mètode que s'usa per saber quin és el punt més proper a l'enemic. 
  boolean Colisionar(Character other) {

    // Sumem els radis i ho dividim per 2 per així saber quin és el punt més proper a l'enemic. 
    radiTotal = this.diameter/2 + other.diameter/2; 

    // Controlem la distància entre un Character i l'altre.
    distancia = dist(this.x, this.y, other.x, other.y); 

    // En cas que la distància sigui més gran que la suma dels radis, voldrà dir que els radis no estan tocant i, per tant, encara no han xocat.
    if (distancia > radiTotal) { 
      return false;
    } else {
      return true;
    }
  }
}
