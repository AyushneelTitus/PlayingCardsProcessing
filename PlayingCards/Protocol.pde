void createLobby(){
  game.playerManager.addSelf(new Player(1, "Player1"));
}

  void connect(){
    println("Client: Connecting...");
    gameClient.sendMessage("0;");
  }

void startGame(){
  gameServer.sendMessage("S");
  currentScene = gameScene;
}

void dealCards(){
  game.board.createDeck();
  game.board.shuffleDeck();
  
  String msg = "";
  int pId = 0;
  for (int i = 0; i < 52; i++){
    Card c = game.board.deck.cards.get(i);
    msg += "C,B,0,P," + pId + "," + c.suit + "," + c.number;
    gameServer.sendMessage(msg);
  }
}

void addPlayers(String data){
  //String.split(data, ';');
}

void processMessageCmn(String data){
  String[] args = split(data, ',');
  int msgrId = Integer.parseInt(args[0]);
  
  if(game.playerManager.self == null)
  {
    println("Player not found.");
    return;
  }
  if(msgrId == game.playerManager.self.id){
    return;
  }
  
  int playerId;
  switch(args[1]){
    case "C":
      int id = Integer.parseInt(args[3]);
      int suit = Integer.parseInt(args[6]);
      int num = Integer.parseInt(args[7]);
      if(args[2] == "B"){
        game.board.removeCardFrom(id, suit, num);
      }else if(args[2] == "P"){
        game.playerManager.removeCardFrom(id, suit, num);
      }
      
      id = Integer.parseInt(args[5]);
      if(args[4] == "B"){
        game.board.addCardTo(id, suit, num);
      }else if(args[4] == "P"){
        game.playerManager.addCardTo(id, suit, num);
      }
      break;
    
    case "E":
      game.reset();
    
    case "S":
      startGame();
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
