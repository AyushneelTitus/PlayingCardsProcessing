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
  
}
