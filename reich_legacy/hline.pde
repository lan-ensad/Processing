class hline{
  float speed, ypos;
  hline(float x, float sd){
    speed = sd;
    ypos = x;
  }
  void update(){
    ypos += speed;
    if(ypos > height || ypos<0){
      speed *=-1;
    }
    line(0,ypos, width, ypos);
  }
}
