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
#include <tables/sin2048_int8.h> // sine table for oscillator
//#include "gen_trumpet_a.h"

// use: Oscil <table_size, update_rate> oscilName (wavetable), look in .h file of table #included above
Oscil <SIN2048_NUM_CELLS, AUDIO_RATE> aSin(SIN2048_DATA);
//Oscil <gentrumpeta_NUM_CELLS, AUDIO_RATE> aSin(gentrumpeta_DATA);

// use #define for CONTROL_RATE, not a constant
#define CONTROL_RATE 64 // powers of 2 please

void setup(){
  startMozzi(CONTROL_RATE); // set a control rate of 64 (powers of 2 please)
  aSin.setFreq(0); // set the frequency
  Serial.begin(9600);
}


void updateControl(){
  Serial.println(mozziAnalogRead(A3));
  int A3Read = mozziAnalogRead(A3);
  int A2Read = mozziAnalogRead(A2);
  int A1Read = mozziAnalogRead(A1);
  int A0Read = mozziAnalogRead(A0);
  Serial.println(A3); 
    if (A3Read > 700) {
      aSin.setFreq(1976);
    }
    else if (A3Read > 600) {
      aSin.setFreq(1760);
    }
    else if (A3Read > 100) {
      aSin.setFreq(1568);
    }
    else if (A2Read > 700) {
      aSin.setFreq(1397);
    }
    else if (A2Read > 600) {
      aSin.setFreq(1319);
    }
    else if (A2Read > 100) {
      aSin.setFreq(1175);
    }
    else if (A1Read > 700) {
      aSin.setFreq(1047);
    }
    else if (A1Read > 600) {
      aSin.setFreq(988);
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



