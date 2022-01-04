Head head = new Head(300, 300);
ArrayList<Apple> apples = new ArrayList();
int size = 30;

float cols = floor(width / size);
float rows = floor(height / size);


void setup() {
  frameRate(10);
  size(600, 600);
  for (int i = 0; i < 1; i++) head.addTail();
  apples.add(new Apple(getRandomPosForApple()));
}

void draw() {
  background(50);
  if (head.checkCollisionTail()) reset();
  if (checkCollisionApple()) head.addTail();
  if (head.checkCollisionBounds()) reset();

  head.show();
  showApples();

  head.move();
  loop();
}

void keyPressed() {
  head.Dir(keyCode);
  loop();
}

void reset() {
  head.tails.clear();
  apples.clear();
  apples.add(new Apple(getRandomPosForApple()));
}

void showApples() {
  for (Apple apple : apples) {
    apple.show();
  }
}

void deleteApple(Apple apple) {
  for (Apple a : apples) {
    if (a.equals(apple)) {
      apples.remove(a);
      break;
    }
  }
}

PVector getRandomPosForApple() {
  int cols = floor(width / size);
  int rows = floor(height / size);
  float x = floor(random(cols));
  float y = floor(random(rows));


  PVector pos = new PVector(x, y);
  pos = pos.mult(size);

  println(pos.x, pos.y);
  return pos;
}

boolean checkCollisionApple() {
  boolean r = false;
  for (Apple apple : apples) {
    PVector pos = apple.pos;
    float dist = dist(head.pos.x, head.pos.y, pos.x, pos.y);

    if (dist < 1) {
      r = true;
      apples.remove(apple);
      apples.add(new Apple(getRandomPosForApple()));

      break;
    } else r = false;
  }

  return r;
}
