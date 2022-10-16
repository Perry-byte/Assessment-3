import controlP5.*;

ControlP5 cp5;
int limbs;
float innerRadius;
float outerRadius;
Biscuit[] biscuits;
int doughCount;
int fillingCount;
int designCount;

void setup() {
  //println("zero");
  background(255);
  //presets
  size(1000,900);
  biscuits = new Biscuit[16];
  for (int i = 0; i < biscuits.length; i++) {
    biscuits[i] = new Biscuit();
  }
  doughCount = 0;
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

void draw() {

}

void mouseClicked() {
  println("zero");
  if (doughCount < 16) {
    if (mouseOverCircle(170,400,100)) {
      biscuits[doughCount].dough = color(145,100,0,90);
      doughCount++;
      println(doughCount);
    }
    if (mouseOverCircle(170,525,100)) {
      biscuits[doughCount].dough = color(145,100,0,200);
      doughCount++;
      println(doughCount);
    }
    if (mouseOverCircle(170,650,100)) {
      biscuits[doughCount].dough = color(78,53,36,255);
      doughCount++;
      println(doughCount);
    }
    if (mouseOverCircle(170,775,100)) {
      biscuits[doughCount].dough = color(random(255),random(255),random(255));
      doughCount++;
      println(doughCount);
    }
  }
  if (fillingCount < 16) {
    if (mouseOverCircle(500,375,75)) {
      biscuits[fillingCount].filling = color(166,10,61);
      fillingCount++;
      println(fillingCount);
    }
    if (mouseOverCircle(500,480,75)) {
      biscuits[fillingCount].filling = color(224,112,124);
      fillingCount++;
      println(fillingCount);
    }
    if (mouseOverCircle(500,585,75)) {
      biscuits[fillingCount].filling = color(130,163,255);
      fillingCount++;
      println(fillingCount);
    }
    if (mouseOverCircle(500,690,75)) {
      biscuits[fillingCount].filling = color(237,139,0);
      fillingCount++;
      println(fillingCount);
    }
    if (mouseOverCircle(500,795,75)) {
      uits[fillingCount].filling = color(random(255),random(255),random(255));
      fillingCount++;
      println(fillingCount);
    }
  }
  if (designCount < 16) {
    if (mouseOverCircle(820,750,100)) {
      biscuits[designCount].limbs = limbs;
      biscuits[designCount].innerRadius = innerRadius;
      biscuits[designCount].outerRadii = outerRadius;
      designCount++;
      println(limbs);
      println(innerRadius);
      println(outerRadius);
    }
  }
}

void keyPressed() {
  background(255,0,60);
  fill(255);
  rectMode(CENTER);
  rect(500,450,900,900);
  cp5.hide();
  int rows = 4;
  int cols = 4;
  translate(215,115);
  
}

boolean mouseOverCircle(int x, int y, float diameter) {
  return (dist(mouseX, mouseY, x, y) < diameter*0.5);
}
