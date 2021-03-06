int nbX = 15;
int nbY = 15;
int size = 20;

float stepsR = 1;
float stepsG =1;
float stepsB = 1;

int now, lastTrigR, lastTrigG, lastTrigB;
int interval = 100;
int r, g, b = 0;

void setup() {
    size(500, 500);
    frameRate(15);
}

void draw() {
    background(0);
    now = millis();

    if(now-lastTrigG >= interval){
        lastTrigG = now;
        g+=stepsG;
        if(g>=255 || g<=0){
            stepsG =-stepsG;
        }
    }
    if(now-lastTrigR >= interval-50){
        lastTrigR = now;
        r+=stepsR;
        if(r>=255 || r<=0){
            stepsR =-stepsR;
        }
    }
    if(now-lastTrigB >= interval+507){
        lastTrigB = now;
        b+=stepsB;
        if(b>=255 || b<=0){
            stepsB =-stepsB;
        }
    }
    println("Red : "+r+" - Green : " + g + " - Blue : "+b);

    for(int i=0; i<nbY; i++){
        for(int j=0; j<nbY; j++){
            fill(r, g, b);
            rect(j*size+(width/2-size*nbX/2), i*size+(height/2-size*nbY/2), size, size);
        }
    }
}