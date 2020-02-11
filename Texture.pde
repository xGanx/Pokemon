public class Texture {
  private PImage texture;
  public Texture() {}
  
  public void Draw(int x, int y){
    image(texture,x,y);
  }
  
  public void setTexture(PImage texture){
    this.texture = texture;
  }
  
  public PImage getTexture(){
    return texture;
  }
}
