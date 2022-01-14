class UiManager{
  ArrayList<UiComponent> components;
  
  UiManager(){
    components = new ArrayList<UiComponent>();
  }
  
  ArrayList<UiComponent> getComponents(){
    return components;
  }
  
  void tick(){
    for(UiComponent component : components){
      component.tick();
    }
  }
  
  void render(){
    for(UiComponent component : components){
      component.render();
    }
  }
  
  void onMouseClick(){
    for(UiComponent component : components){
      if(component.isClicked()){
        component.onMouseClick();
      }
    }
  }
}
