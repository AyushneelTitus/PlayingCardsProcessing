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
  UiButton startButton, backButton;
  
  LobbyScene() {
    super();
  }

  void init() {
    // ui
    uiPlayers = new UiPlayers(width / 2, 100, game.playerManager);
    startButton = new UiButton(200, 300, 90, 40, "Start", new Clicker() {
      public void onClick() {
        println("start game");
      }
    });
    backButton = new UiButton(400, 300, 90, 40, "Back", new Clicker() {
      public void onClick() {
        currentScene.transitOut();
        currentScene = loginScene;
      }
    });
    uiManager.getComponents().add(uiPlayers);
    uiManager.getComponents().add(startButton);
    uiManager.getComponents().add(backButton);

  }

  void transitIn(){
    // get lobby details;
    if (isServer) {
      startServer();
      startButton.isEnabled = true;
      createLobby();
    } else {
      startClient();
      startButton.isEnabled = false;
      println("Start button disabled");
      connect();
    }
  }
  
  void transitOut(){
    game.playerManager.players.clear();
    if (isServer) {
      closeServer();
    } else {
      closeClient();
    }
  }
  
  void tick() {
    if(isServer){
      gameServer.readAndBroadcast();
    }
    else {
      gameClient.readMessage();
    }
  }

  void render() {
    //title

    //players
    super.render();
  }
}
