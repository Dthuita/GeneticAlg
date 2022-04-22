Population test;

//PVector goal;

void setup(){
  size(600, 600);
  
  //goal = new PVector(width/2, 20);
  
  test = new Population(100);
  frameRate(70);
}

void draw(){
  background(0);

  fill(202, 0, 20);
  circle(test.dots[0].goal.x, test.dots[0].goal.y, 20);
    
    
  if(test.allDotsDead()) {
    
    //genetic algorithm
    test.calFitness();
    test.naturalSelection();
    test.mutateDeBabies(); //without this function population size decreases?
    
  } else {
    test.update();
    test.show();
  }
  
}
