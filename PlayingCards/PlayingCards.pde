import processing.net.*;

final boolean SERVER = true;
final boolean DEBUG = true;
Game game;
GameServer gameServer;
GameClient gameClient;
void setup(){
  size(900, 600);
  game = new Game();
  
  background(51);
  
  if(SERVER)
    gameServer = new GameServer(new Server(this, 5000));
  gameClient = new GameClient(new Client(this, "127.0.0.1", 5000));
  
  game.init();
  
  gameClient.connect();
}

void draw(){
  background(51);
  game.tick();
  game.render();
  
  if(SERVER)
    gameServer.readAndBroadcast();
  gameClient.readMessage();
}

int i = 0;

void mousePressed(){
  i++;
  gameClient.sendMessage(i);
  game.onMouseClick();
}
