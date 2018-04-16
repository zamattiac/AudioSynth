#include "cosine.h"
#include <PWM.h>
#define SPEAKER 11
#define NUMBER_NOTES 12

boolean notes[NUMBER_NOTES];
char note_pointer[NUMBER_NOTES] = {0};
char output;

void setup() {

  InitTimers();
  SetPinFrequency(SPEAKER, 250000);
  
  // put your setup code here, to run once:
  // Serial.begin(9600);
}

void updateNotes() {
  int noteNumbers[4];
  noteNumbers[0] = analogRead(A3);
  noteNumbers[1] = analogRead(A2);
  noteNumbers[2] = analogRead(A1);
  noteNumbers[3] = analogRead(A0);

  for(int i = 0; i<4; i++) {
    if (noteNumbers[i]>=811 and noteNumbers[i]<=815) {
      notes[i*3] = true;
      notes[1+i*3] = false;
      notes[2+i*3] = false;
    } else if (noteNumbers[i]>=652 and noteNumbers[i]<=656) {
      notes[i*3] = true;
      notes[1+i*3] = true;
      notes[2+i*3] = false;
    } else if (noteNumbers[i]>=459 and noteNumbers[i]<=464) {
      notes[i*3] = false;
      notes[1+i*3] = false;
      notes[2+i*3] = true;
    } else if (noteNumbers[i]>=867 and noteNumbers[i]<=872) {
      notes[i*3] = true;
      notes[1+i*3] = true;
      notes[2+i*3] = false;
    } else if (noteNumbers[i]>=736 and noteNumbers[i]<=742) {
      notes[i*3] = false;
      notes[1+i*3] = true;
      notes[2+i*3] = true;
    } else if (noteNumbers[i]>=840 and noteNumbers[i]<=849) {
      notes[i*3] = true;
      notes[1+i*3] = false;
      notes[2+i*3] = true;
    } else if (noteNumbers[i]>=880 and noteNumbers[i]<=890) {
      notes[i*3] = true;
      notes[1+i*3] = true;
      notes[2+i*3] = true;
    } else {
      notes[i*3] = false;
      notes[1+i*3] = false;
      notes[2+i*3] = false;
    }
  }
}

void loop() {
  output = 0;
  // put your main code here, to run repeatedly:
  updateNotes();
  for (int i = 0; i < NUMBER_NOTES + 1; i++) {
    if (notes[i]) {
      note_pointer[i] += 1;
      output += cos_wave[note_pointer[i]];
    }
    else {
      note_pointer[i] = 0;
    }
  }
//  Serial.print("Notes : ");
//  for (int i = 0; i<12; i++) {
//    Serial.print(notes[i]);
//  }
//  Serial.println();
//  if (notes[0]) {
//    note_pointer[0] += 1;
//    output += cos_wave[note_pointer[0]];
//    //tone(SPEAKER, 261);
//  } else {
//    note_pointer[0] = 0;
//  }

  output /= NUMBER_NOTES;
  pwmWrite(SPEAKER, output);
  
}



