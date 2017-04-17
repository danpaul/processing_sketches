import processing.pdf.*;



//int width = 3300;
//int height = 5100;
//int width = 5100;
//int height = 5100;
int width = 2000;
int height = 2000;

int times = 0;
int times2 = 0;
int x = 0;
int y = 0;
int x2 = 0;
int y2 = 0;
int variant = 100;

int printOnFrame = 1000;
//int framesTilexit = 25000;
int framesTilexit = 100000;

//int linesPerPoint = 100;
//int linesToOtherPoint = 20;

int linesPerPoint = 500;
int linesToOtherPoint = 50;

void settings(){
  size(width, height);
  //size(width, height, PDF, "images.pdf");
    


}

void setup(){
  background(255, 255, 255);
  //beginRecord(PDF, "everything.pdf");
  beginRecord(PDF, "everything.pdf");

}

void draw(){
  if( times == 0 ){
    x = int(random(0, width));
    y = int(random(0, height));
  }
  times++;
  if( times == linesPerPoint ){
    times = 0;            
  }      
  if( times2 == 0 ){
    x2 = int(random(0, width));
    y2 = int(random(0, height));
  }
  times2++;
  if( times2 == linesToOtherPoint ){
    times2 = 0;
  }
  stroke(0, 0, 0, random(0, 20));

  line(x,y, int(random(x2 - variant, x2+variant)),
                        int(random(y2 - variant, y2+variant)));
  
  if( frameCount % printOnFrame == 0 ){
    if( frameCount >= framesTilexit ){
      println("Exiting");
      endRecord();
      exit();      
    } else {
      int page = frameCount / printOnFrame;
      println("Page: ", page + 1);
      //pdf.nextPage();
    }
  }



}