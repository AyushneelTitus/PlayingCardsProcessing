void createLobby(){
  game.playerManager.addSelf(new Player(1, "Player1"));
}

  void connect(){
    println("Client: Connecting...");
    gameClient.sendMessage("0;");
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
