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
    line(pos.x - 100, pos.y, pos.x + 100, pos.y);
    line(pos.x, pos.y - 100, pos.x, pos.y + 100);
    
    pushMatrix();
    translate(pos.x - sz.x / 2, pos.y - sz.y / 2);
    
    for(int i = 0; i < pack.getCards().size(); i++){
      rect(i * cardW + 1, 1, cardW - 1, cardH - 1);
    }
    
    popMatrix();
  }
  
  void onMouseClick(){
    pack.getCards().add(new Card(1, 6));
    updateSize();
  }
}
