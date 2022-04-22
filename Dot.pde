class Dot{
  PVector pos;
  PVector vel;
  PVector acc;
  PVector goal = new PVector(width/2, height/2);
  
  Brain brain;
    
  int[] colors = {255,255,255};//new int[3];
  
  boolean dead = false; 
  boolean goalReached = false;
  float fitness = 0;
  
  Dot(){
    brain = new Brain(400);
    
    pos = new PVector( width/2, height-20);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    
  }
  
  //------------------------------------------------------------
  
  void show(){
    fill(colors[0], colors[1], colors[2]);
    circle( pos.x, pos.y, 10);  
  }
  
  //-----------------------------------------------------------
  
  void move(){
    
    if(brain.dir.length > brain.step){
      acc = brain.dir[brain.step];
      brain.step++;
    }
    
    vel.add(acc);
    vel.limit(5);
    pos.add(vel);
  }
  
  //-----------------------------------------------------------
  
  void update(){
    if(!dead && !goalReached){
      move();
      if(pos.x < 5 || pos.y < 5 || pos.x > width-5 || pos.y > height-5 ){
        dead = true;
      }
      if( dist(pos.x, pos.y, goal.x, goal.y) < 5 ){
        goalReached = true;
      }
    }
    
  }
  
  //------------------------------------------------------------
  
  void calFitness(){
    if(goalReached){
      fitness = 1.0/(float)(brain.step * brain.step);
    }else{
      float disToGoal = dist(pos.x, pos.y, goal.x, goal.y);
      fitness = 1.0/(disToGoal * disToGoal);
    }
  }
  //------------------------------------------------------------
  //clone it
  Dot gimmeBaby(){
    Dot baby = new Dot();
    baby.brain = brain.clone();
    return baby;
  }
  
  
}
