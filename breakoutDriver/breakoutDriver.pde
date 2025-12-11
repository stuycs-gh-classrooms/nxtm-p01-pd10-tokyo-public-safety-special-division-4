/*

*/

Paddle pddl;
Projectile proj;
Block[][] grid;
int cols = 16;
int rows = 4;
boolean playing = false;
PVector blockSize;
int gridHeight = 40; // how far from top of screen grid appears

void setup(){
  size(800,400);
  background(180);
  frameRate(60);
  pddl = new Paddle();
  proj = new Projectile();
  grid = new Block[cols][rows];
  
  // create the block grid
  blockSize = new PVector(width/cols, 40);
  for(int i=0; i<grid.length; i++){
    for(int j=0; j<grid[i].length; j++){
      grid[i][j] = new Block(i * int(blockSize.x), gridHeight + j * int(blockSize.y), blockSize);
    }
  }
  
  proj.display();
  pddl.display();
  for(int i=0; i<grid.length; i++){
      for(int j=0; j<grid[i].length; j++){
        grid[i][j].display();
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
    
    // check collision with all blocks
    for(int i=0; i<grid.length; i++){
      for(int j=0; j<grid[i].length; j++){
        if(grid[i][j].checkCollision(proj)){
          proj.direction.y *= -1; // bounce projectile down
        }
      }
    }
    
    // check collision with paddle
    if(proj.position.x + proj.size/2 > pddl.x - pddl.size/2 &&
       proj.position.x - proj.size/2 < pddl.x + pddl.size/2 &&
       proj.position.y + proj.size/2 > pddl.y - 5 &&
       proj.position.y - proj.size/2 < pddl.y + 5){
      proj.direction.y = -1; // bounce up
    }
    
    pddl.display();
    for(int i=0; i<grid.length; i++){
      for(int j=0; j<grid[i].length; j++){
        grid[i][j].display();
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
   // recreate the block grid
   for(int i=0; i<grid.length; i++){
     for(int j=0; j<grid[i].length; j++){
       grid[i][j] = new Block(i * int(blockSize.x), gridHeight + j * int(blockSize.y), blockSize);
     }
   }
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
