class Board {
  Pack deck, main, side;
  
  Board(){
    deck = new Pack();
    main = new Pack();
    side = new Pack();
  }
  
  void createDeck(){
    for (int i = 0; i < 4; i++){
      for (int j = 0; j < 13; j++) {
        deck.cards.add(new Card(j + 1, i + 1));
      }
    }
  }
  
  void shuffleDeck(){
    for (int i = 0; i < 4; i++){
      for (int j = 0; j < 13; j++) {
        int idx = i * 13 + j;
        int rand = floor(random(52));
        print(rand + ",");
        Card c = deck.cards.remove(rand);
        deck.cards.add(idx, c);
      }
    }
    println();
  }
  
  void reset(){
    deck.cards.clear();
    main.cards.clear();
    side.cards.clear();
  }
  
  void printDeck(){
    for (int i = 0; i < 52; i++){
      print(getCardAsString(deck.cards.get(i)) + ",");
    }
    println();
  }
  
    void addCardTo(int id, int suit, int num){
    if(id == 1){
      main.cards.add(new Card(num, suit));
      main.nCards++;
    }
    else if(id == 2){
      side.cards.add(new Card(num, suit));
      side.nCards++;
    }
  }
  
  void removeCardFrom(int id, int suit, int num){
    if(id == 1){
      for(Card c : main.cards){
        if(c.suit == suit && c.number == num){
          main.cards.remove(c);
          main.nCards++;
          break;
        }
      }
    }
    else if(id == 2){
      for(Card c : side.cards){
        if(c.suit == suit && c.number == num){
          side.cards.remove(c);
          side.nCards++;
          break;
        }
      }
    }
  }
}
