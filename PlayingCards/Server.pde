class GameServer{
  Server server;
  int nclients;
  
  GameServer(Server server){
    this.server = server;
    nclients = 1;
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
    nclients = 1;
    server.stop();
  }

  void processMessage(String data){
    println("Server: message received");
    data = data.substring(0,data.length() - 1);
    
    if(data.charAt(0) == '0'){
      nclients++;
      println("New client connected. Id : " + nclients);
      server.write("0," + nclients + ";");
    }
    else{
      String[] args = split(data, ',');
      int msgrId = Integer.parseInt(args[0]);
      
      String msg = "";
      
      switch(args[1]){
        case "p":
          int playerId = Integer.parseInt(args[2]);
          game.playerManager.players.add(new Player(playerId, args[3]));
          for(Player p : game.playerManager.players){
            msg += p.id + ",P," + p.getPlayerAsString() + ";";
          }
          server.write(msg);
          break;
        
        default:
          msg = data;
          processMessageCmn(data);
          server.write(msg);
      }
    }
  }
}

void startServer(){
  gameServer = new GameServer(new Server(this, 5000));
}

void closeServer(){
  gameServer.end();
}
