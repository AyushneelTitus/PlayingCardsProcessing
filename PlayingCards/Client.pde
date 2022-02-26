
class GameClient{
  Client client;
  int id;
  GameClient(Client client){
    this.client = client;
    id = 0;
    
  }
  
  void readMessage(){
    if(client.available() > 0){
      String data = client.readStringUntil(';');
      //println("msg = " + data);
      data = data.substring(0,data.length() - 1);
      processMessage(data);
    }
  }
  
  void sendMessage(String msg){
    client.write(id + msg);
  }
  
  void end(){
    id = 0;
    client.stop();
  }
  
  void processMessage(String data){
    if(data.charAt(0) != '0'){
      processMessageCmn(data);
    }
    else if(id == 0){
      String[] args = split(data, ',');
      print("id:" + args[1]);
      id = Integer.parseInt(args[1]);
      println("Connected. My id is : " + id);
      game.playerManager.addSelf(new Player(id, "Player" + id, true));
      sendMessage(id + ",p," + id + ",Player" + id + ";");
      println("join request sent.");
    }
  }
  

}

void startClient(){ //<>//
  gameClient = new GameClient(new Client(this, "127.0.0.1", 5000));
}

void closeClient(){
  gameClient.end();
}
