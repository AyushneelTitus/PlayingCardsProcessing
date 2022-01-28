class UiHand extends UiComponent{
  Pack pack;
  float cardW = 40, cardH = 60;
  
  UiHand(float x, float y, Pack pack){
    super(x, y, 0, 0);
    this.pack = pack;
    
    updateSize();
  }
  
  void updateSize(){
    sz.x = cardW * pack.getCards().size();
    sz.y = cardH;
  }
  
  void render(){
    if(DEBUG){
      line(pos.x - 100, pos.y, pos.x + 100, pos.y);
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
    rect(x, y, w, h);
    if(card.suit == 1 || card.suit == 2)
      fill(0);
    else
      fill(200, 0, 0);
    textSize(24);
    text(numberStrings[card.number - 1], x + 4, y + h / 2 - 5);
    text(suitStrings[card.suit - 1], x + 4, y + h - 5);
  }
    
  
  void onMouseClick(){
    pack.getCards().add(new Card(6, 1));
    updateSize();
  }
}
