PVector[][] array;
int xdots =10;
int ydots;
int padding = 0;

void setup() {
  size(1000, 1000);
  xdots+=2*padding;
  float h = tan(30*PI/180)*((width/xdots)/2);
  ydots = int(height/h);
  array = new PVector[ydots][xdots];
  for(int j = 0; j < ydots; j++) {
    for(int i = 0; i < xdots; i++) {
      array[j][i] = new PVector(-1, -1);
    }
  }
  for(int j = 0; j < ydots; j++) {
    for(int i = 0; i < xdots; i++) {
      if(j%2==0) {
        array[j][i] = new PVector(i*(width/xdots), j*h);
      } else {
        array[j][i] = new PVector(i*(width/xdots)+(width/xdots)/2, j*h);
        //array[j][i] = new PVector(0,0);
      }
    }
  }
}

void draw() {
  background(30);
  //noStroke();
 // draw_dots();
  draw_lines();
}

void draw_dots() {
  strokeWeight(4);
  stroke(255,255,255);
  textSize(10);
  fill(255);
  for(int y = 0; y < ydots; y++) {
    for(int i = 0; i < xdots; i++) {
      point(array[y][i].x, array[y][i].y);
      String s = "(" + y + ", " + i + ")";
      text(s, array[y][i].x, array[y][i].y);
    }
  }
}

void draw_lines() {
  strokeWeight(3);
  stroke(210,210,10); //line colour
  //int ycoord = 1;
  for(int ycoord = 1; ycoord < ydots-1; ycoord+=5) {
    for(int xcoord = 1; xcoord < xdots-1; xcoord+=2) {
      //print("drawing from: (" + ycoord + ", " + xcoord + ")\n");
      if(ycoord-2>=0) {
      //stroke(210,10,10); //line colour
      line(array[ycoord-2][xcoord].x, array[ycoord-2][xcoord].y, array[ycoord-1][xcoord].x, array[ycoord-1][xcoord].y);
      line(array[ycoord-2][xcoord].x, array[ycoord-2][xcoord].y, array[ycoord-1][xcoord+1].x, array[ycoord-1][xcoord+1].y);
      }
     // stroke(210,210,10); //line colour
      line(array[ycoord][xcoord].x, array[ycoord][xcoord].y, array[ycoord+2][xcoord].x, array[ycoord+2][xcoord].y);
      line(array[ycoord][xcoord].x, array[ycoord][xcoord].y, array[ycoord-1][xcoord+1].x, array[ycoord-1][xcoord+1].y);
      line(array[ycoord][xcoord].x, array[ycoord][xcoord].y, array[ycoord-1][xcoord].x, array[ycoord-1][xcoord].y);
      
      //stroke(0,210,10); //line colour
      line(array[ycoord-1][xcoord].x, array[ycoord-1][xcoord].y, array[ycoord+1][xcoord].x, array[ycoord+1][xcoord].y);
      line(array[ycoord-1][xcoord+1].x, array[ycoord-1][xcoord+1].y, array[ycoord+1][xcoord+1].x, array[ycoord+1][xcoord+1].y);
       
      //stroke(0,0,255); //line colour
      line(array[ycoord+1][xcoord].x, array[ycoord+1][xcoord].y, array[ycoord+2][xcoord].x, array[ycoord+2][xcoord].y);
      line(array[ycoord+1][xcoord+1].x, array[ycoord+1][xcoord+1].y, array[ycoord+2][xcoord].x, array[ycoord+2][xcoord].y);
     
    }
  }
  print("\n");

  //for(int j = 1; j < ydots-2; j+=1) {
  //  for(int i = 0; i < xdots-1; i+=1) {
  //    line(array[j][i].x, array[j][i].y, array[j+2][i].x, array[j+2][i].y);
  //  }
  //}
}
