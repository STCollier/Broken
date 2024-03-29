// Class for animating a sequence of GIFs

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = "images/animations/" + imagePrefix + nf(i, 2) + ".png";
      images[i] = loadImage(filename);
    }
  }

void display(float xpos, float ypos, float w, float h, int speed) {
    if (frameCount % speed == 0) {
      frame = (frame+1) % imageCount;
    }
    image(images[frame], xpos, ypos, w, h);
}
  
  int getWidth() {
    return images[0].width;
  }
}