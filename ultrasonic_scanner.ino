#include <SoftwareSerial.h>
#include <SR04.h>
#include <Stepper.h>

// Set up serial on pins 2 and 3.
SoftwareSerial softSerial(2, 3);

// Set up motor driver pins.
Stepper motor = Stepper(8, 10, 9 , 11);

// define ultrasonic sensor pins.
int trigger = 7;
int echo = 6;
SR04 sr04 = SR04(echo, trigger);
int distance

String data;
boolean on = false;

void setup() {
  softSerial.begin(9600);
}

void loop() {
  if (softSerial.available()) {
    data = softSerial.read();
    on = data.equals("start")
  }

  if (on) {
    // Begin rotating CW when the start signal is received.
    motor.setSpeed(300);
    motor.step(2048);
    distance = sr04.Distance();
    softSerial.write(distance);
  } else {
    // Stop rotation when not on.
    motor.setSpeed(0);
  }
}
