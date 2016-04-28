#include <Wire.h> // Enable this line if using Arduino Uno, Mega, etc.

// notes
#define KC1     2
#define KCS1    3
#define KD1     4
#define KDS1    5
#define KE1     6
#define KF1     7
#define KFS1    8
#define KG1     9
#define KGS1    10
#define KA1     11
#define KAS1    12
#define KB1     13
#define KC2     14
#define KCS2    15
#define KD2     16
#define KDS2    17
#define KE2     18
#define KF2     19
#define KFS2    20
#define KG2     21
#define KGS2    22
#define KA2     24
#define KAS2    26
#define KB2     28
#define KC3     30

#define REST    -1
#define OSHIT   -2

// note to self: always use unsigned long w/ millis or else time would become negative....
unsigned long startMillis;
unsigned long noteStartTime;

int LoopLength = 45;
int CurrLoop = 0;

int LoopPosition = 0;

int CurrNote;
unsigned int NoteDuration;

boolean playingNote = false;
boolean playSong = false;

int Loops [2][40][2] = {
  {
    {KE2, 125}, {KDS2, 125}, 
    {KE2, 125}, {KDS2, 125}, {KE2, 125}, {KB1, 125}, {KD2, 125}, {KC2, 125}, 
    {KA1, 250}, {REST, 125}, {KC1, 125}, {KE1, 125}, {KA1, 125},
    {KB1, 250}, {REST, 125}, {KE1, 125}, {KGS1, 125}, {KB1, 125},
    {KC2, 250}, {REST, 125}, {KE1, 125}, {KE2, 125}, {KDS2, 125}, 
    {KE2, 125}, {KDS2, 125}, {KE2, 125}, {KB1, 125}, {KD2, 125}, {KC2, 125}, 
    {KA1, 250}, {REST, 125}, {KC1, 125}, {KE1, 125}, {KA1, 125},
    {KB1, 250}, {REST, 125}, {KE1, 125}, {KC2, 125}, {KB1, 125},
    {KA1, 500}
  },
  
  {
    {OSHIT, 10000}
  }
};

void setup() {
  for (int i = 2; i < 22; i++) {
    pinMode(i, OUTPUT);
  }

  for (int j = 22; j <= 30; j += 2) {
    pinMode(j, OUTPUT);
  }

  Serial.begin(9600);
}


void loop() {
  startMillis = millis();

  if (Serial.available()) {
    int val = Serial.read();
    Serial.println(val);

    switch (val) {
      case '0':
        playSong = true;
        break;
      case '1':
        playSong = false;
        LoopPosition = 0;
        liftKeys();
        break;

      // turn off everything
      case 'x':
        break;
    }

  }

  if (playSong && LoopPosition < LoopLength) {
    if (!playingNote) {
      CurrNote = Loops[CurrLoop][LoopPosition][0];
      NoteDuration = Loops[CurrLoop][LoopPosition][1];

      if (CurrNote == OSHIT) {
        digitalWrite(KG1, HIGH);
        digitalWrite(KA1, HIGH);
        digitalWrite(KB1, HIGH);
        digitalWrite(KC2, HIGH);
        digitalWrite(KD2, HIGH);

      }

      else {
        digitalWrite(CurrNote, HIGH);
      }

      noteStartTime = startMillis;
      LoopPosition++;
      playingNote = true;

    }

    else if (playingNote && startMillis - noteStartTime >= NoteDuration) {
      liftKeys();

    }
  }
}

void liftKeys() {
  playingNote = false;

  for (int i = 2; i < 22; i++) {
    digitalWrite(i, LOW);
  }
  for (int i = 22; i <= 30; i += 2) {
    digitalWrite(i, LOW);
  }
}
