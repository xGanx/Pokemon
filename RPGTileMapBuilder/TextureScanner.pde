public class TextureScanner { //<>// //<>// //<>//
  public TextureScanner() {
  }

  public void loadInitialTextures() {
    String[] lines;
    int pos = 0;
    lines = loadStrings("Pathways.txt");
    for (int i = 0; !(lines[pos].equals("0")); i++) {
      layer1Textures.add(i, new Texture(loadImage(lines[pos])));
      pos++;
    }
    pos++;
    for (int i = 0; !(lines[pos].equals("0")); i++) {
      layer2Textures.add(i, new Texture(loadImage(lines[pos])));
      pos++;
    }
    pos++;
    for (int i = 0; !(lines[pos].equals("0")); i++) {
      layer3Textures.add(i, new Texture(loadImage(lines[pos])));
      pos++;
    }
    pos++;
    for (int i = 0; !(lines[pos].equals("0")); i++) {
      layer4Textures.add(i, new Texture(loadImage(lines[pos])));
      pos++;
    }
    pos++;
    for (int i = 0; !(lines[pos].equals("0")); i++) {
      layer5Textures.add(i, new Texture(loadImage(lines[pos])));
      pos++;
    }
    pos++;
    whiteSpace = new Texture(loadImage(lines[pos]));
  }

  public void instanTiles() {
    for (int  i = 1; i < layer1Textures.size(); i++) {
      hashMap.put(i+"L1", layer1Textures.get(i));
    }
    for (int  i = 1; i < layer2Textures.size(); i++) {
      hashMap.put((i+1)+"L2", layer2Textures.get(i));
    }
    for (int  i = 1; i < layer3Textures.size(); i++) {
      hashMap.put(i+"L3", layer3Textures.get(i));
    }
    for (int  i = 1; i < layer4Textures.size(); i++) {
      hashMap.put((i+1)+"L4", layer4Textures.get(i));
    }
    for (int  i = 1; i < layer5Textures.size(); i++) {
      hashMap.put((i+1)+"L5", layer5Textures.get(i));
    }
  }
  public void resizeTextures() {
    for (int  i = 0; i < layer1Textures.size(); i++) {
      layer1Textures.get(i).getTexture().resize(layer1Textures.get(i).getTexture().width*2, layer1Textures.get(i).getTexture().height*2);
    }
    for (int  i = 1; i < layer2Textures.size()-1; i++) {
      layer2Textures.get(i).getTexture().resize(layer2Textures.get(i).getTexture().width*2, layer2Textures.get(i).getTexture().height*2);
    }
    for (int  i = 0; i < layer3Textures.size(); i++) {
      layer3Textures.get(i).getTexture().resize(layer3Textures.get(i).getTexture().width*2, layer3Textures.get(i).getTexture().height*2);
    }
    for (int  i = 1; i < layer4Textures.size(); i++) {
      layer4Textures.get(i).getTexture().resize(layer4Textures.get(i).getTexture().width*2, layer4Textures.get(i).getTexture().height*2);
    }
    for (int  i = 1; i < layer5Textures.size(); i++) {
      layer5Textures.get(i).getTexture().resize(layer5Textures.get(i).getTexture().width*2, layer5Textures.get(i).getTexture().height*2);
    }
    whiteSpace.getTexture().resize(whiteSpace.getTexture().width*2,whiteSpace.getTexture().height*2);
  }
}
