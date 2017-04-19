import processing.pdf.*;

int WIDTH = 800;
int HEIGHT = 800;

int NUMBER_OF_STROKES = 100;
int NUMBER_OF_ROWS = 200;
int NUMBER_OF_COLUMNS = 1;
//int VARIANT = int(WIDTH * 0.005);
int VARIANT = 4;

int RANDOM_STROKE = 5;
int NUMBER_OF_CYCLES = 10;

void settings(){
  size(WIDTH, HEIGHT);
}

void setup(){
  //background(255, 255, 255);
  background(0,0,0);
  noLoop();
  smooth();
}

void drawBoundedLine(int startX, int startY, int endX, int endY){
  int x1 = int(random(startX, endX));
  int y1 = int(random(startY, endY));
  int x2 = int(random(startX, endX));
  int y2 = int(random(startY, endY));
  
  for( int i = 0; i < NUMBER_OF_STROKES; i++ ){
    stroke(255, 255, 255, random(0, RANDOM_STROKE));
    int x3 = int(random(x1 - VARIANT, x1+VARIANT));
    int y3 = int(random(y1 - VARIANT, y1+VARIANT));
    int x4 = int(random(x2 - VARIANT, x2+VARIANT));
    int y4 = int(random(y2 - VARIANT, y2+VARIANT));
    line(x4,y4,x3,y3);
  }  
}

void draw(){
  int pixelsPerRow = WIDTH / NUMBER_OF_ROWS;
  int pixelsPerColumn = HEIGHT / NUMBER_OF_COLUMNS;
  
  for(int cycle = 0; cycle < NUMBER_OF_CYCLES; cycle++){ 

  
    for(int row = 0; row < NUMBER_OF_ROWS; row++){
      int startX = row * pixelsPerRow;
      int endX = (row + 1) * pixelsPerRow;
      for(int column = 0; column < NUMBER_OF_COLUMNS; column++){
        int startY = column * pixelsPerColumn;
        int endY = (column + 1) * pixelsPerColumn;
        drawBoundedLine(startX, startY, endX, endY);
      }
    }
  }
  save("image.png");
  println("done");
}