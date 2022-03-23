class Point{
  float xpos, ypos, size;
  float speed = 5;

  //constructeur
  Point(float x, float y, float s){
    xpos = x;
    ypos = y;
    size = s;
  }
  
  //fonction refresh position Y
  void update(){
    ypos -= speed;
    noStroke();
    fill(50);
    ellipse(xpos, ypos, size, size);
  }
}
