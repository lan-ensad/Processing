ArrayList<Point> points = new ArrayList<Point>();

//TODO
float xpop; // 
//
float size = 2; //taille des points
float offset = 10; //décallage des pop;
float threshold = 50; //Bruit des pop;

void setup(){
  size(200, 800);
  background(250);
  frameRate(60);
}

void draw(){
  fill(250, 50);
  rect(0, 0, width, height);
  
  //ajout des points dans la liste
  points.add(new Point(mouseX, height-height/4, size));
  
  //Vérification pour destroy si le premier point est hors de range
  if(points.get(0).ypos<20){
    points.remove(0);
  }
  
  //update la position de chaque point dans la liste
  for(int i=0; i<points.size(); i++){
    Point part =  points.get(i);
    part.update();
  }
  println(points.size());
}
