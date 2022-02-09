int nbX = 10;
int nbY = 10;
int size = 20;

int r, g, b;

void setup() {
    size(500, 500);
    frameRate(2);
}

void draw() {
    background(0);
    g = int(map((cos(frameCount)*100), -99, 99, 0, 255));

    for(int i=0; i<nbY; i++){
        for(int j=0; j<nbY; j++){
            b = int((map(i, 0, nbX, 0, 255))/cos(frameCount));
            r = int((map(i, 0, nbY, 255, 0))*sin(frameCount));
            fill(r, g, b);
            rect(j*size, i*size, size, size);
        }
    }
    println(int(map((cos(frameCount)*100), -99, 99, 0, 255)));
}
