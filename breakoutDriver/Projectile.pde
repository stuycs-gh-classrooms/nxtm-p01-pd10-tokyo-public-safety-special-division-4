class Projectile{
  
  int size;
  PVector direction; // has to contain horizontal & vertical direction
  PVector position;
  int speed;
  
  Projectile(int sz, int spd){
    size = sz;
    speed = spd;
    direction = new PVector(1, -1);
    position = new PVector(width / 2, (pddl.y - 20) + size); // height value should be height of the paddle
  } // default
  Projectile(int size){
    this(size, 1);
  } // size args
  Projectile(){
    this(10,1);
  } // no args
  
  void bounce(){
    // empty 4 now
  }
  
  void move(){
    position.x += direction.x * speed;
    position.y += direction.y * speed;
  }
  
  void display(){
    circle(position.x, position.y, size);
  }
  
}
