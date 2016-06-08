import processing.net.*; 
import http.requests.*;

/* ##############################
Developed by Jordan Mauricio
################################*/

int rectX, rectY;      // Position of square button
int rectSize = 90;     // Diameter of rect
color rectColor, baseColor;
color rectHighlight;
color currentColor;
boolean rectOver = false;
PostRequest post; 

void setup() {
  size(640, 360);
  rectColor = color(0);
  rectHighlight = color(51);
  //circleColor = color(255);
  //circleHighlight = color(204);
  baseColor = color(102);
  currentColor = baseColor;
  //circleX = width/2+circleSize/2+10;
  ///circleY = height/2;
  rectX = width/2-rectSize-10;
  rectY = height/2-rectSize/2;
  ellipseMode(CENTER);
  
  /*HTTP 
  c = new Client(this, "www.antertain.org", 80);  // Connect to server on port 80 
  c.write("POST / HTTP/1.0\n");  // Use the HTTP "GET" command to ask for a webpage
  c.write("Host: jordanmauricio.com\n\n"); // Be polite and say who we are*/
  
  post = new PostRequest("direct-link-to-http-file (PHP or MySQL)");
  post.addUser("username", "password");
  post.addHeader("Content-Type", "application/json");
  
}

void draw() {
  update(mouseX, mouseY);
  background(220);
  
  if (rectOver) {
    fill(rectHighlight);
  } else {
    fill(rectColor);
  }
  stroke(255);
  rect(rectX, rectY, rectSize, rectSize);
  
  
  
  
  /*HTTP
  
  if (c.available() > 0) {    // If there's incoming data from the client...
    data += c.readString();   // ...then grab it and print it 
    println(data); 
  } */
}

void update(int x, int y) {
  /*if ( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    rectOver = false;
  } else if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
    circleOver = false;
  } else {
    circleOver = rectOver = false;
  }*/
  
  if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
    //circleOver = false;
  } else {
    rectOver = false;
  }
  
}

void mousePressed() {
  /*if (circleOver) {
    currentColor = circleColor;
  }*/
  if (rectOver) {
    currentColor = rectColor;
    sendData();
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

void sendData(){
  post.addData("name", "whatever");
  post.addData("food", "test");
  post.send();
  println("Reponse Content: " + post.getContent());
  println("Reponse Content-Length Header: " + post.getHeader("Content-Length")); 
}

/*boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}*/