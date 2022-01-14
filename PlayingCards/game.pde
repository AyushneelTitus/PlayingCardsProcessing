UiManager uiManager;
UiHand uiHand;

class Game{
  
  
  Game(){
    //Game constructor. initialize variables.
  }
  
  void init(){
    //initialize game
    println("starting game");
//    test1();
    Pack pack = new Pack();
    uiHand = new UiHand(width / 2, height - 150, pack);
    
    pack.getCards().add(new Card(1, 1));
    pack.getCards().add(new Card(3, 13));
    pack.getCards().add(new Card(4, 10));

    uiHand.updateSize();
    
    uiManager = new UiManager();
    uiManager.getComponents().add(uiHand);
  }
  
  void tick(){
  }
  
  void render(){
    uiManager.render();
  }
  
  void onMouseClick(){
    if(uiHand.isClicked()){
      uiManager.onMouseClick();
    }
  }
}
