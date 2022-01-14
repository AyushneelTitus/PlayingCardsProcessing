class UiComponent {
  PVector pos, sz;

  UiComponent(float x, float y, float w, float h) {
    pos = new PVector(x, y);
    sz = new PVector(w, h);
  }

  void tick() {
  }

  void render() {
  }
  
  boolean isClicked(){
    if(mouseX > pos.x - sz.x / 2 && mouseX < pos.x + sz.x / 2
        && mouseY > pos.y - sz.y / 2 && mouseY < pos.y + sz.y / 2){
      return true;
    }
    else {
      return false;
    }
  }

  void onMouseClick() {
  }
}
