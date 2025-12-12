class Block{
  
  PVector size;
  PVector loc; // stands for "location"
  boolean destroyed;
  
  Block(int x, int y, PVector sz){
    loc = new PVector(x, y);
    size = sz;
    destroyed = false;
  }
  
  void reset(){
    destroyed = false;
  }
  
  void display(int c){
    if(!destroyed){
      rectMode(CORNER);
      fill(c, 100, 100);
      rect(loc.x, loc.y, size.x, size.y);
    }
  }
  void display(){
    this.display(255);
  }
  
  // check if projectile hits this block
  boolean checkCollision(Projectile p){
    if(destroyed) return false;
    
    // check if projectile is within block boundaries
    if(p.position.x + p.size/2 > loc.x && 
       p.position.x - p.size/2 < loc.x + size.x &&
       p.position.y + p.size/2 > loc.y &&
       p.position.y - p.size/2 < loc.y + size.y){
      destroyed = true;
      return true;
    }
    return false;
  }
}
