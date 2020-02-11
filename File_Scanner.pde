public class File_Scanner { //<>// //<>// //<>// //<>//
  public File_Scanner() {
  }

  public void loadDataFiles() {
    Scanner tileFile;
    Scanner objectFile;
    String[] lines;
    lines = loadStrings("TileMap.txt");
    for (int i = 0; i < lines.length; i++) {
      tileFile = new Scanner(lines[i]);
      for (int j = 0; tileFile.hasNext(); j++) {
        int code = tileFile.nextInt();
        if (code == 0)
          tileCodes[i][j] = (int)random(0, 4);
        else
          tileCodes[i][j] = code;
      }
    }
    lines = loadStrings("ObjectMap.txt");
    for (int i = 0; i < lines.length; i++) {
      objectFile = new Scanner(lines[i]);
      for (int j = 0; objectFile.hasNext(); j++) 
        objectCodes[i][j] = objectFile.nextInt();
    }
  }

  public void loadInitialTextures() {
    String[] lines;
    int pos = 0;
    lines = loadStrings("Pathways.txt");
    for (int i = 0; !(lines[pos].equals("0")); i++) {
      initialTiles.add(i, new Tile(loadImage(lines[pos])));
      pos++;
    }
    pos++;
    for (int i = 0; !(lines[pos].equals("0")); i++) {
      initialObjects.add(i, new PObject(loadImage(lines[pos])));
      pos++;
    }
    pos++;
    for (int i = 0; !(lines[pos].equals("0")); i++) {
      initialSprites.add(i, new Sprite(loadImage(lines[pos])));
      pos++;
    }
    pos++;
    for (int i = 0; pos < lines.length; i++) {
      initialShadows.add(i, new Shadow(loadImage(lines[pos])));
      pos++;
    }
  }

  public void instanTiles() {
    for (int  i = 0; i < initialTiles.size(); i++) {
      hashMap.put(i+"T", initialTiles.get(i));
    }
    for (int  i = 0; i < initialObjects.size(); i++) {
      hashMap.put((i+1)+"O", initialObjects.get(i));
    }
    for (int  i = 0; i < initialSprites.size(); i++) {
      hashMap.put(i+"SP", initialSprites.get(i));
    }
    for (int  i = 0; i < initialShadows.size(); i++) {
      hashMap.put((i+1)+"SH", initialShadows.get(i));
    }
  }
  public void resizeTextures() {
    for (int  i = 0; i < initialTiles.size(); i++) {
      initialTiles.get(i).getTexture().resize(32, 32);
    }
    initialObjects.get(0).getTexture().resize(72, 96);
    for (int  i = 1; i < initialObjects.size()-1; i++) {
      initialObjects.get(i).getTexture().resize(32, 32);
    }
    initialObjects.get(8).getTexture().resize(216, 180);
    for (int  i = 0; i < initialSprites.size(); i++) {
      initialSprites.get(i).getTexture().resize(32, 42);
    }
    initialShadows.get(0).getTexture().resize(72, 96);
    for (int  i = 1; i < initialShadows.size(); i++) {
      initialShadows.get(i).getTexture().resize(32, 32);
    }
  }
}
