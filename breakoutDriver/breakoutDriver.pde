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
  frameRate(60);
  pddl = new Paddle();
  proj = new Projectile();
  grid = new Block[rows][cols];
}

void draw(){
  background(0);
  proj.move(); // move projectile
  pddl.display();
  for(int i=0; i<grid.length; i++){
    for(int j=0; j<grid[i].length; j++){
      // grid[i][j].display();
    }
  }
  proj.display(); // display everything
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
 if(keyCode == LEFT || keyCode == RIGHT){
   pddl.move(keyCode);
 }
 /* i'd like to create a "launch" function at some point
 if(key == ' '){
   
 }
 */
}
