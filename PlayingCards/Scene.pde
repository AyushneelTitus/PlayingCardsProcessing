class Scene{
  UiManager uiManager;
  
  Scene(){
    uiManager = new UiManager();
  }
  
  void tick(){
    uiManager.tick();
  }
  
  void render(){
    uiManager.render();
  }
  
  void onMouseClick(){
    uiManager.onMouseClick();
  }
}

class LoginScene extends Scene{
  LoginScene(){
    super();
    init();
  }
  
  void init(){
    uiManager.getComponents().add(new UiButton(200, 300, 90, 40, "Create", new Clicker(){
      public void onClick(){
        println("create game");
      }
    }));
    
    uiManager.getComponents().add(new UiButton(400, 300, 90, 40, "Join", new Clicker(){
      public void onClick(){
        println("join game");
      }
    }));
  }
  
  void render(){
    fill(255);
    textSize(24);
    text("Playing cards", 300, 100);
    super.render();
  }
}
