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

int LoopLength = 40;
int CurrLoop = 0;

int LoopPosition = 0;

int CurrNote;
unsigned int NoteDuration;

boolean playingNote = false;
boolean playSong = false;

boolean angry = false;

int SongLoop [40][2] = {
  {KE2, 250}, {KDS2, 250},
  {KE2, 250}, {KDS2, 250}, {KE2, 250}, {KB1, 250}, {KD2, 250}, {KC2, 250},
  {KA1, 500}, {REST, 250}, {KC1, 250}, {KE1, 250}, {KA1, 250},
  {KB1, 500}, {REST, 250}, {KE1, 250}, {KGS1, 250}, {KB1, 250},
  {KC2, 500}, {REST, 250}, {KE1, 250}, {KE2, 250}, {KDS2, 250},
  {KE2, 250}, {KDS2, 250}, {KE2, 250}, {KB1, 250}, {KD2, 250}, {KC2, 250},
  {KA1, 500}, {REST, 250}, {KC1, 250}, {KE1, 250}, {KA1, 250},
  {KB1, 500}, {REST, 250}, {KE1, 250}, {KC2, 250}, {KB1, 250},
  {KA1, 1000}

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
      case '2':
        angry = true;
        
        break;
    }

  }

  if (!playingNote && angry) {
    digitalWrite(KG1, HIGH);
    digitalWrite(KA1, HIGH);
    digitalWrite(KB1, HIGH);
    digitalWrite(KC2, HIGH);
    digitalWrite(KD2, HIGH);

    noteStartTime = startMillis;
    NoteDuration = 1000;
    playingNote = true;

  }

  else if (playSong && LoopPosition < LoopLength) {
    if (!playingNote) {
      CurrNote = SongLoop[LoopPosition][0];
      NoteDuration = SongLoop[LoopPosition][1];

      if(CurrNote != REST) {
        digitalWrite(CurrNote, HIGH);
      }

      noteStartTime = startMillis;
      LoopPosition++;
      playingNote = true;

    }

  }

  if (playingNote && startMillis - noteStartTime >= NoteDuration) {
    liftKeys();
  }
}

void liftKeys() {
  playingNote = false;
  angry = false;

  for (int i = 2; i < 22; i++) {
    digitalWrite(i, LOW);
  }
  for (int i = 22; i <= 30; i += 2) {
    digitalWrite(i, LOW);
  }
}
