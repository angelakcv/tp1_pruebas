class Trazos {
  
  Paleta pverde;
  Paleta pceleste;
  float tamLargos, tamMedianos, tamCortos;
  float ancho;

  float y;

  PImage trazos[];
  int cantidad = 4;
  PImage mascara;
  
  float pX;
  float vel;

  Trazos() {

    y = height/2;

    pX = 900;
    vel -= 100.5;
    
    //colores
    pverde = new Paleta ("paletaFondoVerde.png");
    pceleste = new Paleta ("paletaFondoCeleste.png");

    trazos = new PImage[cantidad];
    mascara = loadImage ("mascara1.png");

    for (int i=0; i<cantidad; i++) {
      String nombre = "trazo" + nf(i, 2) + ".png";
      mascara = loadImage (nombre);
      mascara.filter (INVERT);
      trazos[i] = createImage( 280, 900, RGB);
      trazos[i].filter(INVERT);
      trazos[i].mask(mascara);
    }
  }

//VERDES
  float crearLargos(float pX) {
    int cual = int (random(cantidad));
    tamLargos= random(620, 650);
    ancho = 250;
    float resultado = pX + vel;
    tint (pverde.darUnColor(), 50);
    imageMode(CENTER);
    image (trazos[cual], resultado, y, ancho, tamLargos);
    return  resultado; //devuelve el resultado de la posicion en x donde dibujo
  }
  
//CELESTES
  float crearMedianos(float pX) {
    int cual = int (random(cantidad));
    tamMedianos = random (620, 650);
    ancho = 250;
    float resultado = pX + vel;

    tint (pceleste.darUnColor(), 50);
    imageMode(CENTER);
    image (trazos[cual], resultado, y, ancho, tamMedianos);
    return  resultado;
  }

//CONTINUA CON EL ÚLTIMO COLOR
  float crearSilencio(float pX) {
    int cual = int (random(cantidad));
    tamCortos = random (600, 620);
    ancho = 150;
    //float resultado = pX-ancho ;
    float resultado = pX + vel;
    imageMode(CENTER);
    image (trazos[cual], resultado, y, ancho, tamCortos);
    return resultado;
  }
}
