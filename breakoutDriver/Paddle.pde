class Paddle{
  
  int size;
  int x;
  int y;
  
  Paddle(int sz){
    size = sz;
    x = width / 2;
    y = height - 50;
  }
  Paddle(){
    this(80);
  }
  
  void move(int kpress){
    if(kpress == LEFT){
      x -= 8;
    }
    if(kpress == RIGHT){
      x += 8;
    }
  }
  
  void display(){
    rectMode(CENTER);
    rect(x, (y), size, 10);
  }
}
