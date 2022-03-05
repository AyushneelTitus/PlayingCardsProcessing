import processing.net.*;

final boolean DEBUG = true;
Game game;
GameServer gameServer;
GameClient gameClient;

Scene currentScene, loginScene, lobbyScene, gameScene;
boolean isServer = false;

void setup(){
  size(900, 600);
  game = new Game();
  
  background(51);
  
  game.init();
  loginScene = new LoginScene();
  lobbyScene = new LobbyScene();
  currentScene = loginScene;
  
}

void draw(){
  background(51);
  currentScene.tick();
  currentScene.render();
}

int i = 0;

void mousePressed(){
  i++;
  //gameClient.sendMessage("Hello");
  currentScene.onMouseClick();
}
