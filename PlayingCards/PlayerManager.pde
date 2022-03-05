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
  
  void addCardTo(int id, int suit, int num){
    if(self.id == id){
      self.hand.cards.add(new Card(num, suit));
    }
    getPlayerById(id).hand.nCards++;
  }
  
  void removeCardFrom(int id, int suit, int num){
    if(self.id == id){
      for(Card c : self.hand.cards){
        if(c.suit == suit && c.number == num){
          self.hand.cards.remove(c);
          break;
        }
      }
    }
    getPlayerById(id).hand.nCards--;
  }
}
