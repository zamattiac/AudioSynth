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
#include <EventDelay.h>
#include "pitches.h"
#include "cos.h"
//#include "oboec.h"
#include "trumpeta.h"
//#include "trumpetg.h"
//#include "trumpeta16.h"
//#include "pianoc.h"

// use: Oscil <table_size, update_rate> oscilName (wavetable), look in .h file of table #included above
Oscil <COS_NUM_CELLS, AUDIO_RATE> aSin(COS_DATA);
//Oscil <oboec_NUM_CELLS, AUDIO_RATE> aSin(oboec_DATA);
//Oscil <trumpeta_NUM_CELLS, AUDIO_RATE> aSin (trumpeta_DATA);
//Oscil <trumpeta16_NUM_CELLS, AUDIO_RATE> aSin(trumpeta16_DATA);
//Oscil <pianoc_NUM_CELLS, AUDIO_RATE> aSin(pianoc_DATA);
boolean is_pure = true;

EventDelay dlay(500);

// use #define for CONTROL_RATE, not a constant
#define CONTROL_RATE 64 // powers of 2 please

void setup(){
  startMozzi(CONTROL_RATE); // set a control rate of 64 (powers of 2 please)
  aSin.setFreq(0); // set the frequency
}


void updateControl(){
  int A3Read = mozziAnalogRead(A3);
  int A2Read = mozziAnalogRead(A2);
  int A1Read = mozziAnalogRead(A1);
  int A0Read = mozziAnalogRead(A0);
    if (A3Read > 700) {
      aSin.setFreq(NOTE_C5);
    }
    else if (A3Read > 600) {
      aSin.setFreq(NOTE_D5);
    }
    else if (A3Read > 100) {
      aSin.setFreq(NOTE_E5);
    }
    else if (A2Read > 700) {
      aSin.setFreq(NOTE_F5);
    }
    else if (A2Read > 600) {
      aSin.setFreq(NOTE_G5);
    }
    else if (A2Read > 100) {
      aSin.setFreq(NOTE_A5);
    }
    else if (A1Read > 700) {
//      aSin.setFreq(NOTE_B5);
//    }
//    else if (A1Read > 600) {
      if (dlay.ready()) {
        if (is_pure) {
          aSin.setTable(trumpeta_DATA);
          is_pure = false;
        }
        else {
          aSin.setTable(COS_DATA);
          is_pure = true;
        }
        dlay.start();
      }
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





