int px, py;
int size = 30;
int sp = 2;

void setup (){
  size(600, 200);
  noStroke();

  px = int(random(width));
  py = int(random(width));
}

void draw(){

  //background(124);
  fill(200, 40, 225);
  ellipse(px, py, size, size);
  px += sp;
  py +=sp;

  if(px>width-size/2){
    px = 0;
  }
  if(py>height-size/2){
    py = 0;
  }
}
