/* To use this cd into arduino-serial folder
    ./arduino-serial -b 9600 -p /dev/cu.usbmodem1411 -s THECHARACTER
*/

/* IMPORTANT: To turn on a device, a LOW signal has to be sent! NOT HIGH!! */

#include <MOS.h>
#include <Wire.h> // Enable this line if using Arduino Uno, Mega, etc.
#include <elapsedMillis.h>

int val = 0;       // variable to store the data from the serial port

int clockPin = 12;
int fanPin = 6;
int poochiPin = 5;
int lampPin = 4;
int floorlampPin = 3;
int recordPin = 2;

boolean angry = false;

void setup() {
  for (int i = 2; i <= 5; i++) {
    pinMode(i, OUTPUT);
  }

  Serial.begin(9600);        // connect to the serial port

  for (int i = 2; i <= 5; i++) {
    digitalWrite(i, HIGH);
  }
}

void loop () {
  if (Serial.available()) {
    val = Serial.read();      // read the serial port

    switch (val) {
      case '0':
        angry = true;
        break;
      case '1':
        digitalWrite(recordPin, LOW);
        break; 
      case '3':
        digitalWrite(poochiPin, LOW);
        break;
      case '4':
        digitalWrite(lampPin, LOW);
        digitalWrite(fanPin, LOW);
        break;
      case '5':
        digitalWrite(floorlampPin, LOW);
        digitalWrite(clockPin, LOW);
        break;

      // turn off everything
      case 'x':
        angry = false;
        for (int i = 2; i <= 5; i++) {
          digitalWrite(i, HIGH);
        }
        break;
    }

    MOS_Call(angryLights);
  }
}

void angryLights(PTCB tcb) {
  MOS_Continue(tcb);
  while (1) {
    MOS_WaitForCond(tcb, angry);
    digitalWrite(floorlampPin, LOW);
    digitalWrite(lampPin, LOW);
    
    MOS_Delay(tcb, 1000);
    
    digitalWrite(floorlampPin, HIGH);
    digitalWrite(lampPin, HIGH);
    MOS_Delay(tcb, 2000);

    digitalWrite(floorlampPin, LOW);
    digitalWrite(lampPin, LOW);
    
    MOS_Delay(tcb, 500);
    
    digitalWrite(floorlampPin, HIGH);
    digitalWrite(lampPin, HIGH);
    MOS_Delay(tcb, 500);

    digitalWrite(floorlampPin, LOW);
    digitalWrite(lampPin, LOW);
    
    MOS_Delay(tcb, 500);
    
    digitalWrite(floorlampPin, HIGH);
    digitalWrite(lampPin, HIGH); 

    MOS_Delay(tcb, 2000);
  }

}

