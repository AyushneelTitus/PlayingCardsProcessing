
class GameClient{
  Client client;
  int id;
  GameClient(Client client){
    this.client = client;
    id = 0;
    
  }
  
  void readMessage(){
    if(client.available() > 0){
      String data = client.readString();
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
      println(data);
    }
    else if(id == 0){
      id = Integer.parseInt(data);
      println("Connected. My id is : " + id);
    }
  }
  
  void connect(){
    println("Client: Connecting...");
    client.write("0");
  }
}

void startClient(){ //<>//
  gameClient = new GameClient(new Client(this, "127.0.0.1", 5000));
}

void closeClient(){
  gameClient.end();
}
