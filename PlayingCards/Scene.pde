class Scene {
  UiManager uiManager;

  Scene() {
    uiManager = new UiManager();
    init();
  }

  void init() {
  }
  
  void transitIn(){
  }
  
  void transitOut(){
  }

  void tick() {
    uiManager.tick();
  }

  void render() {
    uiManager.render();
  }

  void onMouseClick() {
    uiManager.onMouseClick();
  }
}

class LoginScene extends Scene {
  LoginScene() {
    super();
  }

  void init() {
    uiManager.getComponents().add(new UiButton(200, 300, 90, 40, "Create", new Clicker() {
      public void onClick() {
        println("create game");
        isServer = true;
        currentScene = lobbyScene;
        currentScene.transitIn();
      }
    }
    ));

    uiManager.getComponents().add(new UiButton(400, 300, 90, 40, "Join", new Clicker() {
      public void onClick() {
        println("join game");
        isServer = false;
        currentScene = lobbyScene;
        currentScene.transitIn();
      }
    }
    ));
  }

  void render() {
    //title
    fill(255);
    textSize(24);
    text("Playing cards", 300, 100);
    super.render();
  }
}

class LobbyScene extends Scene {
  UiPlayers uiPlayers;
  UiButton startButton;
  
  LobbyScene() {
    super();
  }

  void init() {
    // ui
    uiPlayers = new UiPlayers(width / 2, 100, game.playerManager);
    startButton = new UiButton(300, 300, 90, 40, "Start", new Clicker() {
      public void onClick() {
        println("start game");
      }
    }
    );
    uiManager.getComponents().add(uiPlayers);
    uiManager.getComponents().add(startButton);

  }

  void transitIn(){
    // get lobby details;
    if (isServer) {
      startServer();
      createLobby();
    } else {
      startClient();
      startButton.isEnabled = false;
      println("Start button disabled");
      getLobby();
    }
  }

  void render() {
    //title

    //players
    super.render();
  }
}
