class Projectile{
  
  int size;
  PVector direction; // has to contain horizontal & vertical direction
  PVector position;
  int speed;
  
  Projectile(int sz, int spd){
    size = sz;
    speed = spd;
    direction = 1,1;
  }
  Projectile(int size){
    this(size, 1);
  }
  Projectile(){
    this(10,1);
  }
  
  void bounce(){
    // empty 4 now
  }
  
  void move(){
    position.x += direction.x * speed;
    position.y += direction.y * speed;
  }
  
  void display(){
    
  }
  
}
