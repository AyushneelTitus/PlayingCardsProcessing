class UiPlayers extends UiComponent{
  PlayerManager playerManager;
  float playerW = 80, playerH = 20;
  UiPlayers(float x, float y, PlayerManager playerManager){
    super(x, y, 0, 0);
    this.playerManager = playerManager;
  }
  
  void updateSize(){
    sz.x = playerW * (playerManager.getPlayers().size() - 1);
    sz.y = playerH;
  }
  
  void render(){
    if(DEBUG){
      line(pos.x - 100, pos.y, pos.x + 100, pos.y);
      line(pos.x, pos.y - 100, pos.x, pos.y + 100);
    }
    
    pushMatrix();
    
    fill(255);
    textSize(14);
    translate(pos.x - sz.x / 2, pos.y - sz.y / 2);
    for(int i = 0; i < playerManager.getPlayers().size(); i++){
      if(playerManager.getPlayers().get(i) == playerManager.self){
        continue;
      }
      rect(i * playerW, 0, 20, playerH);
      text(playerManager.getPlayers().get(i).name, i * playerW + 22, playerH - 4);
    }
    
    popMatrix();
  }
}
