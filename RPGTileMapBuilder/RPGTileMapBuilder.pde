import java.util.*;
import java.io.*;

//global variables
int[][] layer1Codes = new int[500][500];
int[][] layer2Codes = new int[500][500];
int[][] layer3Codes = new int[500][500];
int[][] layer4Codes = new int[500][500];
int[][] layer5Codes = new int[500][500];

ArrayList<Texture> layer1Textures = new ArrayList<Texture>();
ArrayList<Texture> layer2Textures = new ArrayList<Texture>();
ArrayList<Texture> layer3Textures = new ArrayList<Texture>();
ArrayList<Texture> layer4Textures = new ArrayList<Texture>();
ArrayList<Texture> layer5Textures = new ArrayList<Texture>();

ArrayList<Texture> initialTextures = new ArrayList<Texture>();
Texture[][] tileMap = new Texture[500][500];
HashMap <String, Texture> hashMap = new HashMap<String, Texture>();

TextureScanner ts = new TextureScanner();
SideBar sb = new SideBar();
World world = new World();
TopBar tb = new TopBar();

Texture whiteSpace;

int layerNum = 1;

PFont f;

void setup() {
  size(1117, 788, JAVA2D);   // x + 29, y + 20 - (Accounts for the lines)
  frameRate(60);

  f = createFont("Arial", 24, true); // first input is font, next is text size, last is anti-aliasing boolean


  ts.loadInitialTextures();
  ts.resizeTextures();
  ts.instanTiles();
}

void draw() {
  rectMode(CORNER);
  world.drawView();
  sb.drawSideBar();
  tb.drawTopBar();
  drawLines();
}

void drawLines() {
  //vertical lines
  for (int x = 32; x < width-96; x+=33) {
    line(x, 96, x, height);
  }
  //horizontal lines
  for (int y = 128; y < height; y+=33) {
    line(0, y, width-96, y);
  }
}

void keyPressed() {
}

void mousePressed() {
}

void mouseDragged() {
}
