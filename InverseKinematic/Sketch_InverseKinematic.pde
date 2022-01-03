Segment tentacle;

void setup(){
  size(2000,  1000);
  
  Segment current = new Segment(300, 200, 100, 1);
  for(int i = 0; i < 4; i++) {
    Segment next = new Segment(current, 100, i);
    current.child = next;
    current = next; 
  }
  
  tentacle = current;
}

void draw() {
  background(50);
  
  tentacle.follow(mouseX, mouseY);
  tentacle.update();
  tentacle.show();
  Segment next = tentacle.parent;
  while(next != null) {
    next.follow();
    next.update();
    next.show();
    next = next.parent;
  }
}

 
