int puntaje;

int time_min, time, time_last; // Variables de tiempo

int pieza_x, pieza_y; // Variables para la creacion de pieza en ejes


int select_piece; // selecciona la pieza con fe en dios

int t = 0; // temporal BORRAR

boolean primer_inicio = true;

void setup() {
  size(800,1000); // Tamaño de la ventana
  // Crear la figura con forma de cuadrado 
/*
  square = createShape(RECT, 0, 0, 50, 50); // tamaño de 50x50
  square.setFill(color(0, 0, 255)); // relleno azul
  square.setStroke(true); // bordes negros */
  
  PFont tetr;
  tetr = createFont("Tetris.ttf", 128);
  textFont(tetr);
  frameRate(3);
}

void draw() {
  /* TIEMPO */
  time = (millis()/1000)-time_last;
  if(time >= 60){
    time_min = time_min+1;
    time_last = millis()/1000;
  }
  /* FIN TIEMPO */
  
 
    crear_celdas();
  
  textos();
  pieza();
}

 PShape pieza(){
  PShape forma=null;
  forma = createShape();
  forma.setFill(color(0,0,255));
  forma.beginShape();
  
  switch(select_piece){
    case 1: // cuadrado
    
          forma.vertex(50, 0);
          forma.vertex(150,0);
          forma.vertex(150,100);
          forma.vertex(50, 100);
          break;
     case 2: // L
     
          forma.vertex(50, 0);
          forma.vertex(100,0);
          forma.vertex(100,100);
          forma.vertex(150,100);
          forma.vertex(150,150);
          forma.vertex(50,150);
          break;
     case 3: // T invertida
     
          forma.vertex(50, 0);
          forma.vertex(100,0);
          forma.vertex(100,50);
          forma.vertex(150,50);
          forma.vertex(150,100);
          forma.vertex(0,100);
          forma.vertex(0,50);
          forma.vertex(50,50);
         break;
     case 4: // Z
     
        forma.vertex(0,0);
        forma.vertex(100, 0);
        forma.vertex(100,50);
        forma.vertex(150,50);
        forma.vertex(150,100);
        forma.vertex(50, 100);
        forma.vertex(50,50);
        forma.vertex(0, 50);
        break;
     case 5: // |
     
        
        forma.vertex(50, -50);
        forma.vertex(100,-50);
        forma.vertex(100,200);
        forma.vertex(50,200);
        break;
     case 6: // L INVERTIDA
     
        forma.vertex(50,0);
        forma.vertex(100,0);
        forma.vertex(100,150);
        forma.vertex(0,150);
        forma.vertex(0,100);
        forma.vertex(50,100);
        break;
     case 7: // Z INVERTIDA
    
        forma.vertex(0,100);
        forma.vertex(100,100);
        forma.vertex(100,50);
        forma.vertex(150,50);
        forma.vertex(150,0);
        forma.vertex(50,0);
        forma.vertex(50,50);
        forma.vertex(0,50);
        break;
  }
  forma.endShape();
  if(t <= 15){
    t++;
  }
  translate(0,t*50); 
  shape(forma, 300, 50);
  return forma; 
}

 void mouseClicked(){
  primer_inicio = true;
  t = 0;
  select_piece = int(random(1,7));
}

/*
CONTROL DE CELDAS
*/

PShape crear_celdas(){
PShape fondo;

fondo = createShape();
fondo.setFill(color(0,255,0));
fondo.beginShape(QUAD);
  
for(int x=0; x <= 11; x++){
  for(int y=0;  y<=21; y++){
    if (y == 0){
      fondo.vertex(50*x, 0);
      fondo.vertex(100*x,0);
      fondo.vertex(100*x,50);
      fondo.vertex(50*x,50);
    } else {
      fondo.vertex(50*x, 50*y);
      fondo.vertex(100*x,50*y);
      fondo.vertex(100*x,100*y);
      fondo.vertex(50*x,100*y);
    }
  }
}
fondo.endShape(CLOSE);
  
  shape(fondo,100,0);
  return fondo;
}

void cargar_array(int x, int y,int valor) {
  // cell[x][y] = valor;
}

/*
TEXTOS y rectangulos INICIALES
*/

void textos(){
  fill(255);
  rect(0,0,150,1000);
  rect(650,0,150,1000);
  textSize(35);
  fill(186,18,0);
  text("TETRIS", 3, 50);
  text("SCORE", 660, 50);
  text("TIME", 675, 140);
  textSize(40);
  text(puntaje, 690, 90);
  text(time_min, 670,180);
  text(":", 725, 180);
  text(time, 740, 180);
}
