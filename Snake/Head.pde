class Head {
  int size = 30;
  int hop = size;
  PVector pos = new PVector();
  PVector oldPos = new PVector();
  int dir = 37;

  ArrayList<Tail> tails = new ArrayList();

  Head (float x, float y) {
    pos.set(x, y);
  }

  void show () {
    noStroke();
    fill(30, 90, 100);
    rect(pos.x, pos.y, size, size);

    showTails();
  }

  private void showTails() {
    for (Tail tail : tails) {
      tail.show();
    }
  }

  void addTail() {
    PVector p = new PVector();
    if (tails.size() == 0) {
      p.set(head.oldPos);
      tails.add(new Tail(p, this));
    } else {
      Tail lastTail = tails.get(tails.size() - 1);
      p.set(lastTail.oldPos);
      tails.add(new Tail(p, lastTail));
    }
  }

  private void moveTails() {
    for (Tail tail : tails) {
      tail.update();
    }
  }

  void Dir(int dir_) {
    switch(dir_) {
    case 38:
      if (dir != 40) dir = dir_;
      break;
    case 40:
      if (dir != 38) dir = dir_;
      break;
    case 37:
      if (dir != 39) dir = dir_;
      break;
    case 39:
      if (dir != 37) dir = dir_;
      break;
    }
  }
  void move() {
    switch(dir) {
    case 38:
      moveUP();
      break;
    case 40:
      moveDOWN();
      break;
    case 37:
      moveLEFT();
      break;
    case 39:
      moveRIGHT();
      break;
    }

    moveTails();
  }

  private void moveUP() {
    oldPos.set(pos.x, pos.y);
    pos.set(pos.x, pos.y - hop);
  }

  private void moveDOWN() {
    oldPos.set(pos.x, pos.y);
    pos.set(pos.x, pos.y + hop);
  }

  private void moveLEFT() {
    oldPos.set(pos.x, pos.y);
    pos.set(pos.x - hop, pos.y);
  }

  private void moveRIGHT() {
    oldPos.set(pos.x, pos.y);
    pos.set(pos.x + hop, pos.y);
  }

  boolean checkCollisionTail() {
    boolean r = false;
    for (Tail tail : tails) {
      PVector posTail = tail.pos;
      float dist = dist(pos.x, pos.y, posTail.x, posTail.y);

      if (dist < 1) {
        println("game over");
        r = true;
        tails.clear();
        break;
      } else {
        r = false;
      }
    }

    return r;
  }
  
  boolean checkCollisionBounds() {
    boolean r = false;
    float cols = floor(width / size);
    float rows = floor(height / size);
    
    // Collision Bounds X
    if(pos.x < 0 && r == false) {
      tails.clear();
      pos.set(cols / 2 * size, rows / 2 * size);
      r = true;
    }
    if(pos.x > width && r == false) {
      tails.clear();
      pos.set(cols / 2 * size, rows / 2 * size);
      r = true;
    }
    
    // Collision Bounds Y
    if(pos.y < 0 && r == false) {
      tails.clear();
      pos.set(cols / 2 * size, rows / 2 * size);
      r = true;
    }
    if(pos.y > height && r == false) {
      tails.clear();
      pos.set(cols / 2 * size, rows / 2 * size);
      r = true;
    }
    
    return r;
  }
}
