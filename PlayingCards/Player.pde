class Player {
  int id;
  String name;
  boolean self;
  Pack hand;

  Player(int id, String name, boolean self) {
    this.id = id;
    this.name = name;
    this.self = self;

    hand = new Pack();
  }

  Player(int id, String name) {
    this(id, name, false);
  }

  Pack getHand() {
    return hand;
  }
}
