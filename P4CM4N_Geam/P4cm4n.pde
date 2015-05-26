class Pacman{
  int x,y;
  PImage pacM;
  int speed = 4;
  int s = 20;
  int half_size = s/2;
  
  //collision map
  boolean[][] collisionMap;
  PImage colMapImage = loadImage("pacman_collisionmap.gif");
  
void ColMap(){

                     collisionMap = new boolean[colMapImage.width][colMapImage.height];
                     color black = color(0);
                     color white = color(255);

                     for (int i = 0; i < colMapImage.width; i++) {

                       for (int j = 0; j < colMapImage.height; j++) {
                         
                         color c = colMapImage.get(i, j);
                         if (c == black) {
                           collisionMap[i][j] = false;
                         } 
                    
                         else if (c == white) {
                           collisionMap[i][j] = true;
                         }
                         else {
                         }
                    
                       }
                     }
}  

  
int numFramesR = 4;
int frameR = 0;
PImage[] imagesR = new PImage[numFramesR];

int numFramesL = 4;
int frameL = 0;
PImage[] imagesL = new PImage[numFramesL];

int numFramesU = 4;
int frameU = 0;
PImage[] imagesU = new PImage[numFramesU];

int numFramesD = 4;
int frameD = 0;
PImage[] imagesD = new PImage[numFramesD];


  Pacman(int _x, int _y){
    x = _x;
    y = _y;
  }
  
  
void update(){
    
           imagesR[0] = loadImage("pacman_RIGHT_open.png");
           imagesR[1] = loadImage("pacman_RIGHT_half.png");
           imagesR[2] = loadImage("pacman_RIGHT_closed.png");
           imagesR[3] = loadImage("pacman_RIGHT_half.png");
           
           imagesL[0] = loadImage("pacman_LEFT_open.png");
           imagesL[1] = loadImage("pacman_LEFT_half.png");
           imagesL[2] = loadImage("pacman_LEFT_closed.png");
           imagesL[3] = loadImage("pacman_LEFT_half.png");
           
           imagesU[0] = loadImage("pacman_UP_open.png");
           imagesU[1] = loadImage("pacman_UP_half.png");
           imagesU[2] = loadImage("pacman_UP_closed.png");
           imagesU[3] = loadImage("pacman_UP_half.png");
           
                      //DOWN FRAMES
           imagesD[0] = loadImage("pacman_DOWN_open.png");
           imagesD[1] = loadImage("pacman_DOWN_half.png");
           imagesD[2] = loadImage("pacman_DOWN_closed.png");
           imagesD[3] = loadImage("pacman_DOWN_half.png");

    
    
    
    
                 boolean up_left = false;
                 boolean up_right = false;
                 boolean down_right = false;
                 boolean down_left = false;
                
                 if (keyCode == LEFT) {
                   
                   if (x >= half_size + speed)
                   {
                     // check all four corners to see if they would be with the allowed area
                     up_left = collisionMap[x - speed - half_size][y - half_size];
                     up_right = collisionMap[x - speed + half_size][y - half_size];
                     down_right = collisionMap[x - speed + half_size][y + half_size];
                     down_left = collisionMap[x - speed - half_size][y + half_size];
                     
                     // if that's the case for each corner
                     if (up_left && up_right && down_right && down_left) {
                        //move
                       x -= speed;
                       
                       //PORTAL
                          if(x==110){
                            x=526;
                          }
                       
                       //println("HELLO!");
                     }/*else{
                        if(millis() > lastCollision + 2000){
                          //println("ohhai");
                          lastCollision = millis();
                          song = minim.loadSnippet("Hey.mp3");
                          song.play();
                        }*/
                     }
                   }
                 
                 
                 // this basically is repeated for all possible ways to go…
                 if (keyCode == RIGHT) {
                   if (x <= width - half_size - speed)
                   {
                     up_left = collisionMap[x + speed - half_size][y - half_size];
                     up_right = collisionMap[x + speed + half_size][y - half_size];
                     down_right = collisionMap[x + speed + half_size][y + half_size];
                     down_left = collisionMap[x + speed - half_size][y + half_size];
                
                     if (up_left && up_right && down_right && down_left) {
                       x += speed;
                       
                       //PORTAL
                          if(x==526){
                            x=110;
                          }
                       
                     }/*else{
                        if(millis() > lastCollision + 2000){
                          //println("ohhai");
                          lastCollision = millis();
                          song = minim.loadSnippet("Hey.mp3");
                          song.play();
                        }*/
                     }
                   }
                 
                
                 if (keyCode == UP) {
                   if (y >= half_size + speed)
                   {
                     up_left = collisionMap[x - half_size][y - speed - half_size];
                     up_right = collisionMap[x + half_size][y - speed - half_size];
                     down_right = collisionMap[x + half_size][y - speed + half_size];
                     down_left = collisionMap[x - half_size][y - speed + half_size];
                
                     if (up_left && up_right && down_right && down_left) {
                       y -= speed;
                     } /*else{
                        if(millis() > lastCollision + 2000){
                          //println("ohhai");
                          lastCollision = millis();
                          song = minim.loadSnippet("Hey.mp3");
                          song.play();
                        }*/
                     }
                   }
                 
                
                 if (keyCode == DOWN) {
                   if (y <= height - half_size - speed)
                   {
                     up_left = collisionMap[x - half_size][y + speed - half_size];
                     up_right = collisionMap[x + half_size][y + speed - half_size];
                     down_right = collisionMap[x + half_size][y + speed + half_size];
                     down_left = collisionMap[x - half_size][y + speed + half_size];
                
                     if (up_left && up_right && down_right && down_left) {
                       y += speed;
                     } /*else{
                        //y += speed; /// CHANGE THIS
                        if(millis() > lastCollision + 2000){
                          //println("ohhai");
                          lastCollision = millis();
                          song = minim.loadSnippet("Hey.mp3");
                          song.play();
                        }*/
                     }
                   }
                 

    
                 }
  
  
  void displayR(){
        frameR = (frameR+1) % numFramesR;
        image(imagesR[frameR], x, y);
        
        
  }
  void displayL(){
        frameL = (frameL+1) % numFramesL;
        image(imagesL[frameL], x, y);
  }
  void displayU(){
        frameU = (frameU+1) % numFramesU;
        image(imagesU[frameU], x, y);
  }
  void displayD(){
        frameD = (frameD+1) % numFramesD;
        image(imagesD[frameD], x, y);
  }
  
  
                 }

