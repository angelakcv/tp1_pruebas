Dir_y_Vel mouse;
GestorDeInteracion g;
Trazos pincel;
Paleta p;
//PImage Paletafon;
Float posX;

void setup () {

  //Paletafon = loadImage ("paletaFon.png");
  size (900, 594);
  //image(Paletafon, 0, 0);
  //imageMode(CENTER);
  
  g = new GestorDeInteracion();
  pincel = new Trazos();

  posX = 920.0; //posicion inicial de las figuras

  mouse = new Dir_y_Vel();
}

void draw () {
  g.actualizar();

  //Dibujar los trazos
  
  if (frameCount%20==0) {
    if (g.movLargo) {
      posX = pincel.crearLargos(posX);
    } else if (g.movCorto) {
      posX = pincel.crearMedianos(posX);
    } else if (g.quieto) {
      posX = pincel.crearSilencio(posX);
    }
  }
  //Espacio toroidal
  posX = ( posX<0 ? posX+1000 : posX--);
}
