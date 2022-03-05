void createLobby(){
  game.playerManager.addSelf(new Player(1, "Player1"));
}

  void connect(){
    println("Client: Connecting...");
    gameClient.sendMessage("0");
  }

void _startGame(){
  currentScene = gameScene;
  currentScene.transitIn();
}

void endGame(){
  game.reset();
  currentScene = lobbyScene;
}

void dealCards(){
  game.board.createDeck();
  //game.board.shuffleDeck();
  
  String msg = "";
  int pId = 0;
  for (int i = 0; i < 8; i++){
    Card c = game.board.deck.cards.get(i);
    msg = "C,B,0,P," + (pId + 1) + "," + c.suit + "," + c.number;
    gameServer.sendMessage(msg);
    pId++;
    pId %= game.playerManager.players.size();
  }
}

void addPlayers(String data){
  //String.split(data, ';');
}

void processMessageCmn(String data){
  println(data);
  String[] args = split(data, ',');
  int msgrId = Integer.parseInt(args[0]);
  println("msgrId=" + msgrId);
  if(game.playerManager.self == null)
  {
    println("Player not found.");
    return;
  }
  if(msgrId == game.playerManager.self.id){
    println("matches self id.");
    return;
  }
  println(args[1]);
  
  int playerId;
  switch(args[1]){
    case "C":
      int id = Integer.parseInt(args[3]);
      int suit = Integer.parseInt(args[6]);
      int num = Integer.parseInt(args[7]);
      if(args[2].equals("B")){
        game.board.removeCardFrom(id, suit, num);
      }else if(args[2].equals("P")){
        game.playerManager.removeCardFrom(id, suit, num);
      }else
        println("noCardsRemoved");
      
      id = Integer.parseInt(args[5]);
      if(args[4].equals("B")){
        game.board.addCardTo(id, suit, num);
      }else if(args[4].equals("P")){
        println("/add card to player");
        game.playerManager.addCardTo(id, suit, num);
      } else
        println("noCardsAdded");
      break;
    
    case "E":
      endGame();
    
    case "S":
      println("startGame called");
      _startGame();
      break;
    
    case "P":
      playerId = Integer.parseInt(args[2]);
      boolean matches = false;
      for(Player p : game.playerManager.players){
        if (p.id == playerId){
          matches = true;
          break;
        }
      }
      if(!matches){
        game.playerManager.players.add(new Player(playerId, args[3]));
      }
      break;
    
    default:
      break;
  }
}

//------------------//

interface Action{
  void execute(String data);
}

class Protocol{
  int id;
  Action action;
  
  Protocol(int id, Action action){
    this.id = id;
    this.action = action;
  }
  
  void send(String data){
    gameClient.sendMessage(data);
  }
  
  void execute(String data){
    action.execute(data);
  }
}

ArrayList<Protocol> protocols;

void initProtocols(){
  // protocol list
  //
}
