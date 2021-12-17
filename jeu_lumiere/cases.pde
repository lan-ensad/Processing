class Case{
  float x, y, size;
  color col;
  int wshape = 0;
  boolean state = false;
  Case(float px, float py, float s, color c){
    x = px;
    y = py;
    col = c;
    size = s;
  }

  void display(){
    fill(col);
    rect(x, y, size, size);
    if (wshape!=0){
      state = true;
    }else{
      state = false;
    }
  }
}
