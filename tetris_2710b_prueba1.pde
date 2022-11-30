
PShape square;  // El objeto
int temp_x, temp_y, temp_y_cell;
int[][] cell = new int[10][20];

int puntaje;
int time_min, time, time_last; // Variables de tiempo

int pieza_x, pieza_y; // Variables para la creacion de pieza en ejes


int select_piece;

int t = 0;

boolean primer_inicio = true;

void setup() {
  size(800,1000); // Tamaño de la ventana
  // Crear la figura con forma de cuadrado 
  square = createShape(RECT, 0, 0, 50, 50); // tamaño de 50x50
  square.setFill(color(0, 0, 255)); // relleno azul
  square.setStroke(true); // bordes negros
  
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
  
  if (primer_inicio == true){
    crear_celdas();
    primer_inicio = false;
  }
  textos();
  pieza();
}

void pieza(){
  switch(select_piece){
    case 1: // cuadrado
    square.setFill(color(0,255,0));
        shape(square,350,50);
        shape(square,400,50);
        shape(square,350,100);
        shape(square,400,100);
        println("Cuadrado");
      break;
     case 2: // L
     square.setFill(color(0,255,0));
        shape(square,350,50);
        shape(square,350,100);
        shape(square,350,150);
        shape(square,400,150);
        println("L");
      break;
     case 3: // T invertida
     square.setFill(color(0,255,0));
        shape(square,350,50);
        shape(square,350,100);
        shape(square,300,100);
        shape(square,400,100);
        println("T inver");
      break;
     case 4: // Z
     square.setFill(color(0,255,0));
        shape(square,300,50);
        shape(square,350,50);
        shape(square,350,100);
        shape(square,400,100);
        println("Z");
      break;
     case 5: // |
     square.setFill(color(0,255,0));
        shape(square,300,50);
        shape(square,300,100);
        shape(square,300,150);
        shape(square,300,200);
        println("Palito");
      break;
     case 6: // L INVERTIDA
     square.setFill(color(0,255,0));
        shape(square,350,50);
        shape(square,350,100);
        shape(square,350,150);
        shape(square,300,150);
        println("L inver");
      break;
     case 7: // Z INVERTIDA
     square.setFill(color(0,255,0));
        shape(square,300,100);
        shape(square,350,100);
        shape(square,350,50);
        shape(square,400,50);
        println("Z inver");
      break;
  }
}

void mouseClicked(){
  primer_inicio = true;
  select_piece = int(random(1,7));
}

/*
CONTROL DE CELDAS
*/
void crear_celdas(){
  temp_x = 100;
  temp_y_cell = 0;
  for(int x=0;x<10;x++){
    temp_x = temp_x+50;
    for(int y=0;y<20;y++){
      temp_y = y*50;
      square.setFill(color(0, 0, 255));
      shape(square, temp_x, temp_y);
      agregar_celda_array(x, y);
    }
  }
}

void agregar_celda_array(int x, int y) {
  cell[x][y] = y;
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
  text(time_min, 690,180);
  text(":", 725, 180);
  text(time, 740, 180);
}
