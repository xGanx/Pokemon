public class Texture {
  private PImage texture;
  public Texture() {}
  
  public Texture(PImage texture){
    this.texture = texture;
  }
  
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
