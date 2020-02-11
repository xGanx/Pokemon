public class TopBar {
  public TopBar() {
  }

  public void drawTopBar() {
    line(0, 96, width, 96);
    drawLayerSelector();
  }

  void drawLayerSelector() {
    fill(255);
    rect(0, 48, 48, 48);
    rect(48, 48, 48, 48);
    rect(96, 48, 48, 48);
    rect(144, 48, 48, 48);
    rect(192, 48, 48, 48);
    //use fill(<integer>) to give text a color
    textFont(f);
    fill(0);
    textAlign(CENTER);
    text("Layer Selector", 120, 30);
    textSize(20);
    text("1", 24, 80);
    text("2", 72, 80);
    text("3", 120, 80);
    text("4", 168, 80);
    text("5", 216, 80);
    fill(255);
  }
}
