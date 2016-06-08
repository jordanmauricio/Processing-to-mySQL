class Venue{

  int x, y, size, count, recWidth, recHeight;
  color baseColor, highlightColor;
  String name;
  
  
  Venue(int tx, int ty, int trecWidth, int trecHeight, color tbaseColor, color thighlightColor, String tname, int tcount){
   x              = tx;
   y              = ty; 
   recWidth       = trecWidth;
   recHeight     = trecHeight;
   baseColor      = tbaseColor;
   highlightColor = thighlightColor;
   name           = tname;
   count          = tcount;
 }
 
 void display(){
    ellipseMode(CENTER);
    textSize(24);
       
     overRect();
     text(name, x, y, recWidth, recHeight);
 }
 
 void click(){
   
     if(overRect()){
       //count++;
       //println(name + " " + count);
       sendData(name);
     }

    
 }
 
 boolean overRect() {
   if (mouseX >= x && mouseX <= x+recWidth && 
       mouseY >= y && mouseY <= y+recHeight) {
     fill(color(baseColor));
     return true;
   } else {
     fill(color(highlightColor));
     return false;
   }
 }
   
}