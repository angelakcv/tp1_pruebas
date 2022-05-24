Dir_y_Vel mouse;

ArrayList<Caminante> caminantes;
GestorDeInteracion g;
Trazos pincel;
Paleta p;
PImage trazoL, trazoC, silencio, Paletafon;
Float posX;

float xOrigen;
float xDestino;
float y;
float f;

void setup () {


  Paletafon= loadImage ("paletaFon.png");
  size (900, 594);
  //background(255);
  image(Paletafon, 0, 0);
  imageMode(CENTER);

  p = new Paleta("paletaLinea.png");
  g = new GestorDeInteracion();
  pincel = new Trazos();

  posX = 900.0; //posicion inicial de las figuras

  mouse = new Dir_y_Vel();

  caminantes = new ArrayList<Caminante>();
  for (int i=0; i<3; i++) {
    caminantes.add(new Caminante(p.darUnColor() ));
  }
}

void draw () {
  g.actualizar();

  for (Caminante c : caminantes) {
    c.dibujar();
    c.mover();
    c.rebote();
    c.cambiarColor(p.darUnColor());
    c.dibujarRelacion(caminantes);
  }



   //Dibujar los trazos 
  //_si se da un movimiento grande, se dibujan las lineas largas
  if(frameCount%20==0){ //el dibujo se hace cada 20 frames, hasta 40 frames. 40%20
  if (g.movLargo) {
    posX = pincel.crearLargos(posX); 
    //_si se da un movimiento corto, se dibujan las lineas cortas
  } else if (g.movCorto) {
   posX = pincel.crearMedianos(posX);
   } else if (g.quieto) {
   posX = pincel.crearSilencio(posX);
   }
  }
  //vuelven a aparecer los trazos cuando salgan de la pantalla 
  //Espacio toroidal
  //si posX es menor que width  
  //se le va a restar el tamaño de width
  posX = ( posX<0 ? posX+1000 : posX--);
}
