int point_count = 25000; // Amount of points
ArrayList points; // Holds all the points
PGraphics symbol; // Allows us to edit symbol
PFont font; // What font we are using
String s = "I"; // What character we want

// For a random background
int[][] bg = { {121,203,255},
               {230,240,36 },
               {255,255,255},
               {0  ,0  ,0  },
               //{44 ,252  ,8},
               {0  ,185,222},
               {105,230,255},
               };
               
int ran = (int)random(bg.length);
             
int r = bg[ran][0];
int g = bg[ran][1];
int b = bg[ran][2];


// Runs on startup
void setup() {
  background(r,g,b); // Black background
  size(1000, 1000); // Canvas size
  symbol = createGraphics(width, height); // Canvas size
  font = loadFont("C059-Roman-48.vlw"); // Load in our font
  points = new ArrayList(); // Creates our array list
  execute(); // Runs execute
}

void draw() { //Draws everything in
  background(r,g,b); // Our random background

  // Plots out every point in our array
  for (int i=0; i<points.size (); i++) {
    Point mb = (Point) points.get(i);
    mb.run();
  }  
}

void execute() {  
  symbol.beginDraw(); // Draw out our symbol
  symbol.background(255); // Gives our symbol a background. Used to help plot points
  symbol.fill(0); // Gives our symbol a fill
  symbol.textFont(font, 1000); // Create our font and font size
  symbol.textAlign(CENTER); // Centers text
  symbol.text(s, 500, 850); // Lets us set position
  symbol.endDraw(); // Finish drawing
  symbol.loadPixels(); // Show drawing

  for (int i=0; i<point_count; i++) { // Create each point
    int x = (int)random(width); // Random x position
    int y = (int)random(height); // Random y position
    int p = symbol.pixels[x+y*height]; // Creates a random pixel
    if (brightness(p)<255) { // Only if our pixel is on the letter
      PVector loc = new PVector(x, y); // Puts down our new point
      Point mp = new Point(loc); // Create a new point
      points.add(mp); // Add point to array
    }
  }
}

class Point {

  PVector loc;
  float num;
  
  // Random line colors
  float r = random(255);
  float g = random(255);
  float b = random(255);

  Point(PVector _loc) {
    loc = _loc;
  }

  void run() {
    show();
    connect();
  }

  void connect() {
    for (int i=0; i<points.size(); i++) {
      Point op = (Point)points.get(i); // Get each point
      float distance = loc.dist(op.loc); // Calculate distance difference
      if (distance < 20 && distance > -20) { // If it is close enough
        num = map(1,0,10,15,255); // Semi-random number
        stroke(r, g, b, num); // Generate a random color
        line(loc.x, loc.y, op.loc.x, op.loc.y); // Create our line between points
      } 

    }
  }

  // Shows our lines
  void show() {
    noStroke();
    fill(255, 200);
  }
}
