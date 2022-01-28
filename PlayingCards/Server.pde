class GameServer{
  Server server;
  int nclients;
  
  GameServer(Server server){
    this.server = server;
    nclients = 0;
  }
  
  void readAndBroadcast(){
    Client client = server.available();
    if(client != null){
      String whatClientSaid = client.readString();
      if (whatClientSaid != null) {
        processMessage(whatClientSaid);
      } 
    }
  }
  
  void end(){
    nclients = 0;
    server.stop();
  }

  void processMessage(String data){
    println("Server: message received");
    if(data.charAt(0) == '0'){
      nclients++;
      println("New client connected. Id : " + nclients);
      server.write("0" + nclients);
    }
    else{
      server.write(data);
    }
  }
}
