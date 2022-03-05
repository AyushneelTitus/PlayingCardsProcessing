class UiHand extends UiComponent{
  Pack pack;
  float cardW = 40, cardH = 60;
  
  UiHand(float x, float y, Pack pack){
    super(x, y, 0, 0);
    this.pack = pack;
    
    updateSize();
  }
  
  void updateSize(){
    if(pack == null) return;
    sz.x = cardW * pack.getCards().size();
    sz.y = cardH;
  }
  
  void render(){
    if(DEBUG){
      line(pos.x - 400, pos.y, pos.x + 400, pos.y);
      line(pos.x, pos.y - 100, pos.x, pos.y + 100);
    }
    
    pushMatrix();
    translate(pos.x - sz.x / 2, pos.y - sz.y / 2);
    
    for(int i = 0; i < pack.getCards().size(); i++){
      displayCard(i * cardW + 1, 1, cardW - 1, cardH - 1, pack.getCards().get(i));
    }
    
    popMatrix();
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
  
  int getCardIdx(int mousePos){
    return floor((mousePos - pos.x + sz.x / 2) / cardW);
  }
  
  void onMouseClick(){
    if (mouseX > pos.x - sz.x && mouseX < pos.x + sz.x && mouseY > pos.y - sz.y && mouseY < pos.y + sz.y){
      println("hand clicked");
      int indx = getCardIdx(mouseX);
      Card c = pack.cards.get(indx);
      String msg = "C,P," + game.playerManager.self.id + ",B,1," + c.suit + "," + c.number;
      //gameClient.sendMessage(msg);
      processMessageCmn("9," + msg);
    }
    //pack.getCards().add(new Card(6, 1));
    updateSize();
  }
}
