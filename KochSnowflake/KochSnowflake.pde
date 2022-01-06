int startLvl = 0;
void setup() {
  size(1000, 1000);
}

void draw() {
  background(50);
  PVector a = new PVector(200, 250);
  PVector b = new PVector(800, 250);
  float len = a.dist(b);
  float y = sqrt((len * len) - (len / 2 * len / 2));
  PVector c = new PVector(len / 2 + a.x, y + 250);
  
  Snowflake(a, b, startLvl);
  Snowflake(b, c, startLvl);
  Snowflake(c, a, startLvl);
}

void Snowflake(PVector a, PVector b, int lvl) {
  stroke(255);
  if(lvl == 0) line(a.x, a.y, b.x, b.y);
  else {
    PVector oneThirdVec = PVector.div((PVector.sub(b, a)), 3);
    // First Segment
    PVector childVec1 = PVector.add(a, oneThirdVec);
    Snowflake(a, childVec1, lvl - 1);
    
    // Second Segment
    PVector childVec2 = PVector.sub(b, oneThirdVec);
    Snowflake(childVec2, b, lvl - 1);
   
    // Third Segment
    oneThirdVec.rotate((float)(-PI / 3));
    PVector childVec3 = PVector.add(childVec1, oneThirdVec);
    Snowflake(childVec1, childVec3, lvl - 1);
    
    // Fourth Segment
    Snowflake(childVec3, childVec2, lvl - 1);
  }
}

void mouseClicked() {
   if(mouseButton == LEFT) startLvl++;
   if(mouseButton == RIGHT && ((startLvl - 1) != -1)) startLvl--;
}
