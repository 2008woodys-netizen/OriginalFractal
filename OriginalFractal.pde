
class Point{
  int myX, myY;
  Point(int x, int y){
    myX = x;
    myY = y;
  }
  void show(){
    stroke(255);
    ellipse(myX,myY,3,3);
  }
  void moveDown(){
    myY++;}
  void moveRight(){
    myX++;}
  void moveLeft(){
    myX--;}
  void moveUp(){
    myY--;}
}
Point todd;
String sequence;

void settings(){
  size(500,500);
}

void setup(){
  todd = new Point(450,150);
  noLoop();
  background(0);
  stroke(255);
  fill(255);
  sequence = turnIntoDirections(paperFold(8));
}

void draw(){
    for(int i = 0; i<sequence.length(); i++){
      if(sequence.charAt(i)=='R')
        for(int j = 0; j<5; j++){
          todd.moveRight();
          todd.show();}
      if(sequence.charAt(i)=='L')
        for(int j = 0; j<6; j++){
          todd.moveLeft();
          todd.show();}
      if(sequence.charAt(i)=='U')
        for(int j = 0; j<5; j++){
          todd.moveUp();
          todd.show();}
      if(sequence.charAt(i)=='D')
        for(int j = 0; j<6; j++){
          todd.moveDown();
          todd.show();}
    }  
    
}      

String turnIntoDirections(String str){
  if(str.length()==2)
    return "R";
  String prev = turnIntoDirections(str.substring(0,str.length()-1));
  char last = endOf(prev);
  if(endOf(str)=='1'){  
    if(last=='R'){return prev + "D";}
    if(last=='U'){return prev + "R";} 
    if(last=='L'){return prev + "U";}
    if(last=='D'){return prev + "L";}}
  if(last=='R'){return prev + "U";}
  if(last=='U'){return prev + "L";}
  if(last=='L'){return prev + "D";}
  return prev + "R";
}

public String paperFold(int numFolds) {
  if(numFolds == 1)
    return "0";
  else{
    return paperFold(numFolds-1) + '0' + reverseN(onesComplement(paperFold(numFolds-1)));
  }
}

public String onesComplement(String s){
  String ans = "";
  for(int i = 0; i<s.length();i++){
    if(s.charAt(i) == '1')
      ans += '0';
    else
      ans += '1';}
  return ans;
}

public String reverseN(String s){
  String ans = "";
  for(int i = s.length()-1; i>=0; i--)
    ans += s.charAt(i);
  return ans;
}

char endOf(String n){
  return n.charAt(n.length()-1);
}
  







