/*

*/

Paddle pddl;
Projectile proj;
Block[][] grid;
int lives;
int cols = 10;
int rows = 4;
boolean playing = false;
PVector blockSize;
int gridHeight = 40; // how far from top of screen grid appears

void setup(){
  size(800,400);
  background(180);
  frameRate(60);
  lives = 3;
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
  if(lives == 0){
      background(180);
      playing = false;
      textAlign(CENTER);
      text("GAME OVER", width/2, height/2);
      text("r to restart", width/2, height/2 + 50);
  }
  
  if(playing){
    background(180);
    
    textAlign(LEFT); // display lives + game overs
    text("LIVES: " + str(lives), 0, 20); // shows lives
    
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
    pddl.display(); // paddle display
    
    // displays grid
    for(int i=0; i<grid.length; i++){
      for(int j=0; j<grid[i].length; j++){
        grid[i][j].display();
      }
    }
    proj.display();
  }
}

void keyPressed(){
 if(key == 'q'){
   playing = !playing;
 }
 if(key == 'r'){
   reset();
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

void reset(boolean alive){
  pddl = new Paddle();
  proj = new Projectile();
  if(!alive){
    lives = 3; // set lives to 3
    grid = new Block[cols][rows];
    // recreate the block grid
    for(int i=0; i<grid.length; i++){
      for(int j=0; j<grid[i].length; j++){
        grid[i][j] = new Block(i * int(blockSize.x), gridHeight + j * int(blockSize.y), blockSize);
      }
    }
    playing = false; // pauses
  }
}
void reset(){
  reset(false);
}
  
