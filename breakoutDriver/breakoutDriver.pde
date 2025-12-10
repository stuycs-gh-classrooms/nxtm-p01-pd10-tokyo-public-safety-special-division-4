/*

*/

Paddle pddl;
Projectile proj;
Block[][] grid;
int rows = 16;
int cols = 4;
boolean playing = false;

void setup(){
  size(800,400);
  background(180);
  frameRate(60);
  pddl = new Paddle();
  proj = new Projectile();
  grid = new Block[rows][cols];
  proj.display();
  pddl.display();
  for(int i=0; i<grid.length; i++){
      for(int j=0; j<grid[i].length; j++){
        // grid[i][j].display();
      }
  }
  textAlign(LEFT);
  textSize(20);
  text("q to play/pause, space to launch projectile, arrow keys move paddle", 0, 30);
}

void draw(){
  if(playing){
    background(180);
    proj.move(); // move projectile
    pddl.display();
    for(int i=0; i<grid.length; i++){
      for(int j=0; j<grid[i].length; j++){
        // grid[i][j].display();
      }
    }
    proj.display(); // display everything
  }
}

void keyPressed(){
 if(key == 'q'){
   playing = !playing;
 }
 if(key == 'r'){
   playing = false; // pauses
   pddl = new Paddle();
   proj = new Projectile();
   grid = new Block[rows][cols];
 }
 if(playing){
   if(keyCode == LEFT || keyCode == RIGHT){
     pddl.move(keyCode);
   }
   if(key == ' '){
     proj.launch = true;
   }
 }
}
