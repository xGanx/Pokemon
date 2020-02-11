public class SideBar {
  int rectY;
  int rLength;
  int[][] divisionCoords = new int[21][2];
  public SideBar() {
    rectY = 96;
    if (initialTextures.size() == 0)
      rLength = 96;
    else
      rLength = (height-96)/initialTextures.size();
  }

  public void drawSideBar() {
    //lines
    line(width-96, 0, width-96, height);
    line(width-30, 96, width-30, height);
    rect(width-30, rectY, 32, rLength);

    //textures
    int yCoordMult = 3;
    for (int i = 1; hashMap.containsKey(i+"L"+layerNum); i++) {
      hashMap.get(i+"L"+layerNum).Draw(width-95, 32*yCoordMult+yCoordMult-3);
      i++;
      if (hashMap.containsKey(i+"L"+layerNum))
        hashMap.get(i+"L"+layerNum).Draw(width-62, 32*yCoordMult+yCoordMult-3);
      yCoordMult++;
    }
  }

  public void scrollDown() {
  }

  public void scrollUp() {
  }
}
