import processing.pdf.*;

int WIDTH = 800;
int HEIGHT = 800;

//int VARIANT = int(width * 0.02);
int VARIANT = 100;
int RANDOM_MAX = 10;
int NUMBER_OF_POINTS = 40;
int NUMBER_OF_DRAWINGS = 100;

//int LINES_PER_POINT = 20;
int LINES_TO_OTHER_POINT = 20;

void settings(){
  size(WIDTH, HEIGHT);
}

int[][] getPoints(int number){
  int[][] points = new int[number][2];  
  for( int i = 0; i < number; i++ ){
    points[i][0] = int(random(0, width));
    points[i][1] = int(random(0, height));
  }
  return points;
}

void setup(){
  background(255, 255, 255);
  noLoop();
  smooth();
}

int variate(int x){
  //int variant = int(random(random(VARIANT)));
  int variant = int(random(VARIANT));
  return int(random(x - variant, x+variant));  
}

void draw(){
  
  int[][] points = getPoints(NUMBER_OF_POINTS);

//println(points[0][0]);

  for( int h = 0; h < NUMBER_OF_DRAWINGS; h++ ){
    shuffleArray(points);
    for( int i = 0; i < NUMBER_OF_POINTS; i++ ){
      int x = points[i][0];
      int y = points[i][1];
      
      int nextPoint = i + 1;

      if(nextPoint >= NUMBER_OF_POINTS){ nextPoint = 0; }
      
      int nextX = points[nextPoint][0];
      int nextY = points[nextPoint][1]; 
      
      for( int k = 0; k < LINES_TO_OTHER_POINT; k++ ){
        stroke(0, 0, 0, random(0, RANDOM_MAX));
        line(x,y,variate(nextX),variate(nextY));
      }
    }
    //String file = h + ".png";
    //save(file);
  }
  save("image.png");
  println("done");
}

void shuffleArray(int[][]numbers){
  int[] temp;
  for(int i = 0; i < numbers.length; i++){
    temp = numbers[i];
    int swapIndex = int(random(numbers.length - 1));
    numbers[i] = numbers[swapIndex];
    numbers[swapIndex] = temp;    
  }  
}