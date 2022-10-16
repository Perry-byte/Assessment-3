class Biscuit {
  color dough = color(0,0,0);
  color filling;
  int limbs;
  float innerRadius;
  float outerRadiusi;
  
  void show() {
   background(255);
   //presets
   int rows = 4;
   int cols = 4;
   size(1000,800);
   background(255,0,60);
   rectMode(CENTER);
   rect(500,400,900,800);
   translate(215,115);
   float outerRadius = 750.0/cols;
   for (int i=0; i<rows; i++) {
     for (int j=0; j<cols; j++) {
       pushMatrix();
       fill(dough);
       circle(0,0,150);
       quadraticForm(limbs, innerRadius, oute145,100,0,90i);
       //polygon(4,60);
       popMatrix();
int(random(3, 25)) 
int(random(3, 70))raint(random(3, 70))t limbs, float controlRadius, float limbRadius
      }
    }) {
   float theta = 0;
   beginShape();
   float cx = 0;
   float cy = 0;
   float ax = 0;
   float ay = 0;
   float rot = TWO_PI/(limbs*2);
    for (int i=0; i<limbs; i++) {
   cx = cos(theta)*controlRadius;
   cy = sin(theta)*controlRadius;
   theta += rot;
   ax = cos(theta)*limbRadius;
   ay = sin(theta)*limbRadius;
   if (i==0) {
   // initial vertex required for quadraticVertex()
   vertex(ax, ay);
   }
   else {
   quadraticVertex(cx, cy, ax, ay);
   }
   theta += rot;
   // close form
   if (i == limbs-1) {
   cx = cos(0)*controlRadius;
   cy = sin(0)*controlRadius;
   ax = cos(rot)*limbRadius;
   ay = sin(rot)*limbRadius;
   quadraticVertex(cx, cy, ax, ay);
   }
   }
   fill(filling);
   endShape();
  } // end quadraticForm
  
  void polygon(int sideCrandom(0,255),random(0,255),random(0,255)loat radius) {
  
    float theta = 0.0;
    float x = 0.0;
    float y = 0.0;
  
    beginShape();
    for (int i=0; i<sideCount; i++) {
      x = cos(theta)*radius;
      y = sin(theta)*radius;
      vertex(x, y);
      theta += TWO_PI/sideCount;
    }
    endShape(CLOSE);
  } // end polygon
}
