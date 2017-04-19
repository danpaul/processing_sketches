import processing.pdf.*;

int width = 800;
int height = 800;

//int numberOfPoints = 20;
int[][] points = new int[0][2];

int times = 0;
int times2 = 0;
int x = 0;
int y = 0;
int x2 = 0;  
int y2 = 0;
int variant = int(width * 0.02);
int randomMax = 20;
//int variant = 0;
int numberOfDrawings = 40;

int printOnFrame = 1000;
int framesTilexit = 25000;

int linesPerPoint = 20;
int linesToOtherPoint = 10;

void settings(){
  size(width, height);
  //for( int i = 0; i < numberOfPoints; i++ ){
  //  points[i][0] = int(random(0, width));
  //  points[i][1] = int(random(0, height));
  //}
}

void setPoints(int number){
  points = new int[number][number];  
  for( int i = 0; i < number; i++ ){
    points[i][0] = int(random(0, width));
    points[i][1] = int(random(0, height));
  }
}

void setup(){
  background(255, 255, 255);
  //beginRecord(PDF, "everything.pdf");
  noLoop();
}

int getTargetPoint(int self){
  int target = int(random(points.length));
  if( target != self ){ return target; }
  return getTargetPoint(self);        
}

void draw(){
  ////background(255,255,255);
  //stroke(255);
  //rect(0,0,width,height);
  ////clear();
  ////background(255, 255, 255);
  for( int h = 2; h < numberOfDrawings + 1; h++ ){
  clear();
  background(255, 255, 255);
    setPoints(h);
    //for( int i = 0; i < numberOfPoints; i++ ){
    for( int i = 0; i < h; i++ ){
      int x = points[i][0];
      int y = points[i][1];
      //line(0,0,250,250);
      for( int j = 0; j < linesPerPoint; j++ ){
        int targetPoint = getTargetPoint(i);
        int x2 = points[targetPoint][0];
        int y2 = points[targetPoint][1];
        for( int k = 0; k < linesToOtherPoint; k++ ){
          stroke(0, 0, 0, random(0, randomMax));
          int x3 = int(random(x2 - variant, x2+variant));
          int y3 = int(random(y2 - variant, y2+variant));
          int x4 = int(random(x - variant, x+variant));
          int y4 = int(random(y - variant, y+variant));
          line(x4,y4,x3,y3);       
        }
      }
    }
    String file = h + ".png";
    save(file);
  }
  println("done");
}