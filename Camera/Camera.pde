import processing.video.*;
import java.io.File;

Capture video;
PImage capturedImage;
boolean cameraActive = false;
boolean photoTaken = false;

void setup() {
  size(960, 540);
}

void draw() {
 
  if (photoTaken) {
    background(255);
    image(capturedImage, 0, 0);
    textSize(32);
    fill(0);
    text("Press 'Y' to save or 'N' to discard", 50, 50);
  } else if (cameraActive && video.available()) {
    video.read();
    image(video, 0, 0);
  }
}

void keyPressed() {
  if (key == ' ') {
    if (!cameraActive && !photoTaken) {
      video = new Capture(this, width, height);
      video.start();
      cameraActive = true;
    } else if (photoTaken) {
      capturedImage = null;  // Clear the captured image
      photoTaken = false;
      cameraActive = true;
    } else {
      video.stop();
      video.dispose();
      cameraActive = false;
    }
  } else if (key == ENTER) {
    if (cameraActive) {
      saveFrame("photo.png");
      capturedImage = loadImage("photo.png");
      photoTaken = true;
      video.stop();
      video.dispose();
      cameraActive = false;
    }
  } else if (photoTaken) {
    if (key == 'y' || key == 'Y') {
      println("Photo saved as photo.png");
      photoTaken = false;
      capturedImage = null;
      cameraActive = true;
      background(255);
      video = new Capture(this, width, height);
      video.start();
    } else if (key == 'n' || key == 'N') {
      File fileToDelete = new File(sketchPath("photo.png"));
      fileToDelete.delete();
      capturedImage = null;
      photoTaken = false;
      cameraActive = true;
      background(255);
      video = new Capture(this, width, height);
      video.start();
    }
  }
}
