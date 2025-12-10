class Projectile{
  
  int size;
  PVector direction; // has to contain horizontal & vertical direction
  PVector position;
  int speed;
  boolean launch;
  
  Projectile(int sz, int spd){
    size = sz;
    speed = spd;
    launch = false;
    direction = new PVector(1, -1);
    position = new PVector(pddl.x, (pddl.y - 20) + size); // height value should be height of the paddle
  } // default
  Projectile(int size){
    this(size, 1);
  } // size args
  Projectile(){
    this(10,1);
  } // no args
  
  void bounceWalls(){
    if(position.x >= width - size/2){
      direction.x = -1;
    }
    if(position.x <= size/2){
      direction.x = 1;
    }
    if(position.y <= size/2){
      direction.y = 1;
      println(str(direction.y) + "hit top");
    }
  }
  
  void move(){
    if(launch){
      bounceWalls();
      position.x += direction.x * speed;
      position.y += direction.y * speed;
    }
  }
  
  void display(){
    circle(position.x, position.y, size);
  }
  
}
