class Apple {
  PVector pos = new PVector();
  float size = 30;
  
  Apple (float x, float y) {
    pos.set(x, y);
  }
  
  Apple (PVector pos_) {
    pos.set(pos_);
  }
  
  void show() {
    noStroke();
    fill(255, 0, 0);
    rect(pos.x, pos.y, size, size);
  }
}
