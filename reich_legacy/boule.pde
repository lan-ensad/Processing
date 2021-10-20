class boule{
  float speed, size, xpos;
  boule(float x, float s, float sd){
    size = s;
    speed = sd;
    xpos = x;
  }
  void update(){
    xpos += speed;
    if(xpos > width-(size/2)){
      xpos = 0+(size/2);
    }
    ellipse(xpos, height/2, size, size);
  }
}
