class Block{
  
  int size;
  PVector loc; // stands for "location"
  boolean destroyed;
  
  Block(){
    
  }
  
  Block(int x, int y, int sz){
    loc = new PVector(x, y);
    size = sz;
    destroyed = false;
  }
  
  void reset(){
    destroyed = false;
  }
  
  void display(){
    if(!destroyed){
      rectMode(CENTER);
      fill(255, 100, 100);
      rect(loc.x, loc.y, size, 20);
    }
  }
  
  // check if projectile hits this block
  boolean checkCollision(Projectile p){
    if(destroyed) return false;
    
    // check if projectile is within block boundaries
    if(p.position.x + p.size/2 > loc.x - size/2 && 
       p.position.x - p.size/2 < loc.x + size/2 &&
       p.position.y + p.size/2 > loc.y - 10 &&
       p.position.y - p.size/2 < loc.y + 10){
      destroyed = true;
      return true;
    }
    return false;
  }
}
