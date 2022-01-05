float angle = PI / 7;
float multiplier = 0.67;
float startLen = 200;

void setup() {
  size(1000, 1000);
}

void draw() {
  translate(width / 2, height);
  background(50);
  stroke(255);
  strokeWeight(3);

  Tree(startLen);
}

void Tree(float len) {
  line(0, 0, 0, -len);
  translate(0, -len);
  
  if (len > 4) {
    push();
    rotate(angle);
    Tree(len * multiplier);
    pop();
    push();
    rotate(-angle);
    Tree(len * multiplier);
    pop();
  }
}
