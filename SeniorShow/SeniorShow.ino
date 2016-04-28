/* IMPORTANT: To turn on a device, a LOW signal has to be sent! NOT HIGH!! */

#include <MOS.h>
#include <Wire.h> // Enable this line if using Arduino Uno, Mega, etc.

int val = 0;       // variable to store the data from the serial port

int clockPin = 12;
int pianolampPin = 7;
int fanPin = 6;
int poochiPin = 5;
int tablelampPin = 4;
int floorlampPin = 3;
int recordPin = 2;

boolean angry = false;

void setup() {
  for (int i = 2; i <= 9; i++) {
    pinMode(i, OUTPUT);
  }
  pinMode(clockPin, OUTPUT);

  Serial.begin(9600);        // connect to the serial port

  for (int i = 2; i <= 9; i++) {
    digitalWrite(i, HIGH);
  }
  digitalWrite(clockPin, LOW);
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
        digitalWrite(tablelampPin, LOW);
        digitalWrite(fanPin, LOW);
        break;
      case '5':
        digitalWrite(floorlampPin, LOW);
        delay(1000);
        digitalWrite(clockPin, HIGH);
        break;
      case '6':
        digitalWrite(pianolampPin, LOW);
        break;

      // turn off everything
      case 'x':
        angry = false;
        for (int i = 2; i <= 9; i++) {
          digitalWrite(i, HIGH);
        }
        digitalWrite(clockPin, LOW);
        break;
    }

  }

  MOS_Call(angryLights);
}

void angryLights(PTCB tcb) {
  MOS_Continue(tcb);
  while (1) {
    MOS_WaitForCond(tcb, angry);
    digitalWrite(floorlampPin, LOW);
    digitalWrite(tablelampPin, LOW);

    MOS_Delay(tcb, 250);

    digitalWrite(floorlampPin, HIGH); 
    MOS_Delay(tcb, 500);

    digitalWrite(floorlampPin, LOW); 

    MOS_Delay(tcb, 125);

    digitalWrite(floorlampPin, HIGH); 
    MOS_Delay(tcb, 125);

    digitalWrite(floorlampPin, LOW); 

    MOS_Delay(tcb, 125);

    digitalWrite(floorlampPin, HIGH);
    
    MOS_Delay(tcb, 2000);
    digitalWrite(tablelampPin, HIGH);
  }

}

