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
}
