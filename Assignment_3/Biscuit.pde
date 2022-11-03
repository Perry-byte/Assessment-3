class Biscuit {
  // Biscuit variables
  color dough;
  color filling;
  int limbs;
  float innerRadius;
  float outerRadii;
  
  // Method that draws the Biscuit based on its variables
  void show() {
     stroke(dough);
     fill(dough);
     circle(0,0,150);
     quadraticForm(limbs, innerRadius, outerRadii);
  }

// Method that draws the Biscuit design based on its variables
void quadraticForm(int limbs, float controlRadius, float limbRadius) {
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
  }
}
