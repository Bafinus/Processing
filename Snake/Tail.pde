class Tail {
  float size = 30;
  Head hParent = null;
  Tail tParent = null;
  PVector pos = new PVector();
  PVector oldPos = new PVector();
  
  Tail (PVector pos_, Head parent) {
    hParent = parent;
    pos.set(pos_);
  }
  
  Tail (PVector pos_, Tail parent) {
    tParent = parent;
    pos.set(pos_);
  }
  
  void show () {
    noStroke();
    fill(255,255,255);
    rect(pos.x, pos.y, size, size);
  }
  
  void update() {
    if(hParent != null) {
      oldPos.set(pos.x, pos.y);
      pos.set(hParent.oldPos.x, hParent.oldPos.y);
    }
    else if(tParent != null) {
      oldPos.set(pos.x, pos.y);
      pos.set(tParent.oldPos.x, tParent.oldPos.y);
    }
  }
}
