class line{
  float speed, xpos;
  line(float x, float sd){
    speed = sd;
    xpos = x;
  }
  void update(){
    xpos += speed;
    if(xpos > width || xpos<0){
      speed *=-1;
    }
    line(xpos,0, xpos, height);
  }
}
