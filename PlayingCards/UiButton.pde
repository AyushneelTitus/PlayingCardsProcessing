class UiButton extends UiComponent{
  String text;
  Clicker clicker;
  
  UiButton(float x, float y, float w, float h, String text, Clicker clicker){
    super(x, y, w, h);
    this.text = text;
    this.clicker = clicker;
  }
  
  void render(){
    // background
    fill(150);
    rectMode(CENTER);
    rect(pos.x, pos.y, sz.x, sz.y);
    //text
    fill(255);
    textSize(18);
    textAlign(CENTER, CENTER);
    text(text, pos.x, pos.y);
  }
  
  void onMouseClick(){
    clicker.onClick();
  }
}
