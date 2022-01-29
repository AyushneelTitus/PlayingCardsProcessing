class Scene{
  UiManager uiManager;
  
  Scene(){
    uiManager = new UiManager();
    init();
  }
  
  void init(){}
  
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
        currentScene = lobbyScene;
      }
    }));
  }
  
  void render(){
    //title
    fill(255);
    textSize(24);
    text("Playing cards", 300, 100);
    super.render();
  }
}

class LobbyScene extends Scene{
  LobbyScene(){
    super();
  }
  
  void init(){
    uiManager.getComponents().add(new UiPlayers(width / 2, 100, playerManager));
    uiManager.getComponents().add(new UiButton(300, 300, 90, 40, "Start", new Clicker(){
      public void onClick(){
        println("start game");
      }
    }));
    
  }
  
  void render(){
    //title
    
    //players
    super.render();
  }
}
