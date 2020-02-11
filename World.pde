public class World { //<>// //<>// //<>//
  public World() {
  }
  
  public void drawView() {
    //layer 1
      
    //layer 2
      
    //layer 3
      
    //layer 4
      
    //layer 5
      
    //tiles
    for (int y = -12; y < 13; y++) //real bound of 21
      for (int x = -17; x < 18; x++) {  //real bound of 31
        hashMap.get(tileCodes[pY+y][pX+x]+"T").Draw(((x+15)*32)+xOff, ((y+10)*32)+yOff);
      }

    //shadows
    for (int y = -12; y < 13; y++) //real bound of 21
      for (int x = -17; x < 18; x++) {  //real bound of 31
        if (objectCodes[pY+y][pX+x] == 0)
          continue;
        if (objectCodes[pY+y][pX+x] == 9)
          continue;
        hashMap.get(objectCodes[pY+y][pX+x]+"SH").Draw(((x+15)*32)+xOff, ((y+10)*32)+yOff);
      }
    //main character
    hashMap.get(movInfo[3]+"SP").Draw(16*32, (10*32)-movInfo[2]-10);
    //objects
    for (int y = -12; y < 13; y++) //real bound of 21
      for (int x = -17; x < 18; x++) {  //real bound of 31
        if (objectCodes[pY+y][pX+x] == 0)
          continue;
        hashMap.get(objectCodes[pY+y][pX+x]+"O").Draw(((x+15)*32)+xOff, ((y+10)*32)+yOff);
      }
  }
}
