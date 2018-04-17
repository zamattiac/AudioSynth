#include "pitches.h"

#define NUMBER_NOTES 7

int buzzerPin = 0;
int buttonAPin = 0;

byte Aout = 128;
byte out = 0;

void setup() {
  pinMode(buttonAPin, INPUT);
  pinMode(buzzerPin, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  
  if (digitalRead(buttonAPin)) {
    if (millis() & 0xFF == 0) {
      Aout++;
    }
  }
  else { Aout = 128; }
  analogWrite(Aout / NUMBER_NOTES);
  
}
