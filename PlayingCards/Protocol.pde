void createLobby(){
  game.playerManager.players.add(game.playerManager.self);
}

void getLobby(){
  gameClient.sendMessage("1");
}

void addPlayers(String data){
  //String.split(data, ';');
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
