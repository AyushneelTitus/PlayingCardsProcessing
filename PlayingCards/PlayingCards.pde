Game game;

void setup(){
  size(600, 400);
  game = new Game();
  
  background(51);
  
  game.init();
}

void draw(){
  //background(51);
  game.tick();
  game.render();
}

void mousePressed(){
  game.onMouseClick();
}
