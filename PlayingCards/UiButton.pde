class UiButton extends UiComponent{
  String text;
  Clicker clicker;
  boolean isEnabled;
  
  UiButton(float x, float y, float w, float h, String text, Clicker clicker){
    super(x, y, w, h);
    this.text = text;
    this.clicker = clicker;
    isEnabled = true;
  }
  
  void render(){
    // background
    fill(150);
    rectMode(CENTER);
    rect(pos.x, pos.y, sz.x, sz.y);
    //text
    if(isEnabled)
      fill(255);
    else
      fill(170);
    textSize(18);
    textAlign(CENTER, CENTER);
    text(text, pos.x, pos.y);
  }
  
  void onMouseClick(){
    if(isEnabled)
      clicker.onClick();
  }
}
