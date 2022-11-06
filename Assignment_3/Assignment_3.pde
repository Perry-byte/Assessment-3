// Import the library for GUI sliders
import controlP5.*;

// Declare the GUI, user inputs, array of Biscuit objects and the number of current user inputs
ControlP5 cp5;
int limbs;
float innerRadius;
float outerRadius;
Biscuit[] biscuits;
int doughCount;
int fillingCount;
int designCount;
PFont fancyFont;
PFont normalFont;
PFont boldFont;
boolean keyPress;

void setup() {
  // Draw the start screen and initialise the array of Biscuit objects and the number of Biscuit objects
  background(255);
  size(1000,900);
  keyPress = false;
  fancyFont = createFont("Menuetto.ttf", 128);
  normalFont = createFont("calibril.ttf", 25);
  boldFont = createFont("calibrib.ttf", 25);
  textFont(fancyFont);
  biscuits = new Biscuit[16];
  for (int i = 0; i < biscuits.length; i++) {
    biscuits[i] = new Biscuit();
  }
  doughCount = 0;
  background(255,0,60);
  rectMode(CENTER);
  rect(500,450,900,900);
  
  // Write the heading and sub-heading of the start screen
  fill(0);
  textSize(95);
  text("Biscuit Simulator",250,90);
  
  textSize(65);
  text("Choose the dough, filling and design",120,180);
  
  // Draw the Dough sub-heading and the buttons that decide the colour of the biscuits' dough
  textSize(55);
  text("Dough",115,300);
  
  fill(145,100,0,90);
  circle(170,400,100.0);
  
  fill(145,100,0,200);
  circle(170,525,100.0);
  
  fill(78,53,36,255);
  circle(170,650,100.0);
  
  fill(255);
  circle(170,775,100.0);
  
  fill(0);
  textFont(normalFont);
  textSize(25);
  text("Random",130,780);
  
  // Draw the Filling sub-heading and the buttons that decide the colour of the biscuits' filling
  textFont(fancyFont);
  textSize(55);
  text("Filling",450,300);
  
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
  textFont(normalFont);
  textSize(20);
  text("Random",467,800);
  
  // Draw the Design sub-heading and the sliders that decide the shape of the biscuits' design
  textFont(fancyFont);
  textSize(55);
  text("Design",750,300);
  
  cp5 = new ControlP5(this);
  
  cp5.addSlider("setLimbs").setRange(3,25).setValue(limbs).setPosition(720,400).setSize(200, 30).setCaptionLabel("Number of Limbs").setSliderMode(Slider.FLEXIBLE).setTriggerEvent(Slider.RELEASED);
  cp5.getController("setLimbs").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingY(5).setColor(#000000);
  
  cp5.addSlider("setInnerRadius").setRange(3,70).setValue(innerRadius).setPosition(720,500).setSize(200, 30).setCaptionLabel("Inner Radius").setSliderMode(Slider.FLEXIBLE).setTriggerEvent(Slider.RELEASED);
  cp5.getController("setInnerRadius").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingY(5).setColor(#000000);
  
  cp5.addSlider("setOuterRadius").setRange(3,70).setValue(outerRadius).setPosition(720,600).setSize(200, 30).setCaptionLabel("Outer Radius").setSliderMode(Slider.FLEXIBLE).setTriggerEvent(Slider.RELEASED);
  cp5.getController("setOuterRadius").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingY(5).setColor(#000000);
  
  // Draws the Confirm Design button that assigns the current design parameters to the next Biscuit object
  fill(0,255,0,200);
  circle(870,750,100);
  fill(255);
  circle(760,750,100);
  fill(0);
  textFont(normalFont);
  textSize(25);
  text("Random",720,755);
  fill(21,71,52);
  textFont(boldFont);
  textSize(20);
  text("Confirm",837,745);
  textFont(boldFont);
  textSize(20);
  text("Design",842,768);
}

// Assigns the current slider value to its corresponding variable
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
  if (doughCount == 16 && fillingCount == 16 && designCount == 16 && keyPress == false) {
    textFont(boldFont);
    textSize(30);
    text("Press Any Key",250,570);
    text("To Continue",260,600);
  }
}

// When the mouse is clicked, the chosen colour or design is assigned to the next available Biscuit object (this function sops when all Biscuits have been assigned each value)
void mousePressed() {
  if (doughCount < 16) {
    if (mouseOverCircle(170,400,100)) {
      biscuits[doughCount].dough = color(145,100,0,90);
      fill(255);
      stroke(255);
      rect(170,240,40,30);
      fill(0);
      if (doughCount == 15) {
        text("DONE",140,250);
      } else {
        text(doughCount + 1,160,250);
      }
      doughCount++;
    }
    if (mouseOverCircle(170,525,100)) {
      biscuits[doughCount].dough = color(145,100,0,200);
      fill(255);
      stroke(255);
      rect(170,240,40,30);
      fill(0);
      if (doughCount == 15) {
        text("DONE",140,250);
      } else {
        text(doughCount + 1,160,250);
      }
      doughCount++;
    }
    if (mouseOverCircle(170,650,100)) {
      biscuits[doughCount].dough = color(78,53,36,255);
      fill(255);
      stroke(255);
      rect(170,240,40,30);
      fill(0);
      if (doughCount == 15) {
        text("DONE",140,250);
      } else {
        text(doughCount + 1,160,250);
      }
      doughCount++;
    }
    if (mouseOverCircle(170,775,100)) {
      biscuits[doughCount].dough = color(random(255),random(255),random(255));
      fill(255);
      stroke(255);
      rect(170,240,40,30);
      fill(0);
      if (doughCount == 15) {
        text("DONE",140,250);
      } else {
        text(doughCount + 1,160,250);
      }
      doughCount++;
    }
  }
  
  if (fillingCount < 16) {
    if (mouseOverCircle(500,375,75)) {
      biscuits[fillingCount].filling = color(166,10,61);
      fill(255);
      stroke(255);
      rect(500,235,40,30);
      fill(0);
      if (fillingCount == 15) {
        text("DONE",470,250);
      } else {
        text(fillingCount + 1,490,250);
      }
      fillingCount++;
    }
    if (mouseOverCircle(500,480,75)) {
      biscuits[fillingCount].filling = color(224,112,124);
      fill(255);
      stroke(255);
      rect(500,235,40,30);
      fill(0);
      if (fillingCount == 15) {
        text("DONE",470,250);
      } else {
        text(fillingCount + 1,490,250);
      }
      fillingCount++;
    }
    if (mouseOverCircle(500,585,75)) {
      biscuits[fillingCount].filling = color(130,163,255);
      fill(255);
      stroke(255);
      rect(500,235,40,30);
      fill(0);
      if (fillingCount == 15) {
        text("DONE",470,250);
      } else {
        text(fillingCount + 1,490,250);
      }
      fillingCount++;
    }
    if (mouseOverCircle(500,690,75)) {
      biscuits[fillingCount].filling = color(237,139,0);
      fill(255);
      stroke(255);
      rect(500,235,40,30);
      fill(0);
      if (fillingCount == 15) {
        text("DONE",470,250);
      } else {
        text(fillingCount + 1,490,250);
      }
      fillingCount++;
    }
    if (mouseOverCircle(500,795,75)) {
      biscuits[fillingCount].filling = color(random(255),random(255),random(255));
      fill(255);
      stroke(255);
      rect(500,235,40,30);
      fill(0);
      if (fillingCount == 15) {
        text("DONE",470,250);
      } else {
        text(fillingCount + 1,490,250);
      }
      fillingCount++;
    }
  }
  
  if (designCount < 16) {
    if (mouseOverCircle(760,750,100)) {
      biscuits[designCount].limbs = (int)random(3,25);
      biscuits[designCount].innerRadius = (int)random(3,70);
      biscuits[designCount].outerRadii = (int)random(3,70);
      fill(255);
      stroke(255);
      rect(820,235,40,30);
      fill(0);
      if (designCount == 15) {
        text("DONE",800,250);
      } else {
        text(designCount + 1,810,250);
      }
      designCount++;
    }
    if (mouseOverCircle(870,750,100)) {
      biscuits[designCount].limbs = limbs;
      biscuits[designCount].innerRadius = innerRadius;
      biscuits[designCount].outerRadii = outerRadius;
      fill(255);
      stroke(255);
      rect(820,235,40,30);
      fill(0);
      if (designCount == 15) {
        text("DONE",800,250);
      } else {
        text(designCount + 1,810,250);
      }
      designCount++;
    }
  }
}

// When a key is pressed, an error message appears if not enough inputs have been given or it redraws the background with the completed array of Biscuit objects shown on the screen
void keyPressed() {
  if (doughCount == 16 && fillingCount == 16 && designCount == 16) {
    keyPress = true;
    background(255,0,60);
    fill(255);
    rectMode(CENTER);
    rect(500,450,900,900);
    cp5.hide();
    int rows = 4;
    int cols = 4;
    translate(215,115);
    float outerRadius = 750.0/cols;
    for (int i=0; i<rows; i++) {
      for (int j=0; j<cols; j++) {
        pushMatrix();
        translate(outerRadius*j, outerRadius*i);
        biscuits[i * 4 + j].show();
        popMatrix();
      }
    }
    fill(0);
    textFont(fancyFont);
    textSize(70);
    text("Here are your biscuits",50,730);
  } else {
    fill(255);
    stroke(0);
    rect(325,390,150,50);
    rect(630,390,150,50);
    fill(0);
    text("16 of each",270,400);
    text("16 of each",575,400);
  }
}

// Method that detects when a button is pressed
boolean mouseOverCircle(int x, int y, float diameter) {
  return (dist(mouseX, mouseY, x, y) < diameter*0.5);
}
