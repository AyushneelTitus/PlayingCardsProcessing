String numberStrings[] = {"A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"};
String suitStrings[] = {"S", "C", "H", "D"};

String getCardAsString(Card card) {
  return (numberStrings[card.number] + " " + suitStrings[card.suit]);
}

class Pack {
  ArrayList<Card> cards;

  Pack() {
  }

  ArrayList<Card> getCards() {
    return cards;
  }
}
