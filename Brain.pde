class Brain{
  PVector[] dir;
  int step = 0;
  
  Brain(int size){
    dir = new PVector[size];
    randomize();
    
  }
  
  //------------------------------------------------------------
 
  void randomize(){
   for(int i =0; i < dir.length; i++){
    float randomAngle = random(2*PI);
    dir[i] = PVector.fromAngle(randomAngle);
   }
  }
  //------------------------------------------------------------
  
  Brain clone(){
    Brain clone = new Brain(dir.length);
    
    for(int i=0; i < dir.length; i++){
      clone.dir[i] = dir[i];
    }
     
    return clone;
  }
  //------------------------------------------------------------
  
  void mutate(){
    float mutateRate = .001;
    
    for(int i=0; i < dir.length; i++){
      float rand = random(1);
      if(rand < mutateRate){
        //set this direction as a random direction
        dir[i] = PVector.fromAngle(random(2*PI));
      }
    }
  }
  
}
