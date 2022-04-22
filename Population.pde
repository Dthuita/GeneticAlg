
class Population{
  Dot[] dots;
  float fitSum;
  int gen=0;
  
  Population(int size){
    dots = new Dot[size];
    for(int i = 0; i < size; i++){
      dots[i] = new Dot();
    }
  }
  
  //------------------------------------------------------------
  
  void show(){
    for(int i=0; i < dots.length; i++){
      dots[i].show();
    }
  }
  
  //------------------------------------------------------------
  
  void update(){
    for(int i =0; i < dots.length; i++){
      dots[i].update();
    }
  }
  
  //------------------------------------------------------------
  
  void calFitness(){
    for(int i = 0; i < dots.length; i++){
      dots[i].calFitness();
    }
  }
  
  //------------------------------------------------------------
  
  boolean allDotsDead(){
    for(int i =0; i< dots.length; i++){
      if(!dots[i].dead && !dots[i].goalReached){
        return false;
      }
    }
    
    //tell how many dots got to goal per gen
    int suc = 0; //stands for successes you dirty mind
    for(int i=0; i < dots.length; i++){
      if( dots[i].goalReached ){
        suc++;
      }
    }
    float percent = suc /900.0; //dividing by int will round to 0.0
    println("success:" + suc + "  or  " + 100.0*percent + "%"); //same with multiplying by a int will round way too high
    return true;
  }
  
  //------------------------------------------------------------
  
  void naturalSelection(){
    
        
    //change best dot color to green and mutated dots to purple
    //this works but dot thatdidbest last time wont neccessarily do best next time
    int best = 0;
    for(int i =0; i< test.dots.length; i++){
      if(dots[i].goalReached){
        if(dots[best].brain.step < dots[i].brain.step){
          best = i;
          println(best);
        }
      }
    }
    
    Dot[] newDots = new Dot[dots.length];
    calFitnessSum();
    
    for(int i=0; i < newDots.length; i++){
      
      //select parent based on fitness
      Dot parent  = selectParent(); 
      //get baby from them
      newDots[i] = parent.gimmeBaby();
    }
    dots = newDots;
    
    println(best);
    //assign dot green
    dots[best].colors[0]=34;
    dots[best].colors[1]=139;
    dots[best].colors[2]=34;
    
    gen++;
    println("Generation #" + gen);
  }
  
  //------------------------------------------------------------
  
  void calFitnessSum(){
    fitSum = 0;
    for(int i = 0; i < dots.length; i++){
      fitSum += dots[i].fitness;
    }
    
  }
  
  //------------------------------------------------------------
  
  Dot selectParent(){
    float rand = random(fitSum);
    
    float runningSum = 0; 
    
    for(int i = 0; i < dots.length; i++){
      runningSum  += dots[i].fitness; 
      if(runningSum > rand){
        return dots[i];  
      }
    }
    //shouldn't get to this point
    return null;//some times the running sum is very low compare to fit sum and dot gets killed off
  }
  
  //------------------------------------------------------------

  void mutateDeBabies(){
    for(int i= 0; i < dots.length; i++){
      dots[i].brain.mutate();
    }
  }
}
