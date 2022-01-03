class Segment {
  PVector a, b = new PVector();
  float angle = 0;
  float len;
  float sw = 0;
  Segment parent = null;
  Segment child = null;
  
  Segment(float x, float y, float len_, float i) {
    a = new PVector(x, y);
    sw = map(i, 0, 20, 1, 10);
    len = len_;
    calculateB();
  }
  
  Segment(Segment parent_, float len_, float i) {
    parent = parent_;
    sw = map(i, 0, 20, 1, 10);
    a = parent_.b.copy();
    len = len_;
    calculateB();
  }
  
  void follow() {
   float tx = child.a.x;
   float ty = child.a.y;
   follow(tx, ty);
  }
  
  void follow(float tx, float ty) {
    PVector target = new PVector(tx, ty);
    PVector dir = PVector.sub(target, a);
    // .heading() calculates angle between PVectors
    angle = dir.heading();
    
    dir.setMag(len);
    dir.mult(-1);
    
    a = PVector.add(target, dir);
  }
  
  void calculateB() {
   float dx = len * cos(angle);
   float dy = len * sin(angle);
   b.set(a.x + dx, a.y + dy);
  }
  
  void update() {
   calculateB(); 
  }
  
  void show() {
    stroke(255);
    strokeWeight(sw);
   line(a.x, a.y, b.x, b.y);
  }
}
