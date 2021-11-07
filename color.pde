// 2D Array of objects
Cell[][] grid;

// Number of columns and rows in the grid
int cols = 10;
int rows = 10;
void setup()
{
  size(600,600);
  smooth(); 
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*60,j*60,60,60,i+j);
    }
  } 
}
void draw()
{
  if(mousePressed)
  {      
     if(mouseButton==LEFT)
     {
        background(255);
        noFill();
        for(int d=0;d<75;d+=4)
        {
          for(int x1=0;x1<650;x1+=75)
          {
            for(int y1=0;y1<650;y1+=75)
            {
              stroke(random(255),random(255),120);
              strokeWeight(4);
              ellipse(x1,y1,d,d);
            }
          }
        }
      }
    else if(mouseButton==RIGHT)
    {
      background(255);
      for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows; j++) {
          // Oscillate and display each object
          grid[i][j].oscillate();
          grid[i][j].display();
        }
      }
    }
  }
}
// A Cell object
class Cell {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x,y;   // x,y location
  float w,h;   // width and height
  float angle; // angle for oscillating brightness

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
  } 
  
  // Oscillation means increase angle
  void oscillate() {
    angle += 0.08; 
  }

  void display() {
    stroke(255);
    strokeWeight(2);
    // Color calculated using sine wave
    fill(127+127*sin(angle));
    rect(x,y,w,h); 
  }
}
