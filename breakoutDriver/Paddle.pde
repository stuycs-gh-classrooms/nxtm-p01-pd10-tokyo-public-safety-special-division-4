class Paddle{
  
  int size;
  int x;
  int y;
  
  Paddle(int sz){
    size = sz;
    x = width / 2;
    y = height - 50;
  } // default
  Paddle(){
    this(80);
  } // no args
  
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
