class PlayerManager{
  ArrayList<Player> players;
  Player self;
  
  PlayerManager(){
    players = new ArrayList<Player>();
  }
  
  ArrayList<Player> getPlayers(){
    return players;
  }
  
  void addSelf(Player player){
    self = player;
    players.add(player);
  } 
  
  Player getPlayerById(int id){
    for(Player player : players){
      if(player.id == id){
        return player;
      }
    }
    return null;
  }
}
