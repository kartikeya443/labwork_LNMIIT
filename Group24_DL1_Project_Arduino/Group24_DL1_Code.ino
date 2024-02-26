#include <Servo.h>
#include <LiquidCrystal.h>
 
Servo servo_dl;
LiquidCrystal lcd(7, 6, 5, 4, 3, 2); // Generates an LCD output.
 
int pos = 0; // Initial position of the servo motor
const int trigPin = 9;
const int echoPin = 10;
const int motor = 11;
const int buzzer = 12;
const int led1 = 14;
const int led2 = 15;
float dist_cm, dist_sec,duration;
 
void setup() {
            servo_dl.attach(motor); // Attach servo motor to pin number 11
            lcd.begin(16,2); // Initialize LCD interface with the dimensions
                
            pinMode(trigPin, OUTPUT);
            pinMode(echoPin, INPUT);
            pinMode(buzzer, OUTPUT);
            pinMode(led1, OUTPUT);
            pinMode(led2, OUTPUT);
            dist_sec=20;
 
}
 
void loop() {
      for (pos = 0; pos <= 180; pos += 1) { 
  
                        servo_dl.write(pos); // Program the Servo to go to the position (pos)
                        digitalWrite(trigPin, LOW);
                        delayMicroseconds(2);
                        digitalWrite(trigPin, HIGH); // Send a 10 microsecond pulse
                        delayMicroseconds(10);
                        digitalWrite(trigPin, LOW);
 
                        duration = pulseIn(echoPin, HIGH);
                        dist_cm= duration*0.034/2;
                        if (dist_cm <= dist_sec)
                                      {
                                      if(dist_cm <= dist_sec/2)
                                      {
                                        tone(buzzer, 10); // Send 1KHz sound signal.
                                        digitalWrite(led1, LOW);
                                        digitalWrite(led2, HIGH);
                                        delay(700);
                                        noTone(buzzer); // Stop sound.
                                        lcd.setCursor(0,0); // Position the cursor at 0.0
                                        lcd.print("Distance: "); // Print "Distance" on LCD
                                        lcd.print(dist_cm); // Print the obtained value on LCD
                                        lcd.print(" cm "); // Print unit on LCD
                                        delay(10);
                                        lcd.setCursor(0,1);
                                        lcd.print("Angle : ");
                                        lcd.print(pos);
                                        lcd.print(" deg ");
                                        delay(2000);
                                      }
                                    else
                                    {
                                        digitalWrite(buzzer, HIGH);
                                        digitalWrite(led2, LOW);
                                        digitalWrite(led1, HIGH);
                                        delay(100);
                                        digitalWrite(buzzer, LOW);
                                        lcd.setCursor(0,0); // Position the cursor at 0.0
                                        lcd.print("Distance: "); // Print "Distance" on LCD
                                        lcd.print(dist_cm); // Print the obtained value on LCD
                                        lcd.print(" cm "); // Print unit on LCD
                                        delay(10);
                                        lcd.setCursor(0,1);
                                        lcd.print("Angle : ");
                                        lcd.print(pos);
                                        lcd.print(" deg ");
                                        delay(2000);
                                        }
                                    }
                                    else{
                                        digitalWrite(buzzer, LOW);
                                        digitalWrite(led1, LOW);
                                        digitalWrite(led2, LOW);
                                        }
 
                      lcd.setCursor(0,0); // Position the cursor at 0.0
                      lcd.print("Distance: "); // Print "Distance" on LCD
                      lcd.print(dist_cm); // Print the obtained value on LCD
                      lcd.print(" cm "); // Print unit on LCD
                      delay(10);
                      lcd.setCursor(0,1);
                      lcd.print("Angle : ");
                      lcd.print(pos);
                      lcd.print(" deg ");
                      delay(80); // Wait 80ms for the servo to seek its position
                       
                      }

for (pos = 180; pos >= 0; pos -= 1) {
                      servo_dl.write(pos);
                      digitalWrite(trigPin, LOW);
                      delayMicroseconds(2);
                      digitalWrite(trigPin, HIGH);
                      delayMicroseconds(10);
                      digitalWrite(trigPin, LOW);
                       
                      duration = pulseIn(echoPin, HIGH);
                      dist_cm= duration*0.034/2;
                      if (dist_cm <= dist_sec){
                      if(dist_cm <= dist_sec/2)
                                            {
                                            tone(buzzer, 10); // Send 1KHz sound signal.
                                            digitalWrite(led1, LOW);
                                            digitalWrite(led2, HIGH);
                                            delay(700);
                                            noTone(buzzer); // Stop sound.
                                            lcd.setCursor(0,0); // Position the cursor at 0.0
                                            lcd.print("Distance: "); // Print "Distance" on LCD
                                            lcd.print(dist_cm); // Print the obtained value on LCD
                                            lcd.print(" cm "); // Print unit on LCD
                                            delay(10);
                                            lcd.setCursor(0,1);
                                            lcd.print("Angle : ");
                                            lcd.print(pos);
                                            lcd.print(" deg ");
                                            delay(2000);
                                            }
                              else
                              {
                                            digitalWrite(buzzer, HIGH);
                                            digitalWrite(led2, LOW);
                                            digitalWrite(led1, HIGH);
                                            delay(100);
                                            digitalWrite(buzzer, LOW);
                                            lcd.setCursor(0,0); // Position the cursor at 0.0
                                            lcd.print("Distance: "); // Print "Distance" on LCD
                                            lcd.print(dist_cm); // Print the obtained value on LCD
                                            lcd.print(" cm "); // Print unit on LCD
                                            delay(10);
                                            lcd.setCursor(0,1);
                                            lcd.print("Angle : ");
                                            lcd.print(pos);
                                            lcd.print(" deg ");
                                            delay(2000);
                                            }
                      }
                      else{
                            digitalWrite(buzzer, LOW);
                            digitalWrite(led1, LOW);
                            digitalWrite(led2, LOW);
                            }
 
                      lcd.setCursor(0,0); //
                      lcd.print("Distance: "); //
                      lcd.print(dist_cm); //
                      lcd.print(" cm ");
                      delay(10);
                      lcd.setCursor(0,1);
                      lcd.print("Angle : ");
                      lcd.print(pos);
                      lcd.print(" deg ");
                      delay(80);
                      }
}
