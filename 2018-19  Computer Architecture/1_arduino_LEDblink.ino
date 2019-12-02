/* Computer Architecture 2018-19 - 
   Ricardo Costa (José Costa)
   
   Task:
   Making a LED turn ON for 1 second, then off for another second, repeatedly using a arduino.
*/

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);       // initialize digital pin LED_BUILTIN as an output.
}

void loop() {
  digitalWrite(LED_BUILTIN, HIGH);    // turn the LED on (HIGH is the voltage level)
  delay(1000);                        // wait for a second
  digitalWrite(LED_BUILTIN, LOW);     // turn the LED off by making the voltage LOW
  delay(1000);                        // wait for a second
}
