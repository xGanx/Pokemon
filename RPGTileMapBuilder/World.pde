public class World { //<>// //<>//
  public World() {
  }

  public void drawView() {
    //tiles
    int xLineOffset = 0;
    int yLineOffset = 0;
    for (int y = 0; y < 21; y++) { //real bound of 21
      xLineOffset = 0;
      for (int x = 0; x < 31; x++) {  //real bound of 31
        if (hashMap.containsKey(layer1Codes[y][x]+"L"+layerNum))
          hashMap.get(layer1Codes[y][x]+"L"+layerNum).Draw(((x)*32)+xLineOffset, (y*32)+yLineOffset); 
        if (hashMap.containsKey(layer1Codes[y][x]+"L"+layerNum))
          hashMap.get(layer2Codes[y][x]+"L"+layerNum).Draw(((x)*32)+xLineOffset, (y*32)+yLineOffset); 
        if (hashMap.containsKey(layer1Codes[y][x]+"L"+layerNum))
          hashMap.get(layer3Codes[y][x]+"L"+layerNum).Draw(((x)*32)+xLineOffset, (y*32)+yLineOffset); 
        if (hashMap.containsKey(layer1Codes[y][x]+"L"+layerNum))
          hashMap.get(layer4Codes[y][x]+"L"+layerNum).Draw(((x)*32)+xLineOffset, (y*32)+yLineOffset); 
        if (hashMap.containsKey(layer1Codes[y][x]+"L"+layerNum))
          hashMap.get(layer5Codes[y][x]+"L"+layerNum).Draw(((x)*32)+xLineOffset, (y*32)+yLineOffset); 
        xLineOffset++;
      }
      yLineOffset++;
    }
  }
}
