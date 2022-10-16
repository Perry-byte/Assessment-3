import controlP5.*;

ControlP5 cp5;
int limbs;
float innerRadius;
float outerRadius;

void setup() {
  background(255);
  //presets
  size(1000,900);
  background(255,0,60);
  rectMode(CENTER);
  rect(500,450,900,900);
  fill(0);
  textSize(75);
  text("Biscuit Simulator",200,80);
  textSize(45);
  text("Choose the dough, filling and design",100,180);
  textSize(45);
  text("Dough",100,300);
  fill(145,100,0,90);
  circle(170,400,100.0);
  fill(145,100,0,200);
  circle(170,525,100.0);
  fill(78,53,36,255);
  circle(170,650,100.0);
  fill(78,53,36,255);
  circle(170,650,100.0);
  fill(255);
  circle(170,775,100.0);
  fill(0);
  textSize(20);
  text("Random",130,780);
  textSize(45);
  text("Filling",430,300);
  fill(166,10,61);
  circle(500,375,75);
  fill(224,112,124);
  circle(500,480,75);
  fill(130,163,255);
  circle(500,585,75);
  fill(237,139,0);
  circle(500,690,75);
  fill(255);
  circle(500,795,75);
  fill(0);
  textSize(20);
  text("Random",460,860);
  textSize(45);
  text("Design",750,300);
  cp5 = new ControlP5(this);
  cp5.addSlider("setLimbs").setRange(3,25).setValue(limbs).setPosition(720,400).setSize(200, 30).setCaptionLabel("Number of Limbs").setSliderMode(Slider.FLEXIBLE).setTriggerEvent(Slider.RELEASED);
  cp5.getController("setLimbs").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingY(5).setColor(#000000);
  cp5.addSlider("setInnerRadius").setRange(3,70).setValue(innerRadius).setPosition(720,500).setSize(200, 30).setCaptionLabel("Inner Radius").setSliderMode(Slider.FLEXIBLE).setTriggerEvent(Slider.RELEASED);
  cp5.getController("setInnerRadius").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingY(5).setColor(#000000);
  cp5.addSlider("setOuterRadius").setRange(3,70).setValue(outerRadius).setPosition(720,600).setSize(200, 30).setCaptionLabel("Outer Radius").setSliderMode(Slider.FLEXIBLE).setTriggerEvent(Slider.RELEASED);
  cp5.getController("setOuterRadius").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingY(5).setColor(#000000);
  fill(0,255,0,200);
  circle(820,750,100);
  fill(21,71,52);
  textSize(22);
  text("Confirm",775,750);
  textSize(22);
  text("Design",780,773);
}

void setLimbs(int limbs)
{
  this.limbs = limbs;
}

void setInnerRadius(int innerRadius)
{
  this.innerRadius = innerRadius;
}

void setOuterRadius(int outerRadius)
{
  this.outerRadius = outerRadius;
}

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
     translate(outerRadius*j, outerRadius*i);
     stroke(145,100,0,90);
     fill(145,100,0,90);
     circle(0,0,150);
     quadraticForm(int(random(3, 25)), int(random(3, 70)), int(random(3, 70)));
     //polygon(4,60);
     popMatrix();
    }
  }
}

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
 fill(random(0,255),random(0,255),random(0,255));
 endShape();
} // end quadraticForm

void polygon(int sideCount, float radius) {

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
