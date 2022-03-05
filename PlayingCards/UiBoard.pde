class UiBoard extends UiComponent{
  Board board;
  float cardW = 40, cardH = 60;
  
  UiBoard(Board board){
    super(width / 2, height / 2, 500, 500);
    this.board = board;
  }

  void render(){
    pushMatrix();
    translate(pos.x, pos.y);
    if(board.main.cards.size() > 0)
      displayCard(-100 - cardW / 2, -cardH / 2, cardW - 1, cardH - 1, board.main.cards.get(board.main.cards.size() - 1));
    else
      rect(-100, 0, cardW + 1, cardH + 1);
    if(board.side.cards.size() > 0)
      displayCard(100 - cardW / 2, -cardH / 2, cardW - 1, cardH - 1, board.side.cards.get(board.side.cards.size() - 1));
    else
      rect(100, 0, cardW + 1, cardH + 1);
    
    popMatrix();
  }
  
  void onMouseClick() {
    println("main " + (pos.x - 100 - cardW / 2) + " " + (pos.x - 100 + cardW / 2) + " " + (pos.y - cardH / 2) + " "  + (pos.y + cardH / 2));
    if(mouseX > pos.x - 100 - cardW / 2 && mouseX < pos.x - 100 + cardW / 2
        && mouseY > pos.y - cardH / 2 && mouseY < pos.y + cardH / 2){
      //main deck clicked
      println("main clicked");
      if(board.main.cards.size() > 0){
        Card c = board.main.cards.get(board.main.cards.size() - 1);
        String msg = "C,B,1,P," + game.playerManager.self.id + "," + c.suit + "," + c.number;
        //gameClient.sendMessage(msg);
        processMessageCmn("9," + msg);
      }
    }
    
    println("side " + (pos.x + 100 - cardW / 2) + " " + (pos.x + 100 + cardW / 2) + " " + (pos.y - cardH / 2) + " "  + (pos.y + cardH / 2));
    if(mouseX > pos.x + 100 - cardW / 2 && mouseX < pos.x + 100 + cardW / 2
        && mouseY > pos.y - cardH / 2 && mouseY < pos.y + cardH / 2){
      //side deck clicked
      println("side clicked");
      if(board.main.cards.size() > 0){
        Card c = board.main.cards.get(board.main.cards.size() - 1);
        String msg = "C,B,1,B,2," + c.suit + "," + c.number;
        //gameClient.sendMessage(msg);
        processMessageCmn("9," + msg);
      }
    }
  }
  
  void displayCard(float x, float y, float w, float h, Card card){
    fill(255);  
    //ellipse(x, y, 20, 20);
    rect(x + 20, y + h / 2, w, h);
    if(card.suit == 1 || card.suit == 2)
      fill(0);
    else
      fill(200, 0, 0);
    textSize(24);
    text(numberStrings[card.number - 1], x + 20, y + h / 2 - 15);
    text(suitStrings[card.suit - 1], x + 20, y + h - 15);
  }
}
