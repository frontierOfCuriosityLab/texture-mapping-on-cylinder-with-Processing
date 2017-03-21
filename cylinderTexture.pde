PImage img;

float imgWidth;
float imgHeight;

int cylinderResolution;
float cylinderRadius;

float rot;

void setup() {
  size(500, 500, P3D);
  
  //Place data folder to your Image file and change here.
  img = loadImage("data/akashisan.jpg");
  
  imgWidth = img.width;
  imgHeight = img.height;
  rot = 0.0;
}

void draw() {

  background(0);
  pushMatrix();

  translate(width/2, height/2, -400);
  rotateY(rot);
  rot += 0.025;
  
  //You can adjust cylinder resolution by changing second parameter.
  cylinderCordinates(imgWidth, 36);
  
  popMatrix();
}

void cylinderCordinates(float imageWidth, int cylinderResolution) {

  float slicedWidth = imageWidth / cylinderResolution;

  float halfSliced = slicedWidth/2;
  float centerDegree = 360 / cylinderResolution;
  float degreeOfSide = (180 - centerDegree)/2;

  cylinderRadius = halfSliced / cos(radians(degreeOfSide));

  float halfImageHeight = imgHeight/2;

  noStroke();
  for (int i = 0; i < cylinderResolution; i++) {
    beginShape();
    texture(img);
    vertex(cylinderRadius * cos(radians(centerDegree * i)), halfImageHeight*-1, cylinderRadius * sin(radians(centerDegree * i)), slicedWidth * i, 0);
    vertex(cylinderRadius * cos(radians(centerDegree * (i+1))), halfImageHeight*-1, cylinderRadius * sin(radians(centerDegree * (i+1))), slicedWidth * (i+1), 0);
    vertex(cylinderRadius * cos(radians(centerDegree * (i+1))), halfImageHeight, cylinderRadius * sin(radians(centerDegree * (i+1))), slicedWidth * (i+1), imgHeight);
    vertex(cylinderRadius * cos(radians(centerDegree * i)), halfImageHeight, cylinderRadius * sin(radians(centerDegree * i)), slicedWidth * i, imgHeight);
    endShape(CLOSE);
  }
}