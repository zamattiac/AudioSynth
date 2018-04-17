/*  Example playing a sinewave at a set frequency,
    using Mozzi sonification library.
  
    Demonstrates the use of Oscil to play a wavetable.
  
    Circuit: Audio output on digital pin 9 on a Uno or similar, or
    DAC/A14 on Teensy 3.1, or 
    check the README or http://sensorium.github.com/Mozzi/
  
    Mozzi help/discussion/announcements:
    https://groups.google.com/forum/#!forum/mozzi-users
  
    Tim Barrass 2012, CC by-nc-sa.
*/

//#include <ADC.h>  // Teensy 3.1 uncomment this line and install http://github.com/pedvide/ADC
#include <MozziGuts.h>
#include <Oscil.h> // oscillator template
#include "pitches.h"
//#include "cos.h"
#include "oboec.h"
#include "trumpeta.h"

// use: Oscil <table_size, update_rate> oscilName (wavetable), look in .h file of table #included above
//Oscil <COS_NUM_CELLS, AUDIO_RATE> aSin(COS_DATA);
//Oscil <oboec_NUM_CELLS, AUDIO_RATE> aSin(oboec_DATA);
Oscil <trumpeta_NUM_CELLS, AUDIO_RATE> aSin(trumpeta_DATA);

// use #define for CONTROL_RATE, not a constant
#define CONTROL_RATE 64 // powers of 2 please

void setup(){
  startMozzi(CONTROL_RATE); // set a control rate of 64 (powers of 2 please)
  aSin.setFreq(0); // set the frequency
}


void updateControl(){
  Serial.println(mozziAnalogRead(A3));
  int A3Read = mozziAnalogRead(A3);
  int A2Read = mozziAnalogRead(A2);
  int A1Read = mozziAnalogRead(A1);
  int A0Read = mozziAnalogRead(A0);
    if (A3Read > 700) {
      aSin.setFreq(NOTE_C7);
    }
    else if (A3Read > 600) {
      aSin.setFreq(NOTE_B6);
    }
    else if (A3Read > 100) {
      aSin.setFreq(NOTE_A6);
    }
    else if (A2Read > 700) {
      aSin.setFreq(NOTE_G6);
    }
    else if (A2Read > 600) {
      aSin.setFreq(NOTE_F6);
    }
    else if (A2Read > 100) {
      aSin.setFreq(NOTE_E6);
    }
    else if (A1Read > 700) {
      aSin.setFreq(NOTE_D6);
    }
    else if (A1Read > 600) {
      aSin.setFreq(NOTE_C6);
    }
    else {
      aSin.setFreq(0);
    }
    
}


int updateAudio(){
  return aSin.next(); // return an int signal centred around 0
}


void loop(){
  audioHook(); // required here
}



