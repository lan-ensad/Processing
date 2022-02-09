/* autogenerated by Processing revision 1277 on 2021-12-09 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class jeu_lumiere extends PApplet {

int NB = 25; //need to be sq() of an integer
int size = 50;
float spacer = 1.2f;
int offset = 15;
int [] n = new int [2];

int c [] = {color(255,0,0),
              color(0,255,0),
              color(0,0,255),
              color(0,255,255),
              color(255,255,0),
              color(255,0,255)
};
Case plateau [][] = new Case[5][5];
int shape [] = {1, 2, 3, 4, 5, 6};

 public void ChangeCol(int x, int y, int c, int sh ){
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

 public void tirage(){
  int nTirage = PApplet.parseInt(random(NB));
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

 public void setup(){
  /* size commented out by preprocessor */;
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

 public void draw(){
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

 public void keyPressed(){
  if(key=='r'){
    int x = PApplet.parseInt(random(sqrt(NB)));
    int y = PApplet.parseInt(random(sqrt(NB)));

    int xtarget = PApplet.parseInt(random(sqrt(NB)));
    int ytarget = PApplet.parseInt(random(sqrt(NB)));

    int nc = PApplet.parseInt(random(c.length));
    ChangeCol(x, y, c[nc], PApplet.parseInt(random(shape.length)));
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
class Case{
  float x, y, size;
  int col;
  int wshape = 0;
  boolean state = false;
  Case(float px, float py, float s, int c){
    x = px;
    y = py;
    col = c;
    size = s;
  }

   public void display(){
    fill(col);
    rect(x, y, size, size);
    if (wshape!=0){
      state = true;
    }else{
      state = false;
    }
  }
}


  public void settings() { size(500, 500); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "jeu_lumiere" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}