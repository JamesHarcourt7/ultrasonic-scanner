import controlP5.*;
import processing.serial.*;

Serial port;
ControlP5 controller;
String receivedData;
int[] distances;
int range;
int angle;
float x;
float y;

void setup() {
  // Open the serial port.
  port = new Serial(this, Serial.list()[1], 9600);
  
  distances = new int[360];
  range = 200;
  angle = 0;
  
  controller.addButton("Start")
            .setPosition(20, 20)
            .setSize(50, 20)
            .setColorBackground(color(0, 200, 0));
  
  size(800, 800);
}

void draw() {
  background(0);
  noFill();
  strokeWeight(4);
  stroke(color(0, 200, 0));
  circle(400, 400, 600);
  
  x = 300 * cos(radians(angle));
  y = 300 * sin(radians(angle));
  line(400, 400, 400 - x, 400 - y);
  
  // REMOVE LATER
  angle ++;
}

void serialEvent(Serial port) {
  receivedData = port.readStringUntil('\n');
  System.out.println(receivedData);
  /*
  
  distances[angle] = parseInt(receivedData);
  angle ++;
  if (angle == 360) angle = 0;
  
  */
} 
