class Paddle{
  
  int size;
  
  Paddle(sz){
    size = sz
  }
  Paddle(){
    this(40);
  }
  
  void move(int kpress){
    if(kpress == LEFT){
      x -= 4;
    }
    if(kpress == RIGHT){
      x += 4;
    }
  }
  
}
