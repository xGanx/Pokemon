import java.util.*; //<>// //<>// //<>// //<>//
import java.io.*;
//movement
boolean movingNorth = false;
boolean movingEast = false;
boolean movingSouth = false;
boolean movingWest = false;
int xOff, yOff;
int pX, pY;
int iX;
//animation
int[] movInfo;
//assorted
World world;
File_Scanner fs;
int[][] tileCodes = new int[60][80];
int[][] objectCodes = new int[60][80];
HashMap <String, Texture> hashMap = new HashMap<String, Texture>();
//intial textures for resizing
ArrayList<Tile> initialTiles = new ArrayList<Tile>();
ArrayList<PObject> initialObjects = new ArrayList<PObject>();
ArrayList<Shadow> initialShadows = new ArrayList<Shadow>();
ArrayList<Sprite> initialSprites = new ArrayList<Sprite>();
Texture[][] tileMap = new Texture[60][80];
Texture[][] objectMap = new Texture[60][80];

void setup() {
  size(992, 672, JAVA2D); //31 = x tiles by 21 = y
  frameRate(100);
  world = new World();
  movInfo = new int[4];
  movInfo[0] = 1;
  xOff = 0; 
  yOff = 0;
  pX = 17; 
  pY = 13; 
  iX = pX-1;
  fs = new File_Scanner();
  fs.loadDataFiles();
  fs.loadInitialTextures();
  fs.resizeTextures();
  fs.instanTiles();
  imageMode(CENTER);
}

//
//
//

void draw() {
  if (keyPressed && (key == CODED))
    keyPressed();
  if (movingSouth)
    moveSouth();
  if (movingEast)
    moveEast();
  if (movingNorth)
    moveNorth();
  if (movingWest)
    moveWest();
  world.drawView();
}

//
//
//

//directional movement
void moveNorth() {
  if (movInfo[1] >= 31) {
    movingNorth = false;
    yOff = 0;
    pY--;
    movInfo[1] = 0;
    movInfo[0] *= -1;
    movInfo[3] = 2;
    return;
  }
  yOff++;
  movInfo[3] = 2;
  if (movInfo[1] >= 1 && movInfo[0] == 1) 
    movInfo[3] = 9;
  else if (movInfo[0] == -1 && movInfo[1] >= 1)
    movInfo[3] = 8;
  movInfo[1]++;
}
void moveEast() {
  if (movInfo[1] >= 31) {
    movingEast = false;
    xOff = 0;
    pX++;
    movInfo[1] = 0;
    movInfo[2] = 0;
    movInfo[1] = 0;
    movInfo[0] *= -1;
    movInfo[3] = 1;
    return;
  }
  xOff--;
  movInfo[3] = 1;
  movInfo[2] = 0;
  if (movInfo[1] >= 5 && movInfo[0] == 1) {
    movInfo[3] = 6;
    movInfo[2] = 1;
  } else if (movInfo[0] == -1 && movInfo[1] >= 5) {
    movInfo[3] = 7;
    movInfo[2] = 1;
  }
  movInfo[1]++;
}
void moveSouth() {
  if (movInfo[1] >= 31) {
    movingSouth = false;
    yOff = 0;
    pY++;
    movInfo[1] = 0;
    movInfo[1]++;
    movInfo[0] *= -1;
    movInfo[3] = 0;
    return;
  }
  yOff--;
  movInfo[3] = 0;
  if (movInfo[1] >= 1 && movInfo[0] == 1) 
    movInfo[3] = 4;
  else if (movInfo[0] == -1 && movInfo[1] >= 1)
    movInfo[3] = 5; 
  movInfo[1]++;
}
void moveWest() {
  if (movInfo[1] >= 31) {
    movingWest = false; 
    xOff = 0;
    pX--; 
    movInfo[2] = 0;
    movInfo[1] = 0; 
    movInfo[0] *= -1;
    movInfo[3] = 3; 
    return;
  }
  xOff++; 
  movInfo[3] = 3; 
  movInfo[2] = 0;
  if (movInfo[1] >= 1 && movInfo[0] == 1) {
    movInfo[3] = 10; 
    movInfo[2] = 1;
  } else if (movInfo[0] == -1 && movInfo[1] >= 1) {
    movInfo[3] = 11; 
    movInfo[2] = 1;
  }
  movInfo[1]++;
}

void keyPressed() {
  iX = pX+1;
  if (keyCode == DOWN && !movingNorth && !movingWest && !movingEast) {
    movInfo[3] = 0;
    if ((objectCodes[pY+1][iX] < 1) && !((objectCodes[pY+1][iX+1] > 0) && (objectCodes[pY+1][iX-1] > 0))) // object detection
      if (pY < 47) 
        movingSouth = true;
  } else if (keyCode == UP && !movingSouth && !movingWest && !movingEast) {
    movInfo[3] = 2;
    if ((objectCodes[pY-1][iX] < 1) && !((objectCodes[pY-1][iX-1] > 0) && (objectCodes[pY-1][iX+1] > 0)))
      if (pY > 12) 
        movingNorth = true;
  } else if (keyCode == LEFT && !movingSouth && !movingNorth && !movingEast) {
    movInfo[3] = 3;
    if ((objectCodes[pY][iX-1] < 1) && !((objectCodes[pY+1][iX-1] > 0) && (objectCodes[pY-1][iX-1] > 0)))
      if (iX > 18) 
        movingWest = true;
  } else if (keyCode == RIGHT && !movingSouth && !movingWest && !movingNorth) {
    movInfo[3] = 1;
    if ((objectCodes[pY][iX+1] < 1) && !((objectCodes[pY+1][iX+1] > 0) && (objectCodes[pY-1][iX+1] > 0)))
      if (iX < 62) 
        movingEast = true;
  }
}
