/* To use this cd into arduino-serial folder
 *  ./arduino-serial -b 9600 -p /dev/cu.usbmodem1411 -s THECHARACTER
 */

/* IMPORTANT: To turn on a device, a LOW signal has to be sent! NOT HIGH!! */

#include <Wire.h> // Enable this line if using Arduino Uno, Mega, etc.
#include <elapsedMillis.h>

int val = 0;       // variable to store the data from the serial port

int clockPin = 12;
int microscope2Pin = 7;
int microscope1Pin = 6;
int poochiPin = 5;
int lampPin = 4;
int radioPin = 3;
int recordPin = 2; 

void setup() {
  for(int i = 2; i <= 5; i++) {
    pinMode(i,OUTPUT);
  }
  
  Serial.begin(9600);        // connect to the serial port

  for(int i = 2; i <= 5; i++) {
    digitalWrite(i, HIGH);
  }
}

void loop () {
  if(Serial.available()) {
    val = Serial.read();      // read the serial port 

    switch(val) { 
      case '0': 
        digitalWrite(lampPin, LOW);
        break;
      case '1': 
        digitalWrite(lampPin, LOW);
        digitalWrite(recordPin, LOW);
        break;
      case '2': 
        digitalWrite(radioPin, LOW);
        break;
      case '3': 
        digitalWrite(poochiPin, LOW);
        break;
      case '4': 
        digitalWrite(microscope1Pin, LOW);
        digitalWrite(microscope2Pin, LOW);
        break;
      case '5': 
        digitalWrite(clockPin, LOW); 
        break;

      // testing purposes only
      case 'x': 
        for(int i = 2; i <= 5; i++) {
          digitalWrite(i, HIGH);
        }
        break;
    }
    
  }

  
}
