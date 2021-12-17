int NB = 25; //need to be sq() of an integer
int size = 50;
float spacer = 1.2;
int offset = 15;
int [] n = new int [2];

color c [] = {color(255,0,0),
              color(0,255,0),
              color(0,0,255),
              color(0,255,255),
              color(255,255,0),
              color(255,0,255)
};
Case plateau [][] = new Case[5][5];
int shape [] = {1, 2, 3, 4, 5, 6};

void ChangeCol(int x, int y, color c, int sh ){
  plateau[x][y].col = c;
  int count = 0;
  for(int i=0; i<sqrt(NB); i++){
    for(int j=0; j<sqrt(NB); j++){
      plateau[i][j].display();
      fill(0);
      text(count, j*(size*spacer)+offset+size/2, i*(size*spacer)+offset+size/2);
      count++;
    }
  }
  plateau[x][y].wshape = shape[sh];
}

void tirage(){
  int nTirage = int(random(NB));
  int r = nTirage%5;
  int t[] = {r, (nTirage-r)/5};
  int x = 0;
  int y = 0;
  // TODO
  // calcul the good x y for n
  println("x :" + t[0] + " y :" + t[1] + " - "+nTirage);
  if(plateau[t[0]][t[1]].state==true){
    tirage();
  }else{
    n[0]=t[0];
    n[1]=t[1];
  }
}

void setup(){
  size(500, 500);
  background(125);
  noStroke();
  textSize(20);
  int count = 0;
  for(int i=0; i<sqrt(NB); i++){
    for(int j=0; j<sqrt(NB); j++){
      plateau[i][j] = new Case(j*(size*spacer)+offset, i*(size*spacer)+offset, size, 200);
      plateau[i][j].display();
      fill(0);
      text(count, j*(size*spacer)+offset+size/2, i*(size*spacer)+offset+size/2);
      count++;
    }
  }
}

void draw(){
  background(125);
  int count = 0;
  for(int i=0; i<sqrt(NB); i++){
    for(int j=0; j<sqrt(NB); j++){
      plateau[i][j].display();
      fill(0);
      text(count, j*(size*spacer)+offset+size/2, i*(size*spacer)+offset+size/2);
      count++;
    }
  }
}

void keyPressed(){
  if(key=='r'){
    int x = int(random(sqrt(NB)));
    int y = int(random(sqrt(NB)));

    int xtarget = int(random(sqrt(NB)));
    int ytarget = int(random(sqrt(NB)));

    int nc = int(random(c.length));
    ChangeCol(x, y, c[nc], int(random(shape.length)));
    //println("["+x+";"+y+"] color changed");
    //println(plateau[x][y].wshape);
  }
  if(key==32){
    for(int i=0; i<sqrt(NB); i++){
      for(int j=0; j<sqrt(NB); j++){
        println("["+i+";"+j+"]"+plateau[i][j].state);
      }
    }
  }
  if(key =='t'){
    tirage();
    printArray(n);
  }
}
