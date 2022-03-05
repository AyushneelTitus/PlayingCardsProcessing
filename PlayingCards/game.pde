//UiManager uiManager;

class Game{
  PlayerManager playerManager;
  Board board;
  
  Game(){
    //Game constructor. initialize variables.
  }
  
  void init(){
    //initialize game
    println("starting game");
    
    playerManager = new PlayerManager();
    board = new Board();
    /*
    Pack pack = new Pack();
    UiHand uiHand;
    uiHand = new UiHand(width / 2, height - 150, pack);
    playerManager = new PlayerManager();
    playerManager.getPlayers().add(new Player(1, "Player1"));
    playerManager.getPlayers().add(new Player(2, "Player2"));
    playerManager.getPlayers().add(new Player(3, "Player3"));
    playerManager.addSelf(new Player(4, "Player4", true));
    UiPlayers uiPlayers = new UiPlayers(width / 2, 100, playerManager);
    
    uiPlayers.updateSize();
    
    pack.getCards().add(new Card(1, 1));
    pack.getCards().add(new Card(13, 3));
    pack.getCards().add(new Card(10, 4));

    uiHand.updateSize();
    
    uiManager = new UiManager();
    uiManager.getComponents().add(uiHand);
    uiManager.getComponents().add(uiPlayers);
    */
  }
  
  void reset(){
    board.reset();
  }

  
}
