int NB = 20;
int NB2 = 20; //pour hline - 2 dimensions
int size = 1;
int reverseCount=0;

boule [] b = new boule[NB];
line [] l = new line[NB];
hline [] hl = new hline[NB2];

float [] tab1 = new float [NB];
float [] tab2 = new float [NB];

void setup() {
  //size(500, 500); //use to dev
  fullScreen();
  background(33);
  //noStroke(); //use with boule class
  stroke(175);
  frameRate(30);

  for (int i=0; i<NB; i++) {
    //b [i] = new boule(0+(size/2), size, random(3,3.14));
    l [i] = new line(0, random(5, 6));
    hl [i] = new hline(0, random(3, 4));
    //println(i + " : " +l[i].speed);
  }
  for (int i=0; i<NB; i++) {
    tab1[i] = l[i].speed;
    tab2[i] = hl[i].speed;
  }
  tab1 = sort(tab1);
  tab2 = sort(tab2);
  println(tab1);
  println(tab2);
}

void draw() {
  background(33);
  for (int i=0; i<NB; i++) {
    //b[i].update();
    l[i].update();
    hl[i].update();
  }
}

void keyPressed() {
  if (key==32) {
    reverseCount++;
    int count = NB-1;
    println("REVERSE TIME : " + reverseCount);
    for (int i=0; i<NB; i++) {
      if (l[i].speed>0) {
        l[i].speed = tab1[count];
      } else {
        l[i].speed = -tab1[count];
      }

      if (hl[i].speed>0) {
        hl[i].speed = tab2[count];
      } else {
        hl[i].speed = -tab1[count];
      }

      count --;
    }
  }
}
