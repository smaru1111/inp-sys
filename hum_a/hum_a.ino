const int ledPin = 4;
const int pirPin = 2;
 
void setup() {
  // put your setup code here, to run once:
  // シリアル通信速度
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);
}
 
void loop() {
  // put your main code here, to run repeatedly:
  if (digitalRead(pirPin) == LOW) {
    digitalWrite(ledPin, HIGH);
    Serial.write(1);
    delay(100);
  } else {
    digitalWrite(ledPin, LOW);
    Serial.write(0);
  }
}